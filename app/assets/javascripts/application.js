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
    fileField = $('#file')
  
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

$(function () {
  $('.datepicker').datetimepicker({
      dayViewHeaderFormat: 'YYYY年 M月',
      locale: 'ja',
      format: 'yyyy/mm/dd hh:mm'
  });
  let date_gteq = $("#q_updated_at_gteq").val();　　　　　　　        // 日付取得して代入
  let date_lteq = $("#q_created_at_lteq_end_of_day").val();

  if (date_gteq != "") {
    let date = new Date(date_gteq);　                               // Date型に変換　
    let yyyy = date.getFullYear();                                  // 年の部分代入
    let mm = date.getMonth() + 1; if (mm < 10) {mm = '0' + mm;}  　　// 月の部分代入
    let dd = date.getDate(); if (dd < 10) {dd = '0' + dd;}　　  　　　// 日の部分代入
    let new_date_gteq = yyyy + '/' + mm + '/' + dd;　　　　　　　　　　// yyyy/mm/ddに整形
    $("#q_updated_at_gteq").val(new_date_gteq)  　　　　　　　　　　　　// 値を入れ替える
  }
  if(date_lteq != "") {
    let date = new Date(date_lteq);
    let yyyy = date.getFullYear();
    let mm = date.getMonth() + 1; if (mm < 10) {mm = '0' + mm;}
    let dd = date.getDate(); if (dd < 10) {dd = '0' + dd;}
    let new_date_lteq = yyyy + '/' + mm + '/' + dd;
    $("#q_created_at_lteq_end_of_day").val(new_date_lteq)
  }
});

$(function () {
  $('#datetimepicker2').datetimepicker({
      locale: 'ja',
      format: 'yyyy/mm/dd hh:mm'
  });
});

//アバタープレビュー
$( document ).on('turbolinks:load', function() {
  function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
 
      reader.onload = function (e) {
        $('#avatar_img_prev').addClass("avatar_present_img")
          .attr({
            src: e.target.result,
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