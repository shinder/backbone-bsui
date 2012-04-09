$ = jQuery

$ ->
    class MainView extends Backbone.View
        el: '#shinder'
        initialize: ->
            buttonMenu = new Backbone.bsui.ButtonDropdownMenu
                label: 'Shinder'
                sizeType: 'btn-small'
                list: [
                    {
                        label:'測試一'
                        click: (event)->
                            console.log event.target
                    },
                    {
                        label:'test 2'
                        click: (event)->
                            console.log event.label
                    },
                    {
                        label:'---'
                    },
                    {
                        label:'C'
                        click: (event)->
                            console.log event.target
                    }
                ]
            @$el.append buttonMenu.el

    new MainView
