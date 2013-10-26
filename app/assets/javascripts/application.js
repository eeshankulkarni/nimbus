//= require jquery
//= require jquery_ujs
//= require jquery.ui.all
//= require gmaps-autocomplete
//= require bootstrap
//= require turbolinks
//= require tinymce-jquery
//= require raty.min.js
//= require_tree .

jQuery(document).ready(function($) {
  
  // This disable submiting the form with the ENTER key only for inputs and selects
  $('input,select').keydown(function(event){
    if(event.keyCode == 13) {
      event.preventDefault();
      return false;
    }
  });

});