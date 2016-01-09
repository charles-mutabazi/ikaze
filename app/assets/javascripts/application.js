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
//= require jquery.autosize
//= require jquery_ujs
//= require jquery.remotipart
//= require turbolinks
//= require_tree .
//= require bootstrap-sprockets

$(document).ready(function(){
  $('textarea').autosize()
});

$(document).on ("click", "#signup-btn", function(event){
  event.preventDefault();
  $("#login-form").hide();
  $("#signup-form").show();
});

$(document).on("click", "#login-btn", function(event){
  event.preventDefault();
  $("#signup-form").hide();
  $("#login-form").show();
});

$(document).on("click", "#login-with-email", function(event){
  event.preventDefault();
  $("#user-form").fadeToggle();
});

// Image Upload...
$(document).ready(function() {
  cameraIconClick ();
  deletePhoto();

  function cameraIconClick () {
      $('.image-preview').hide();
      $("#uploadBtn").change(function(){
          readURL(this);
      });
    }
    function readURL(input) {

        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
              $('.image-preview').show();
              $('.image-preview').css('background-image', 'url(' + e.target.result + ')');

            }
            reader.readAsDataURL(input.files[0]);
        }
    }
    function deletePhoto () {
        $('.deletePhoto').click(function() {
            $('#uploadBtn').val('');
            $('.image-preview').css('background', '');
            $('.image-preview').hide();
        });
    }
    //get current coordinates
    if(navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(function(position) {
        var lat = position.coords.latitude
        var lon = position.coords.longitude

        document.getElementById('post_lat').value = position.coords.latitude;
        document.getElementById('post_lon').value = position.coords.longitude;
      }, function() {
        alert('We couldn\'t find your position.');
      });
    } else {
      alert('Your browser doesn\'t support geolocation.');
    }
  });
