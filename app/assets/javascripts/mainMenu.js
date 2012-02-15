$(document).ready(function(){

  $('li').bind('click',function(e){
    $('.menu_item').removeClass('selected')
    $(this).addClass('selected');
  });

});
