$(function() {
  var $jobDropdown = $('select.job');

  var $additionals = $('.additional');
  var $additionalOther = $('input.additional-other');
  var $additionalStudent = $('select.additional-student');
  var $additionalEmployee = $('select.additional-employee');

  var showActiveAdditional = function() {
    $additionals.hide(); // hide all
    var $el = getActiveAdditional();
    if ($el) $el.show();
  };

  var getActiveAdditional = function() {
    var activeOption = $jobDropdown.children("option:selected").text()
    var $el;
    if (activeOption == "Student") {
      $el = $additionalStudent;
    } else if (activeOption == "Berufstätiger") {
      $el = $additionalEmployee;
    } else if (activeOption == "Sonstiges") {
      $el = $additionalOther;
    }
    return $el;
  }

  var setup = function() {
    $additionals.hide();

    // set additional
    if ($('.additional-hidden').val() != "") {
      var value = $('input[name="additional"]').val();
      var $el = getActiveAdditional();
      if ($el && $el.is("input[type=text]")) {
        $el.val(value);
      }
    }

    showActiveAdditional();
    $jobDropdown.change(function(e) {
      showActiveAdditional();
    });

    $('.new_participant').on('submit', function(e) {

      var $el = getActiveAdditional();
      if ($el) {
        if ($el.is('select')) {
          $('.additional-hidden').val($el.children('option:selected').text());
        } else {
          $('.additional-hidden').val($el.val());
        }
      } else {
        $('.additional-hidden').val('');
      }

      return;

    });
  };


  setup();


});