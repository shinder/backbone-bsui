alert 'include "bsui__init.coffee" first !' if ! Backbone
alert 'ButtonToolbar need Backbone.bsui.ButtonGroup !' if ! Backbone.bsui.ButtonGroup
$ = jQuery
Backbone.bsui ||= {}
$ ->
    class Backbone.bsui.ButtonToolbar extends Backbone.bsui.ViewBase
        tagName : 'div'
        groups  : []

        initialize: ->
            _.bindAll @, 'render', 'addGroup'
            @render()
        render: ->
            @$el.addClass 'btn-toolbar'
            @
        addGroup: (group)->
            @$el.append group.el
            @groups.push group
            @
        addSingleButton: (btn)->
            group = new Backbone.bsui.ButtonGroup
            group.addButton btn
            @$el.append group.el
            @groups.push group
            @
