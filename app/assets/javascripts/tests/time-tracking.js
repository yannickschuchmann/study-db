function timeTracking(){

var $trackStart = $('.track-start'),
 		$trackEnd = $('.track-end'),
  	timeStamps = {
    	startAt: null,
      endingAt: null,
      reset: function() {
      	timeStamps.startAt = null;
        timeStamps.endingAt = null;
      },
      getResult: function() {
      	return timeStamps.endingAt - timeStamps.startAt;
      }
    }

  	$trackStart.hover(function() {
      timeStamps.startAt = Date.now();
    }, function() {
    	timeStamps.reset();
    });
    
    $trackEnd.click(function() {
    	timeStamps.endingAt = Date.now();
      alert("Journey complete! You needed " + timeStamps.getResult() / 1000 + " seconds.");
    });
  }