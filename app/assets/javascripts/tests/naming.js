/* Namenverteilung */
function naming () {
  $('li').each(function(){
        randomNumber = Math.floor((Math.random() * namelist.length));
        $(this).find('> span').text(namelist[randomNumber]);
        namelist.splice(randomNumber, 1);
  });

  /* Setzen der Hilfs-Namen */
  var $trackEnd = $('.track-end');
  var goalname = $trackEnd.text();
  $('.goalname').text(goalname);

  var $trackStart = $('.track-start > span');
  var startname = $trackStart.text();
  $('.startname').text(startname);

  var $helpingElement = $('.helping-element > span');
  var helpingname = $helpingElement.text();
  $('.helpingname').text(helpingname);
}