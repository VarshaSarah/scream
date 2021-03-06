

if typeof jQuery == 'undefined'
  headElement = document.getElementsByTagName("head")[0]
  linkElement = document.createElement("script")
  linkElement.src = "//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"
  headElement.appendChild(linkElement)

screamout = ->
  if document.getElementById('#screamout') == null
    window.scrollTo(0, 0)
    url = $('#screamoutjs').attr('src').split('/')
    Host = url[0] + "//" + url[2]
    jQ('<link>',  {
      href: Host + "/assets/scream/iframe.css",
      rel: "stylesheet",
      type: "text/css"
    }).appendTo('body')

    jQ('*','body').not("#screamout").css("opacity","0.9")
    jQ('*','body').not("#screamout").css("pointer-events","none")

    addIframe(Host)
  else
    closeIframe()
    addIframe(Host)
 

  $("body").not('#screamout').click ->
    closeIframe()

addIframe = (Host)->
      alert Host
      jQ('<iframe>', {
        id:  'screamout',
        name: "newpage",
        frameborder: 0,
        scrolling: "no",
        src: Host + "/scream/iframe_contents/new/",
        allowTransparency: true
      }).appendTo('body')

closeIframe = ->
    jQ('#screamout').remove()
    jQ('#screamoutjs').remove()
    jQ('*','body').not("#screamout").css("opacity","1")
    jQ('*','body').not("#screamout").css("pointer-events","auto")

test = ->
  if @jQuery
    @jQ = jQuery    
    screamout()
    clearInterval(@testInterval)

receiveMessage = (event) ->
  if event.data is "removetheiframe"
    closeIframe()

  if event.data is "fetch"
    url = document.URL
    title = document.title
    frame = document.getElementById("screamout")
    frame.contentWindow.postMessage(title + ',' + url, "*")
  return

window.addEventListener "message", receiveMessage, false

@testInterval = setInterval(->
  (test())
, 1000)
