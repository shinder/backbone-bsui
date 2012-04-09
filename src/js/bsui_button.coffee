alert 'include "bsui__init.coffee" first !' if ! Backbone
$ = jQuery
Backbone.bsui ||= {}
$ ->
    class Backbone.bsui.Button extends Backbone.bsui.ViewBase
        tagName     : 'a'
        sizeTypes   : ['btn-large', 'btn-small', 'btn-mini']
        sizeType    : 'btn-large'
        btnTypes    : ['btn-primary', 'btn-warning', 'btn-danger', 'btn-success', 'btn-info', 'btn-inverse']
        btnType     : ''
        label       : 'label'
        toggle      : false
        selected    : false
        disabled    : false
        templateStr : '<<%=tagName%> class="btn"><%=label%></<%=tagName%>>'
        events      :
            'click' : 'click'

        initialize: (options)->
            _.bindAll @, 'render'
            for key, value of options
                @[key] = value
            @template = _.template @templateStr
            @setElement @template @
            @render()

        render: ->
            for key, value of @sizeTypes
                @$el.removeClass value
            @$el.addClass @sizeType
            for key, value of @btnTypes
                @$el.removeClass value
            @$el.addClass @btnType
            if @disabled
                @$el.addClass 'disabled'
            else
                @$el.removeClass 'disabled'
            if @toggle and @selected
                @$el.addClass 'active'
            else
                @$el.removeClass 'active'
            @$el.html @label
            @

        setAttr: (options)->
            for key, value of options
                @[key] = value
            @render()
            @
            
        click: ->
            if @disabled then return
            @selected = not @selected if @toggle
            @render()

