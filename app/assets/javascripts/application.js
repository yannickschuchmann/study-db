// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap.min
//= require_tree .

$(function() {

  $(window).on("load resize", function() {
    handleScreenSize();
  });


	$('.show-with-javascript').show({
      duration: 0,
      complete: function() {
        if ($('.test-dropdown').length > 0) {
          window.calculateDropdown();
        } else if ($('.test-mega').length > 0) {
          window.calculateMega();
        }
      }
  });


});

var handleScreenSize = function() {
  if (window.innerWidth < 1200) {
    $('#width-modal').modal({backdrop: "static", keyboard: false});
  } else {
    $('#width-modal').modal("hide");
  }
};
