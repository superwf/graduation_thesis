var connect, gulp;

gulp = require("gulp");
connect = require('gulp-connect');

gulp.task("default", ["serve"]);

gulp.task("watch", function() {
  gulp.watch(["api/api.json"]).on("change", function(e) {
    gulp.src(e.path).pipe(connect.reload());
  });
});

gulp.task("serve", ["watch"], function() {
  connect.server({
    livereload: {
      port: 35728
    },
    port: 9000,
    root: "./"
  });
});
