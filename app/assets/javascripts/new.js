$(document).on('turbolinks:load', function(){

  if ($('.foodstuff_input').length == 1) {
    $('.remove-btn').hide();
  }
  if ($('.recipe_input').length == 1) {
    $('.remove-btn').hide();
  }

  $("#new_food, .edit_food").on("submit" ,function (){
    if (confirm("投稿してもよろしいですか？")){
    } else {
      return false
    }
  })

  if($(".create").length) {
    alert("投稿が完了しました")
    window.location.href = "/";
  }

  $("#1 li").text("料理名が正しくありません")
  $("#2 li").text("画像が添付されていません")
  $("#3 li").text("説明が正しくありません")
  $("#4 li").text("カテゴリーが選択されていません")

});