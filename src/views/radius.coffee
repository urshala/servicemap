define (require) ->
    base = require 'cs!app/views/base'

    class RadiusControlsView extends base.SMItemView
        template: 'radius-controls'
        className: 'radius-controls'
        events:
          change: 'onChange'
          'click #close-radius': 'onUserClose'
        serializeData: ->
            selected: @selected or 750
            values: [
                250, 500, 750, 1000,
                2000, 3000, 4000]
        initialize: ({radius: @selected}) ->
        onChange: (ev) ->
            @selected = $(ev.target).val()
            @render()
            app.request 'setRadiusFilter', @selected
        onUserClose: (ev) ->
            app.request 'clearRadiusFilter'
