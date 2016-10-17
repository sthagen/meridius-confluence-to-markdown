chai = require 'chai'
chai.use require 'chai-fs'
assert = chai.assert

_fs = require 'fs'
_path = require 'path'
_rmdir = require 'rimraf'

Logger = require '../src/Logger'
Utils = require '../src/Utils'


describe 'Utils', ->

  it 'getAllHtmlFileNames() should return 5 file names for page1 directory', ->
    logger = new Logger Logger.WARNING
    utils = new Utils _fs, _path, logger
    fullPath = _path.join __dirname, 'assets/page1'
    actual = utils.getAllHtmlFileNames fullPath
    expected = [
      '9273380.html'
      'JavaScript_9273401.html'
      'My-article_9568346.html'
      'Webclient_9568537.html'
      'index.html'
    ]
    assert.sameMembers actual, expected

  it 'mkdirpSync() should create directory test/testingDir/foo/', ->
    logger = new Logger Logger.WARNING
    utils = new Utils _fs, _path, logger
    directory = 'test/testingDir/foo'
    _rmdir 'test/testingDir', (error)->
    utils.mkdirpSync directory
    assert.isDirectory directory
    _rmdir 'test/testingDir', (error)->