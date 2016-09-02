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
    Fs.readFileSync filename
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

        console.log resultString if resultString
        next err, file


tsProject = $.typescript.createProject 'tsconfig.json',
  sortOutput: true
  typescript: require 'typescript'

gulp.task 'lint:ts', ->
  gulp.src [
    'src/**/*.ts'
  ]
    .pipe $.tslint()

gulp.task 'lint:md', ->
  gulp.src [
    'book/**/*.md'
    'assets/resources/**/*.md'
  ], { read: false }
    .pipe $.markdownlint '.markdownlint.json'

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
