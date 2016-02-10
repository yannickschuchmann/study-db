function timeTracking() {

  var $trackStart = $('.track-start'),
    $trackEnd = $('.track-end'),
    timeStamps = {
      startAt: null,
      endingAt: null,
      reset: function () {
        timeStamps.startAt = null;
        timeStamps.endingAt = null;
      },
      getResult: function () {
        return timeStamps.endingAt - timeStamps.startAt;
      }
    };

  $trackStart.hover(function () {
    timeStamps.startAt = Date.now();
  }, function () {
    timeStamps.reset();
  });

  $trackEnd.click(function () {
    timeStamps.endingAt = Date.now();

    if (window.debug == true) {
      alert(timeStamps.getResult());
      return;
    }
    // e.g. http://domain.tld/cases/tested?time=1234&case_sheet=4
    var url = window.location.origin + "/cases/tested?time=" +
      timeStamps.getResult() + "&case_sheet=" + window.currentCaseSheet +
      "&error_counter=" + window.errorCounting.counter;

    window.location.href = url; // redirect to url to send data.
  });
}