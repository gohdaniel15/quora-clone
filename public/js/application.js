$(document).ready(function() {
  $('.signup-button').click(function() {
    $('.signup').fadeToggle('slow');
  });

  $('.login-button').click(function() {
    $('.login').fadeToggle('slow');
  });

  $('.cancel-button').click(function() {
    $('.signup').hide('slow');
    $('.login').hide('slow');
  });
});
