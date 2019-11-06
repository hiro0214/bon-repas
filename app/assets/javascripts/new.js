$(document).on('turbolinks:load', function(){

  if ($('.foodstuff_input').length == 1) {
  　$('.remove-btn').hide();
  }
  if ($('.recipe_input').length == 1) {
  　$('.remove-btn').hide();
  }

  $("#new_food").on("submit" ,function (){
    if (confirm("投稿してもよろしいですか？")){
    } else {
      return false
    }
  })

  if(document.URL.match("/new_after")) {
    alert("投稿が完了しました")
    window.location.href = "/";
  }

});