Table populationData;
PImage egyptMap;
Table coordinateData;

void setup() {
  size(1100, 800);
  background(255);
  
  populationData = loadTable("pop.csv", "csv");
  egyptMap = loadImage("egypt.jpeg");
  coordinateData = loadTable("Data.tsv", "tsv");
  

  float mapX = 0;
  float mapY = 0;
  float mapWidth = width - 200;

  image(egyptMap, mapX, mapY, mapWidth, height);

  plotPopulationData(populationData);

  float legendX = mapWidth + 20;
  float legendY = 50;
  drawLegend(legendX, legendY);
  
}

void draw() {
  background(255);
  float mapX = 0;
  float mapY = 0;
  float mapWidth = width - 200;
  image(egyptMap, mapX, mapY, mapWidth, height);
  plotPopulationData(populationData);
  float legendX = mapWidth + 20;
  float legendY = 50;
  drawLegend(legendX, legendY);
  
}


void plotPopulationData(Table populationData) {
  Table coordinateData = loadTable("Data.tsv", "tsv");
  float maxPopulation = getMaxPopulation(populationData);
  float minPopulation = getMinPopulation(populationData);

  for (int i = 0; i < populationData.getRowCount(); i++) {
    TableRow row = populationData.getRow(i);
    String governorate = row.getString(0);
    float population = row.getFloat(1);
    
    TableRow coordinateRow = findCoordinate(coordinateData, governorate);
    if (coordinateRow != null) {
      float x = map(coordinateRow.getFloat(1), 0, 430, 0, width - 200);
      float y = map(coordinateRow.getFloat(2), 0, 410, 0, height);
      int redValue = (int) map(population, minPopulation, maxPopulation, 255, 150);
      fill(redValue, 0, 0);
      ellipse(x, y, 10, 10);
      
      //display names
      fill(0);
      textAlign(CENTER);
      text(governorate, x, y - 20);
      
      // Check if mouse is over the circle
      if (dist(x, y, mouseX, mouseY) < 5) {
        fill(0);
        textAlign(CENTER);
        text("Population: " +population, mouseX, mouseY + 20);
      }
    }
  }
}

TableRow findCoordinate(Table coordinateData, String governorate) {
  for (TableRow row : coordinateData.rows()) {
    if (row.getString(0).equals(governorate)) {
      return row;
    }
  }
  return null;
}

float getMaxPopulation(Table populationData) {
  float maxPopulation = 0;
  for (int i = 0; i < populationData.getRowCount(); i++) {
    float population = populationData.getFloat(i, 1);
    if (population > maxPopulation) {
      maxPopulation = population;
    }
  }
  return maxPopulation;
}

float getMinPopulation(Table populationData) {
  float minPopulation = Float.MAX_VALUE;
  for (int i = 0; i < populationData.getRowCount(); i++) {
    float population = populationData.getFloat(i, 1);
    if (population < minPopulation) {
      minPopulation = population;
    }
  }
  return minPopulation;
}

void drawLegend(float x, float y) {
  float legendWidth = 150;
  float legendHeight = 20;

  noStroke();
  for (int i = 0; i < legendWidth; i++) {
    float inter = map(i, 0, legendWidth, 0, 1);
    int c = lerpColor(color(255, 0, 0), color(150, 0, 0), inter);
    fill(c);
    rect(x + i, y, 1, legendHeight); 
  }

  fill(0);
  textAlign(LEFT, CENTER);
  text("Low Pop.", x, y + legendHeight + 10);
  textAlign(RIGHT, CENTER);
  text("High Pop.", x + legendWidth, y + legendHeight + 10);
}
