
document.addEventListener("turbolinks:load", function() {
  // $('[data-toggle-on-click]').on('click', function(e) {
  //   var selector = $(this).data('toggle-on-click');
  //   $(selector).toggle();
  //   e.preventDefault();
  // });
  $('#contribution_form_wrapper').on('shown.bs.modal', function () {
    $('#contribution_title').trigger('focus');
  }).each(function() {
    var $modal = $(this);
    console.log($modal)
    if ($modal.data('open-immediately')) {
      console.log("OPEN!");
      $(this).modal('show');
    }
  });



});
