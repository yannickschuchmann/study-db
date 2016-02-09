Math.log2 = Math.log2 || function(x){return Math.log(x)*Math.LOG2E;};

function getAngle (xStart, yStart, xEnd, yEnd){
      var a = Math.abs(yStart - yEnd);
      var b = Math.abs(xStart - xEnd);
      return Math.atan(a / b);
}

function getSpanAngle () {
  var a = $('ul.layer-2 li > span').outerHeight();
  var b = $('ul.layer-2 li > span').outerWidth();
  return Math.atan(a / b);
}

function getLowDiagonale(alpha) {
  var b = ($('ul.layer-2 li > span').outerWidth())/2;
  var a = Math.tan(alpha) * b;
  return 2 * (Math.sqrt(a*a + b*b));
}

function getDiagonal(alpha){
  var a = $('ul.layer-2 li > span').outerHeight();
  var b = a / Math.tan(alpha);
  return Math.sqrt(a*a + b*b);;
}

function getID(dist, width){
 return Math.round(Math.log2(dist / width + 1) * 1000) / 1000;
}

function getSteering(width, height) {
  return Math.round((width / height) * 1000) / 1000;
}

function getHypothenuse(xStart, yStart, xEnd, yEnd){
  var a = Math.abs(yStart - yEnd);
  var b = Math.abs(xStart - xEnd);
  return Math.sqrt(a*a + b*b);
}