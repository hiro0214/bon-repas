$(document).on('turbolinks:load', function(){

  if ($('.foodstuff_input').length == 1) {
  　$('.remove-btn').hide();
  }
  if ($('.recipe_input').length == 1) {
  　$('.remove-btn').hide();
  }
});