$(document).on('turbolinks:load', function() {

  const searchResult = $(".search__list");

  function appendfood(data){
    var html = `<p>${data.name}</p>`;
    searchResult.append(html);
  }

  function appendErrMsg(data){
    searchResult.append(`<p>${data}</p>`)
  }

  $("#search__name").keyup(function(){
    var input = $(this).val()
    if (input.length != 0) {
      $.ajax({
        type: "GET",
        url: "/foods",
        data: {input: input},
        dataType: "json"
      })

      .done(function(data){
        $(".search__list").empty()
        if (data.length != 0) {
          data.forEach(function(data){
            appendfood(data)
          })
        } else {
          $(".search__list").empty()
          appendErrMsg("一致するものがありませんでした")
        }
      })
      .fail(function(){

      })
    }
  })

  $(document).on("click", ".search__list > p", function(){
    var input = $(this).text()
    $("#search__name").val(input)
  })

  $(document).on("click", ' :not(".search__list > p")', function(){
    $(".search__list").empty()
  })

});