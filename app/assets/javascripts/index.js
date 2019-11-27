$(document).on('turbolinks:load', function () {

  function food_3() {
    $(".food_3").animate({ opacity: 0 }, 800)
    $(".food_3").css("z-index", 1)
    $(".food_1").css("z-index", 100)
    $(".food_1").animate({ opacity: 1 }, 800, function () {
      setTimeout(food_1, 5000)
    })
  }

  function food_2() {
    $(".food_2").animate({ opacity: 0 }, 800)
    $(".food_2").css("z-index", 1)
    $(".food_3").css("z-index", 100)
    $(".food_3").animate({ opacity: 1 }, 800, function () {
      setTimeout(food_3, 5000)
    })
  }

  function food_1() {
    $(".food_1").animate({ opacity: 0 }, 800)
    $(".food_1").css("z-index", 1)
    $(".food_2").css("z-index", 100)
    $(".food_2").animate({ opacity: 1 }, 800, function () {
      setTimeout(food_2, 5000)
    })
  }

  if ($("#index").length) {
    setTimeout(food_1, 5000)
  }


  $(".title").click(function () {
    window.location.href = "/"
  })

  if (location.href == "http://localhost:3000/") {
    $(window).scroll(function () {
      $(".main__contents__bottom").each(function () {
        var foodPos = $(this).offset().top;
        var scroll = $(window).scrollTop();
        if (scroll > foodPos - 590) {
          var lists = $(this).children(".main__food");
          lists.each(function (i) {
            $(this).delay(200 * i).animate({ opacity: 1 }, 600);
          });
        }
      })
    })
  } else {
    var lists = $(".main__food");
    lists.each(function (i) {
      $(this).delay(100 * i).animate({ opacity: 1 }, 400);
    });
  }

  $(".food__list").hover(
    function () {
      $(this).prev().animate({ opacity: 1 }, 300)
      $(this).prev().css("z-index", 200)
    }, function () {
      $(this).prev().animate({ opacity: 0 }, 300, function () {
        $(".main__food__text").css("z-index", 1)
      })
    }
  )

});