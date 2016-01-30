Rails UJS
<%= link_to "asdf", "/asdf, remote: true" %>
<a href="/asdf" data-remote=true>asdf</a>
$('[data-remote=true]').click(...)  intercepts any click on an elemnt with this attribute, rails ujs sends a side-channel message to the server and awaits the reponse

renders some .js.erb view
$('asdf').hide()

client side, which is waiting for the request, then executes it as javascript against the current page




AJAX API

GET /adsf

{adsf: 1234}

whole other program written in JS to take this data and change the page
only data sent, not code -- client interprets data
