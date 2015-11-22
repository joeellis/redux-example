require('coffee-script/register');

var _ = require('lodash');
var sys = require('sys');
var exec = require('child_process').exec;
var http = require('http');
var app = require('./app');
var gulp = require('gulp');
var gutil = require('gulp-util');
var notify = require('gulp-notify');
var stylus = require('gulp-stylus');
var nib = require('nib');
var sourcemaps = require('gulp-sourcemaps');
var source = require('vinyl-source-stream');
var buffer = require('vinyl-buffer');
var watchify = require('watchify');
var browserify = require('browserify');

var cssSrcFiles = './assets/stylesheets/**/*.styl';
var cssSrcMain  = './assets/stylesheets/app.styl';
var cssBuildDir = './public/stylesheets';

var jsSrcFiles = ['./assets/javascripts/**/*.coffee'];
var jsTestFiles = ['./test/**/*-test.coffee'];
var jsSrcMain  = './assets/javascripts/app.coffee';
var jsBuildDir = './public/javascripts';


function handleError(error) {
  gutil.log(gutil.colors.red('Error: ' + error.message));
  this.end();
}

function handleNotify(error) {
  var message = error.message;
  message = message.replace(/^([^:]+:)/, '');

  return message;
}

function bundle() {
  return bundler
    .bundle()
    .on('error', handleError)
    .on('error', notify.onError(handleNotify))
    .pipe(source('app.js'))
    .pipe(buffer())
    .pipe(sourcemaps.init({loadMaps: true}))
    .pipe(sourcemaps.write('./'))
    .pipe(gulp.dest(jsBuildDir));
}

var defaultOptions = {
  extensions: [".coffee", ".hbs", ".cjsx"],
  noparse: ['lodash'],
  cache: {},
  packageCache: {},
  fullPaths: true
};

var bundleOptions = _.assign({ entries: [jsSrcMain] }, defaultOptions);
var bundler = watchify(browserify(bundleOptions));

bundler.transform("coffee-reactify");


bundler.on('update', bundle);
bundler.on('log', gutil.log);
bundler.on('error', gutil.log.bind(gutil, 'Browserify Error'));


gulp.task('scripts', bundle);

gulp.task('css', function(callback) {
  gulp.src(cssSrcMain)
    .pipe(stylus({use: [nib()]}))
    .pipe(gulp.dest(cssBuildDir));

  callback();
});

gulp.task('serve', ['build'], function() {
  http.createServer(app).listen(app.get('port'), function() {
    console.log('Express server listening on port ' + app.get('port'))
  });
});

gulp.task('watch', function () {
  gulp.watch(cssSrcFiles, ['css']);
  gulp.watch(cssSrcMain, ['css']);
});

gulp.task('build', ['scripts', 'css']);

gulp.task('default', ['build', 'serve', 'watch']);