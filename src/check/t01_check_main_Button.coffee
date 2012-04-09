$ = jQuery

$ ->
    class MainView extends Backbone.View
        el: '#shinder'
        initialize: ->
            myButton = new Backbone.bsui.Button
                label:'Shinder Lin'
                btnType: 'btn-primary'
                toggle: true
                #selected: true
                #disabled: true
            @$el.append myButton.el
            myButton.css 'width', myButton.css('width')
            myButton.on 'click', (event)->
                if myButton.selected
                    myButton.setAttr label:'yes'
                else
                    myButton.setAttr label:'nono'
                #alert $(event.target).html()
            myButton1 = new Backbone.bsui.Button
                label:'Shinder Lin'
                tagName: 'a'
                toggle: true
            @$el.append myButton1.el
            myButton2 = new Backbone.bsui.Button
                label:'Shinder Lin'
                tagName: 'a'
                toggle: true
            @$el.append myButton2.el
            myButton3 = new Backbone.bsui.Button
                label:'Shinder Lin'
                tagName: 'a'
                toggle: true
            @$el.append myButton3.el

    new MainView