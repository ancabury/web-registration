// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require_tree .


$(document).ready(function() {
  $('.next_page').click(function(){
    $('.additional-info').css({'display':'block'})
    $('.base-information').css({'display':'none'})
  });

  $('.back').click(function(){
    $('.additional-info').css({'display':'none'})
    $('.base-information').css({'display':'block'})
  });

  $('#user_email').focusout(function(){
    var user_email = $(this).val();
    $.ajax({
      type: 'GET',
      url: '/check',
      dataType: 'json',
      data: $.param({ email: user_email }),
      success: function(data){
        console.log("done");
        console.log(data.content);
        $('#user_email').parent().append(data.content);
      },
       error: function (XMLHttpRequest, textStatus, errorThrown) {
        console.log(XMLHttpRequest.responseText);
        console.log(textStatus);
        console.log(errorThrown);
      }
    })
  });
});
