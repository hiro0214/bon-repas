$(document).on('turbolinks:load', function(){

  $(".main__food").hover(
    function(){
      $(this).children().children("p").animate({opacity: 1}, 300)
    },function(){
      $(this).children().children("p").animate({opacity: 0}, 300)
    }
  )

});