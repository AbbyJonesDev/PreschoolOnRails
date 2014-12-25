// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
$("#edit_password_field").click(function() {
  $(this).remove();
  var field = $("div#password_field");
  field.append("<label for='user_password'>Password:</label");
  field.append("<input id='user_password' type='password' name='user[password]'></input>")
});