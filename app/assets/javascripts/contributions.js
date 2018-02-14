
document.addEventListener("turbolinks:load", function() {
  // $('[data-toggle-on-click]').on('click', function(e) {
  //   var selector = $(this).data('toggle-on-click');
  //   $(selector).toggle();
  //   e.preventDefault();
  // });
  $('#contribution_form_wrapper').on('shown.bs.modal', function () {
    $('#contribution_title').trigger('focus');
    $('[data-show-if="contribution"]').show();
  }).each(function() {
    var $modal = $(this);
    if ($modal.data('open-immediately')) {
      console.log("OPEN!");
      $(this).modal('show');
    }
  });

  $(document).on('click', '[data-show-explainer]', function() {

    var which = $(this).data('show-explainer');
    $('[data-show-if]').hide();
    $('[data-show-if="' + which +'"]').show();
  });

});
