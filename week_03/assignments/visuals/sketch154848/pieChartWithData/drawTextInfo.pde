void drawText ()
{
  fill (255);

  // wie viele kleine segmente gibt es im pie chart? -----------------------
  int numberOfElements = names.length;

  // winkel-abstände -------------------
  float angleSteps = TWO_PI / total;

  int i = 0;

  stroke (#A75265);
  strokeWeight (2);

  float currentAngle = 0;

  translate (width/2, height/2);
  while (i < numberOfElements)
  {
    currentAngle = angleSteps * rVals [i].length;

    float fontSize = map ( rVals [i].length, minVal, maxVal, 6, 20);

    color c = #57385c;
    if (fontSize > 15) c = #ffffff;

    textSize (fontSize);
    fill (c);
    rotate (currentAngle / 2);
    text (names [i], 40, 0);
    rotate (currentAngle / 2);


    // zÃ¤hlvariable erhÃ¶hen----------------------------------

    i = i + 1;
  }
}
