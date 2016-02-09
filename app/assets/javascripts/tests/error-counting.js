var errorCounting = {
  els: [],
  counter: 0,
  offAllLeave: function() {
    $(errorCounting.els).each(function() {
      $(this).off('mouseleave', errorCounting.onLeave);
    });
  },
  onEnter: function() {
    errorCounting.offAllLeave();
    $(this).on('mouseleave', errorCounting.onLeave);
  },
  onLeave: function() {
    errorCounting.counter++;
  },
  init: function(els) {
    window.errorCounting = errorCounting;
    errorCounting.els = els;
    $(errorCounting.els).each(function() {
      $(this).on('mouseenter', errorCounting.onEnter);
    });
  }
};