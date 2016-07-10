$(document).ready(function(){
/* Activate checkbox */

  $('.ui.checkbox').checkbox();

  /* Make div element that wraps button clickable */

  var wrapper = document.querySelector('#url_form .input-group-addon'),
      btn = ('#url_form .input-group-addon button');

  wrapper.addEventListener('click', function (event) {
    this.children[0].click();
  });

});
