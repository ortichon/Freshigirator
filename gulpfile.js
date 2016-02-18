var gulp  = require('gulp'),
	gutil = require('gulp-util'),
	sass = require('gulp-sass'),
    coffee = require('gulp-coffee'),
    sourcemaps = require('gulp-sourcemaps'),
    webserver = require('gulp-webserver');


gulp.task('coffee', function() {
	return gulp.src('./**/*.coffee')
		.pipe(sourcemaps.init())
		.pipe(coffee({bare: true}).on('error', gutil.log))
		.pipe(sourcemaps.write())
		.pipe(gulp.dest('./'))
})

gulp.task('sass', function() {
	return gulp.src('./**/*.sass')
		.pipe(sass().on('error', sass.logError))
		.pipe(gulp.dest('./'))
})


gulp.task('webserver', function() {
	return gulp.src('public')
		.pipe(webserver({
			livereload: true,
			open: true
		}));
});

gulp.task('watch', function() {
  gulp.watch('./**/*.coffee', ['coffee']);
  gulp.watch('./**/*.sass', ['sass'])
});

gulp.task('default', ['coffee', 'sass','webserver', 'watch']);