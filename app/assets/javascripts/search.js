$(document).on('turbolinks:load', function () {

  const searchResult = $(".search__list");

  function appendfood(data) {
    var html = `<p>${data.name}</p>`;
    searchResult.append(html);
  }

  function appendErrMsg(data) {
    searchResult.append(`<span>${data}</span>`)
  }

  $("#search__name").keyup(function () {
    var input = $(this).val()
    if (input.length != 0) {
      $.ajax({
        type: "GET",
        url: "/foods",
        data: { input: input },
        dataType: "json"
      })

        .done(function (datas) {
          $(".search__list").empty()
          if (datas.length != 0) {
            datas.forEach(function (data) {
              appendfood(data)
            })
          } else {
            $(".search__list").empty()
            appendErrMsg("一致するものがありませんでした")
          }
        })
        .fail(function () {
          alert("検索に失敗しました")
        })
    } else {
      $(".search__list").empty()
    }
  })

  $(document).on("click", ".search__list > p", function () {
    var input = $(this).text()
    $("#search__name").val(input)
  })

  $(document).on("click", ' :not(".search__list > p")', function () {
    $(".search__list").empty()
  })

});