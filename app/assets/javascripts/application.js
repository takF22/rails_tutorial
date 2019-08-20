// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require tempusdominus-bootstrap-4.js
//= require moment
//= require moment/ja.js
//= require tempusdominus-bootstrap-4.js
$(function(){
    setTimeout("$('.time-limit').fadeOut('slow')", 3000) 
  })

  $(function(){
    $fileField = $('#file')
  
    // 選択された画像を取得し表示
    $($fileField).on('change', $fileField, function(e) {
      file = e.target.files[0]
      reader = new FileReader(),
      $preview = $("#img_field");
  
      reader.onload = (function(file) {
        return function(e) {
          $preview.empty();
          $preview.append($('<img>').attr({
            src: e.target.result,
            width: "100%",
            height: "100%",
            class: "preview",
            title: file.name
          }));
        };
      })(file);
      reader.readAsDataURL(file);
    });
  });
  $(function(){
    jQuery('created_at_gteq').datetimepicker(
      {
        weekStart:0,
        lang:"ja",
        format:"YYYY-MM-DD HH:mm"
        });
});
$(function(){
  jQuery('created_at_lteq').datetimepicker()
});

//アバタープレビュー
$( document ).on('turbolinks:load', function() {
  function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
 
      reader.onload = function (e) {
        $('#avatar_img_prev').attr({
          src: e.target.result,
          width: 50px;
          height: 50px;
          border-radius: 50%;
          box-shadow: 0 3px 7px -1px rgba(#000, .10);
          object-fit: cover;
          margin:10px;
        });
      }
      reader.readAsDataURL(input.files[0]);
    }
  }
 
  $("#post_img").change(function(){
    $('#avatar_img_prev').removeAttr('style');
    $('.avatar_present_img').remove();
    readURL(this);
  });
});