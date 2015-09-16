###
 * Open Terminal Here - Atom package
 * https://github.com/blueimp/atom-open-terminal-here
 *
 * Copyright 2015, Sebastian Tschan
 * https://blueimp.net
 *
 * Licensed under the MIT license:
 * http://opensource.org/licenses/MIT
###

open = (filepath) ->
  if not filepath
    dirpath = atom.project.getDirectories()[0]?.path
  else if require('fs').lstatSync(filepath).isFile()
    dirpath = require('path').dirname(filepath)
  else
    dirpath = filepath
  return if not dirpath
  command = atom.config.get 'open-terminal-here.command'
  require('child_process').exec command,
    cwd: dirpath

switch require('os').platform()
  when 'darwin'
    defaultCommand = 'open -a Terminal.app "$PWD"'
  when 'win32'
    defaultCommand = 'start /D "%cd%" cmd'
  else
    defaultCommand = 'x-terminal-emulator'

module.exports =
  config: {
    command:
      type: 'string'
      default: defaultCommand
  },
  activate: ->
    atom.commands.add '.tree-view .selected, atom-text-editor, atom-workspace',
      'open-terminal-here:open': (event) ->
        event.stopImmediatePropagation()
        open @getPath?() || @getModel?().getPath?() ||
          atom.workspace.getActivePaneItem()?.buffer?.file?.path
    atom.commands.add 'atom-workspace',
      'open-terminal-here:open-root': (event) ->
        event.stopImmediatePropagation()
        open()
