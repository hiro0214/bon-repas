$(document).on('turbolinks:load', function () {

  const searchResult = $(".search__list");

  function appendfood(data) {
    let html = `<p class="append__food">${data.name}</p>`;
    searchResult.append(html);
  }

  function appendErrMsg(data) {
    searchResult.append(`<p>${data}</p>`)
  }

  $("#search__name").keyup(function () {
    let input = $(this).val()
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

  $(document).on("click", ".append__food", function () {
    let input = $(this).text()
    $("#search__name").val(input)
  })

  $(document).on("click", ' :not(".append__food")', function () {
    $(".search__list").empty()
  })

});