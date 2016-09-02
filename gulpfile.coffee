gulp = require 'gulp'
$ = do require 'gulp-load-plugins'

merge = require 'merge2'

tsProject = $.typescript.createProject 'tsconfig.json',
  sortOutput: true
  typescript: require 'typescript'

gulp.task 'lint', ->
  gulp.src [
    'src/**/*.ts'
  ]
    .pipe $.tslint()

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
