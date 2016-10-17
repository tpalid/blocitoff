// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap
//= require_tree .

// FLASH NOTICE ANIMATION
var fade_flash = function() {
    $("#flash_notice").delay(5000).fadeOut("slow");
    $("#flash_alert").delay(5000).fadeOut("slow");
    $("#flash_error").delay(5000).fadeOut("slow");
};
fade_flash();

var show_ajax_message = function(msg, type) {
    $("#flash-message").html('<div id="flash_'+type+'">'+msg+'</div>');
    fade_flash();
};

$(document).ajaxComplete(function(event, request) {
    var msg = request.getResponseHeader('X-Message');
    var type = request.getResponseHeader('X-Message-Type');
    show_ajax_message(msg, type); //use whatever popup, notification or whatever plugin you want
});

var blocmetrics = {};
    blocmetrics.report = function(eventName){
        var event = { name: eventName };
        var request = new XMLHttpRequest();
        request.open("POST", "https://blocmetrics-tpalid1.c9users.io/api/events", true);
        request.setRequestHeader('Content-Type', 'application/json');
        request.send(JSON.stringify(event));
    };
blocmetrics.report('pageview');

