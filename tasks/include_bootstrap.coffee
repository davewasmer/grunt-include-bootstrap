# 
# grunt-include-bootstrap
# https://github.com/davewasmer/grunt-include-bootstrap
# 
# Copyright (c) 2013 Dave Wasmer
# Licensed under the MIT license.
# 

path = require 'path'

module.exports = (grunt) ->

  grunt.task.loadNpmTasks('grunt-contrib-less')

  grunt.registerMultiTask 'include_bootstrap', 'Include the base Bootstrap in your LESS, overriden by any of your local styles or variables', ->

    options = grunt.util._.extend {}, @options(), @files

    options.paths or= []
    options.paths.push path.resolve(path.join('node_modules','grunt-include-bootstrap','less'))
    @files.forEach (f) ->
      options.paths.push path.resolve path.dirname f.src

    grunt.config.set 'less', 
      include_bootstrap: 
        options: options
        files: @files

    grunt.task.run 'less:include_bootstrap'