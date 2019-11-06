$(document).on('turbolinks:load', function(){

  $(".food__list").hover(
    function(){
      $(this).prev().animate({opacity: 1}, 300)
    },function(){
      $(this).prev().animate({opacity: 0}, 300)
    }
  )

});