
gulp = require('gulp')
coffee = require('gulp-coffee')
coffeelint = require('gulp-coffeelint')
concat = require('gulp-concat')
gutil = require('gulp-util')
stylish = require('coffeelint-stylish')

paths =
  coffee: ['./src/*.coffee']

gulp.task 'default', ['coffee', 'lint']

gulp.task 'coffee', ->
  gulp.src(paths.coffee)
  .pipe(coffee(bare: true).on('error', gutil.log))
  .pipe(concat('app.js'))
  .pipe gulp.dest('./')

gulp.task 'lint', ->
  gulp.src('./src/*.coffee')
  .pipe(coffeelint())
  .pipe(coffeelint.reporter(stylish))

gulp.task 'watch', ->
  gulp.watch paths.coffee, ['coffee', 'lint']