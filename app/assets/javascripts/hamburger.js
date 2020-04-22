
$(function(){
  $('#menu_link').click(function(){
    $('.icon_link_tab').addClass('open');
  });
  $('.close_btn').click(function(){
    $('.icon_link_tab').removeClass('open');
  });
});