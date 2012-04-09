alert 'include "bsui__init.coffee" first !' if ! Backbone
alert 'ButtonGroup need Backbone.bsui.Button !' if ! Backbone.bsui.Button
$ = jQuery
Backbone.bsui ||= {}
$ ->
    class Backbone.bsui.ButtonGroup extends Backbone.bsui.ViewBase
        tagName     : 'div'
        itemTagName : 'a'
        # sizeTypes : ['btn-large', 'btn-small', 'btn-mini']
        sizeType    : 'btn-large'
        # btnTypes  : ['btn-primary', 'btn-warning', 'btn-danger', 'btn-success', 'btn-info', 'btn-inverse']
        btnType     : ''
        # initData  : { buttons:[{label:'1', click:}] }
        initData    : null
        buttons     : null
        toggle      : false

        initialize: (options)->
            _.bindAll @, 'render', 'addButton'
            @buttons = []
            @initData = options
            @render()

        render: ->
            @$el.addClass 'btn-group'
            return @ if not @initData
            @itemTagName = @initData.itemTagName if @initData.itemTagName
            @sizeType = @initData.sizeType if @initData.sizeType
            @btnType = @initData.btnType if @initData.btnType
            @toggle = @initData.toggle if @initData.toggle
            if @initData.buttons and @initData.buttons.length
                for item in @initData.buttons
                    btn = new Backbone.bsui.Button
                        label: item.label
                        tagName: @itemTagName
                        sizeType: @sizeType
                        btnType: @btnType

                    ((btn, item, group)->
                        btn.on 'click', (event)->
                            event.button = btn
                            if group.toggle
                                for i in group.buttons
                                    if i.cid is btn.cid
                                        i.$el.addClass 'active'
                                    else
                                        i.$el.removeClass 'active'
                            item.click event if item.click
                    ) btn, item, @

                    @addButton btn
            @
        addButton: (btn)->
            @$el.append btn.el
            @buttons.push btn
