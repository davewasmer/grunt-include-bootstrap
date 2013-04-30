# grunt-include-bootstrap

> Use Bootstrap the right way.  IAvoid onion layered CSS by building fresh each time, customized for your styles.

## Getting Started
This plugin requires Grunt `~0.4.1`

If you haven't used [Grunt](http://gruntjs.com/) before, be sure to check out the [Getting Started](http://gruntjs.com/getting-started) guide, as it explains how to create a [Gruntfile](http://gruntjs.com/sample-gruntfile) as well as install and use Grunt plugins. Once you're familiar with that process, you may install this plugin with this command:

```shell
npm install grunt-include-bootstrap --save-dev
```

One the plugin has been installed, it may be enabled inside your Gruntfile with this line of JavaScript:

```js
grunt.loadNpmTasks('grunt-include-bootstrap');
```

## The "include_bootstrap" task

### Overview
In your project's Gruntfile, add a section named `include_bootstrap` to the data object passed into `grunt.initConfig()`.

```js
grunt.initConfig({
  include_bootstrap: {
    options: {
      // All options are passed on to the grunt-contrib-less task
    },
    your_target: {
      // Target-specific file lists and/or options go here.
    },
  },
})
```

### Options

See the [grunt-contrib-less](https://github.com/gruntjs/grunt-contrib-less) project for the available options.

### Recommended Usage

I'd recommend creating a `manifest.less` file which `@import`s all your other LESS files. You can import any Bootstrap LESS files from any of your files. For example:

```js
grunt.initConfig({
  include_bootstrap: {
    files: {
      'dest/styles.css': 'less/manifest.less',
    },
  },
})
```

And in `./less/manifest.less`

```less
// Import Bootstrap source
@import 'bootstrap';    // This will import the entire Bootstrap base
@import 'responsive';   // Bootstrap responsiveness is not included by default in the file above

// Import your LESS files here
@import 'variables';    // Will import ./less/variables.less
@import 'signup';
```

Keep in mind that LESS variables are retroactive, so you an override a Bootstrap variable in your LESS files, and it will change throughout the Bootstrap core.

#### LESS Options

All task options are passed directly on to the [grunt-contrib-less](https://github.com/gruntjs/grunt-contrib-less) task.

## Contributing
In lieu of a formal styleguide, take care to maintain the existing coding style. 

## Release History
April 29, 2013 - v0.1.1 - initial release
