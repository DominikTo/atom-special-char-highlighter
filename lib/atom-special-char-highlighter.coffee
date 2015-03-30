module.exports =

  activate: (state) ->
    @decorations = []

    atom.workspace.observeTextEditors (editor) =>
      editor.onDidChange =>
        for decoration in @decorations
          decoration.getMarker().destroy()
          @decorations = []

        editor.scan new RegExp('\u00A0', 'g'), (object) =>
          marker = editor.markBufferRange(object.range)
          @decorations.push decoration = editor.decorateMarker(marker, {type: 'highlight', class: 'highlight-red'})

  deactivate: ->
    console.log "Deactivated"
