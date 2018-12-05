class Population {

  Boolean isPreview;
  color background, foreground;
  float billionF;
  int c, margin, sW;
  long population, billion;

  Population(long _population) {
    isPreview = true;
    margin = 50;
    population =_population;

    billion = 1000000000;
    billionF = 1000000000.0;

    // set colors
    background = color(0, 0, 100, 100);
    foreground = color(0, 0, 0, 100);

    // c = foreground;
    sW = 1;
  }

  private void display() {
    float w = instagramWidth - (margin * 2);
    //float h = int((instaHeight / 2) * ratio) - (margin * 2);

    noFill();
    strokeWeight(sW);
    stroke(foreground);

    float gap = w / 11;

    int xPos = instagramWidth / 2;
    int yPos = instagramWidth / 2;

    ellipse(xPos, yPos, w, w);

    int divisor = 100;
    float segmentAngle = (360.0 / divisor);

    long billions = population / billion;
    float d1 = gap + ((billions - 1) * gap);
    float d2 = gap + (billions * gap);

    for (int i = 0; i < billions; i++) {
      float d = gap + (i * gap);
      ellipse(instagramWidth / 2, instagramWidth / 2, d, d);
    }

    long remainder = population % billion;
    float percentage = remainder / billionF;
    int ticks = int(divisor * percentage);

    for (int c = 0; c <= ticks; c++) {
      float angle = radians((segmentAngle * c) - 90);
      float angleX1 = ((d1 / 2) * cos(angle)) + xPos;
      float angleY1 = ((d1 / 2) * sin(angle)) + yPos;
      //ellipse(angleX1, angleY1, 5, 5);
      float dDiff = (d2 / 2) - (gap / 4);
      float angleX2 = (dDiff * cos(angle)) + xPos;
      float angleY2 = (dDiff * sin(angle)) + yPos;
      //ellipse(angleX2, angleY2, 5, 5);

      if (c == (ticks - 1)) {
        line(angleX1, angleY1, angleX2, angleY2);
      }
    }
  }
}
