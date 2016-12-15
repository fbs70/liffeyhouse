#global module:false

"use strict"

module.exports = (grunt) ->
    grunt.loadNpmTasks "grunt-bower-task"
    grunt.loadNpmTasks "grunt-contrib-connect"
    grunt.loadNpmTasks "grunt-contrib-copy"
    grunt.loadNpmTasks "grunt-contrib-watch"
    grunt.loadNpmTasks "grunt-exec"

    grunt.initConfig

        copy:
            idealImageSlider:
                files: [{
                    expand: true
                    cwd: "bower_components/ideal-image-slider/"
                    src: "ideal-image-slider.css"
                    dest: "assets/css/"
                    },
                    {
                        expand: true
                        cwd: "bower_components/ideal-image-slider/"
                        src: "ideal-image-slider.min.js"
                        dest: "assets/js/"

                    },
                    {
                        expand: true
                        cwd: "bower_components/ideal-image-slider/extensions/captions/"
                        src: "iis-captions.js"
                        dest: "assets/js/"

                    },
                    {
                        expand: true
                        cwd: "bower_components/ideal-image-slider/themes/default/"
                        src: "default.css"
                        dest: "assets/css/themes/"

                    }]
            jquery:
                files: [{
                    expand: true
                    cwd: "bower_components/jquery/dist/"
                    src: "jquery.min.js"
                    dest: "assets/js/"
                }]
            bootstrap:
                files: [{
                    expand: true
                    cwd: "bower_components/bootstrap/dist/css/"
                    src: "bootstrap.min.css"
                    dest: "assets/css/"
                },
                {
                    expand: true
                    cwd: "bower_components/bootstrap/dist/js/"
                    src: "bootstrap.min.js"
                    dest: "assets/js/"
                },
                {
                    expand: true
                    cwd: "bower_components/bootstrap/dist/fonts/"
                    src: "**"
                    dest: "assets/fonts/"
                    }]

        exec:
            jekyll:
                cmd: "jekyll build --trace"

        watch:
            options:
                livereload: true
            source:
                files: [
                    "_drafts/**/*"
                    "_includes/**/*"
                    "_layouts/**/*"
                    "_posts/**/*"
                    "css/**/*"
                    "js/**/*"
                    "_config.yml"
                    "*.html"
                    "*.md"
                ]
                tasks: [
                    "exec:jekyll"
                ]

        connect:
            server:
                options:
                    port: 4000
                    base: '_site'
                    livereload: true

    grunt.registerTask "build", [
        "copy"
        "exec:jekyll"
    ]

    grunt.registerTask "serve", [
        "build"
        "connect:server"
        "watch"
    ]

    grunt.registerTask "default", [
        "serve"
    ]
