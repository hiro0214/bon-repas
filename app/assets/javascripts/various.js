$(document).on('turbolinks:load', function(){

  if(document.URL.match("/update_after")) {
    alert("投稿を編集しました")
    window.location.href = "/";
  }

  $(".signout").click(function(){
    if (confirm("ログアウトしてもよろしいですか？")) {
    } else {
      return false
    }
  })

  $(".delete__btn").click(function(){
    if (confirm("削除してもよろしいですか？")) {
    } else {
      return false
    }
  })

  if($(".delete").length) {
    alert("投稿を削除しました")
    window.location.href = "/";
  }

});