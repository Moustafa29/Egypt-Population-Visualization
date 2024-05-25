# Egypt Population Visualization

This project visualizes the population distribution across different governorates in Egypt using the Processing IDE. The visualization is displayed on a map of Egypt, with color-coded circles representing the population sizes of each governorate. The project includes interactive tooltips that provide additional population information when you hover over each circle.

## Features

- **Map Visualization**: Displays a map of Egypt with population data overlaid on it.
- **Color-Coded Circles**: Each governorate is represented by a circle whose color intensity indicates its population size.
- **Interactive Tooltips**: Hover over a circle to see the detailed population information.
- **Legend**: A color legend indicates the range of population sizes from low to high.

## Files

- `pop.csv`: Contains the population data for each governorate.
- `egypt.jpeg`: The image of the map of Egypt.
- `Data.tsv`: Contains the coordinates for the governorates.
- `sketch.pde`: The main Processing file containing the code for the visualization.

## Code Explanation

The `setup` function initializes the visualization by loading the data, displaying the map, plotting the population data, and drawing the legend.

The `draw` function updates the visualization by redrawing the map and the population data to ensure the interactive tooltips are correctly displayed.

### Functions

- `plotPopulationData(Table populationData)`: Plots the population data on the map using circles whose sizes and colors represent the population sizes.
- `findCoordinate(Table coordinateData, String governorate)`: Finds the coordinates for a given governorate.
- `getMaxPopulation(Table populationData)`: Returns the maximum population value from the data.
- `getMinPopulation(Table populationData)`: Returns the minimum population value from the data.
- `drawLegend(float x, float y)`: Draws a color legend indicating the population range.

## Data Format

### Population Data (`pop.csv`)
The CSV file should have the following format:
```
Governorate,Population
Cairo,9500000
Alexandria,5000000
...
```

### Coordinates Data (`Data.tsv`)
The TSV file should have the following format:
```
Governorate	X	Y
Cairo	200	150
Alexandria	300	200
...
```

## Data Source

Population data is sourced from [Statista](https://www.statista.com/statistics/1229759/total-population-of-egypt-by-governorate/).

## Acknowledgements
- Population data sourced from [Statista](https://www.statista.com/statistics/1229759/total-population-of-egypt-by-governorate/).
- Developed using the Processing IDE.

## Output

![Visualization](https://github.com/Moustafa29/Egypt-Population-Visualization/blob/master/output.png)

