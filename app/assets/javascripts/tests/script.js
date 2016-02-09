/* Zeitberechnung */
$(function() {

  window.calculateDropdown = function() {

    timeTracking();
    naming();

    errorCounting.init([$('.track-start'),
      $('.track-end').parent().closest('li'),
      $('.track-end')]);

    /* hover Funktion */
    $('.layer-1 > li').hover(function(){
      currentL2 = $(this).children('ul');
      currentL2.css({ 'visibility' : 'visible'});
    }, function () {
        currentL2.css({ 'visibility' : 'hidden'});
    }); 
    $('.layer-2 > li').hover(function(){
      currentL3 = $(this).children('.mega');
      currentL3.css({ 'visibility' : 'visible'}); 
    }, function () {
        currentL3.css({ 'visibility' : 'hidden'}); 
    });

    /* Berechnung Index of Difficulty */
    var $liStart = $('.layer-1 > li');
    $liStart.each(function(){
      $currentElement = $(this);
      var liStartHeight = $currentElement.outerHeight();
      var liStartWidth = $currentElement.outerWidth();
      var xStart = $currentElement.offset().left + liStartWidth/2;
      var yStart = $currentElement.offset().top + liStartHeight;

      var liLayer2 = $currentElement.find('ul.layer-2 >li');
      $(liLayer2).each(function(){
        var $currentLi = $(this);
        var liEndHeight = $currentLi.outerHeight();
        var liEndWidth = $currentLi.outerWidth();
        var xEnd = $currentLi.offset().left + liEndWidth/2;
        var yEnd = $currentLi.offset().top + liEndHeight/2;

        var dist = getHypothenuse(xStart, yStart, xEnd, yEnd);
        var width = $(this).find('span').outerHeight();
        var ID1 = getID(dist, width);

        width = ($(this).outerWidth())/2;
        height = $(this).outerHeight();
        var steering = getSteering(width, height)
        $(this).children().first().after(" <small>("+ ID1 +")</small>");
        var xStartLi2 = $currentLi.offset().left + liEndWidth;
        var yStartLi2 = $currentLi.offset().top + liEndHeight/2;

        var liLayer3 = $(this).find('.layer-3').children();
        liLayer3.each(function(){
          var $liEnd = $(this);
          var liEndHeight = $liEnd.outerHeight();
          var liEndWidth = $liEnd.outerWidth();
          var xEnd = $liEnd.offset().left + liEndWidth/2;
          var yEnd = $liEnd.offset().top + liEndHeight/2;

          var alpha = getAngle(xStartLi2, yStartLi2, xEnd, yEnd);
          var spanAngle = getSpanAngle();
          if(alpha >= spanAngle){
            var diagonal = getDiagonal(alpha);
          }
          else {
            var diagonal = getLowDiagonale(alpha);
          }
          var dist = getHypothenuse(xStartLi2, yStartLi2, xEnd, yEnd);
          var ID2 = getID(dist, diagonal);
          var IDSum = Math.round((ID1 + steering + ID2)*1000)/1000;

          $(this).children().first().after(" <small>("+ IDSum +")</small>");
        });
      });
    });
  }
});