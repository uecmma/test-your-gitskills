gulp = require 'gulp'
$ = do require 'gulp-load-plugins'

Fs       = require 'fs'
Path     = require 'path'
merge    = require 'merge2'
through2 = require 'through2'
markdownlint = require 'markdownlint'
runSequence  = require 'run-sequence'

$.markdownlint = (filename = '.markdownlint.json') ->
  config = try
    JSON.parse Fs.readFileSync filename
  catch err
    undefined

  through2.obj (file, enc, next) ->
    filePath = Path.relative process.cwd(), file.path

    markdownlint
      files: [ filePath ]
      config: config
    ,
      (err, result) ->
        resultString = (result || '').toString()

        file.markdownLintResult = resultString if resultString
        next err, file

$.markdownlint.reporter = ->
  failures = []

  stream = through2.obj (file, enc, next) ->
    failures.push file.markdownLintResult if file.markdownLintResult
    next undefined, file

  stream
    .on 'end', ->
      if failures.length > 0
        console.log "Report #{failures.length} errors:"
        failures.forEach (failure) ->
          console.log "    #{failure.toString()}"

        this.emit 'error', new Error 'markdownlint reports some errors'

tsProject = $.typescript.createProject 'tsconfig.json',
  sortOutput: true
  typescript: require 'typescript'

gulp.task 'lint:ts', ->
  gulp.src [
    'src/**/*.ts'
  ]
    .pipe $.tslint()
    .pipe $.tslint.report()

gulp.task 'lint:md', ->
  gulp.src [
    'README.md'
    'book/**/*.md'
    'assets/resources/**/*.md'
  ], { read: false }
    .pipe $.markdownlint '.markdownlint.json'
    .pipe $.markdownlint.reporter()

gulp.task 'lint', (cb) ->
  runSequence 'lint:ts'
    , 'lint:md'
    , cb

gulp.task 'build', ->
  tsResult = gulp.src [
    'src/**/*.ts'
  ]
    .pipe $.typescript tsProject

  merge [
    tsResult.js
    tsResult.dts
  ]
    .pipe gulp.dest 'dist'

gulp.task 'test', ->
  console.log 'nothing to do'
