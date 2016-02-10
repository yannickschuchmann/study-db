$(function () {

  window.calculateMega = function () {
    timeTracking();
    naming();

    errorCounting.init($('.track-start, .track-end'));

    /*hover Funktion */

    var leaveTimer;
    $('.layer-1 > li').hover(function () {
      $currentMega = $(this).children('.mega');
      $currentMega.css({'visibility': 'visible'});
    }, function () {
      $currentMega.css({'visibility': 'hidden'});
    });

    /* Berechnung Index of Difficulty */
    // var $liStart = $('.layer-1 > li'); 

    // $liStart.each(function(){
    //   $currentElement = $(this);
    //   var liStartHeight = $currentElement.outerHeight();
    //   var liStartWidth = $currentElement.outerWidth();
    //   var xStart = $currentElement.offset().left + liStartWidth/2;
    //   var yStart = $currentElement.offset().top + liStartHeight;

    //   var layer2 = $currentElement.find('ul.layer-2');
    //   $(layer2).each(function(){
    //     var $childrenL2 = $(this).children();
    //     $childrenL2.each(function(){
    //       var $liEnd = $(this);
    //       var liEndHeight = $liEnd.outerHeight();
    //       var liEndWidth = $liEnd.outerWidth();
    //       var xEnd = $liEnd.offset().left + liEndWidth/2;
    //       var yEnd = $liEnd.offset().top + liEndHeight/2;

    //       var alpha = getAngle(xStart, yStart, xEnd, yEnd);
    //       var spanAngle = getSpanAngle();
    //       if(alpha >= spanAngle){
    //         var diagonal = getDiagonal(alpha);
    //       }
    //       else {
    //         var diagonal = getLowDiagonale(alpha);
    //       }
    //       var dist = getHypothenuse(xStart, yStart, xEnd, yEnd);
    //       var ID = getID(dist, diagonal);

    //       //console.debug($(this).children().first().text(), alpha * 180/Math.PI + "°", "Diagonale: " + diagonal, "Hypo: " + hypo, "Index: " + ID);

    //       $(this).children().first().after(" <small>("+ID+")</small>");
    //     });
    //   });  
    // });
  }
});
    