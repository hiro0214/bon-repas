$(document).on('turbolinks:load', function(){

  $(".my__food, .signin__food").hover(
    function(){
      $(".good__info").css({opacity: 1, transition: ".4s"})
    },
    function(){
      $(".good__info").css("opacity", 0)
    }
  )

  $("input").attr("autocomplete", "off")

  if(document.URL.match("/update_after")) {
    alert("投稿を編集しました")
    window.location.href = "/";
  }

  $(".sign_up > input").click(function(){
    if (confirm("会員登録を行いますか？")){
    } else {
      return false
    }
  })

  $(".sign h2").text("ユーザーの登録に失敗しました")

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