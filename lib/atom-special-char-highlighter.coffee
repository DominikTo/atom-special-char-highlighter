module.exports =

  activate: (state) ->
    atom.workspace.observeTextEditors (editor) =>
      editor.onDidChange =>
        editor.scan new RegExp('\u00A0', 'g'), (object) =>
          marker = editor.markBufferRange(object.range)
          editor.decorateMarker(marker, {type: 'highlight', class: 'highlight-red'})

  deactivate: ->
    console.log "Deactivated"
