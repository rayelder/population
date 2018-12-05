
// Source: http://www.worldometers.info/world-population/
// Date: 10/19/2018

// libraries
import processing.pdf.*;

// global objects
Population currentYear;

// global variables
Boolean isPreview, exportPDF, exportPNG, showGuides;
color canvas, construction;
float phi, ratio;
FloatDict ratios;
int instagramWidth, instagramHeight, margin;
String projectTitle;

void settings() {

  projectTitle = "world-population-180701";
  isPreview = false;
  exportPDF = true;
  exportPNG = false;
  showGuides = false;
  instagramWidth = 1080;
  instagramHeight = 1080;
  margin = 50;
  phi = (1 + sqrt(5)) / 2;

  ratios = new FloatDict();
  ratios.set("square", 1.0);
  ratios.set("golden", phi);
  ratio = ratios.get("square");

  if (isPreview) {
    instagramWidth = instagramWidth / 2;
    instagramHeight = instagramHeight / 2;
    size(instagramWidth, int(instagramHeight * ratio));
  } else {
    size(instagramWidth, int(instagramHeight * ratio));
  }
}

void setup () {
  noLoop();

  colorMode(HSB, 360, 100, 100, 100);
  canvas = color(0, 0, 100, 100);
  // foreground = color(0, 0, 0, 100);

  construction = color(0, 100, 100, 100);

  currentYear = new Population(7632819325L);

  if (exportPDF) {
    beginRecord(PDF, projectTitle + ".pdf");
  }
}

void draw() {
  background(canvas);
  currentYear.display();

  if (showGuides) {

    float w = instagramWidth - (margin * 2);
    float h = int(instagramHeight * ratio) - (margin * 2);

    noFill();
    stroke(construction);
    strokeWeight(1);
    rect(margin, margin, w, h);
    line(instagramWidth / 2, 0, instagramWidth / 2, int(instagramHeight * ratio));
    line(0, instagramHeight / 2, instagramWidth, instagramHeight / 2);
  }


  if (exportPNG) {
    save(projectTitle + ".png");
  }

  if (exportPDF) {
    endRecord();
  }
}
