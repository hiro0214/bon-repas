$(document).on('turbolinks:load', function(){

  if ($('.foodstuffs_nested-fields').length == 1) {
  　$('.remove-btn').hide();
  }
  if ($('.recipe_nested-fields').length == 1) {
  　$('.remove-btn').hide();
  }
});