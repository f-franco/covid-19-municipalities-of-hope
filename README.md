# COVID-19: Visualizing the municipalities of hope in Mexico

![](https://img.shields.io/badge/programming-r-276DC3?style=for-the-badge&logo=R)

![](https://img.shields.io/badge/data_manipulation-dplyr-1A162D?style=for-the-badge&logo=Tidyverse)

![](https://img.shields.io/badge/data_visualization-ggplot2-1A162D?style=for-the-badge&logo=Tidyverse)

By summer 2020, the federal government in Mexico presented a program that would lead the re-opening of the economy, *"municipios de la esperanza"* (municipalities of hope).

![](https://miro.medium.com/max/4800/0*fjayNL4CD2na1uIc.png)

> *This map is similar to the one shown by Mexico's federal government during the presentation of this policy.*

Although the map does a good work to show the geographic extension of the chosen municipalities, it does little to reflect the amount of people that would benefit. This notebook shows the execution process of building a visualization with which better evaluate the extent of this program in Mexico with respect to the population. There are two main parts to this process, data transformation and cartogram plotting.

## Data Transformation

It was necessary to build a table that contained the names of all municipalities in Mexico, along with its population and whether they were part of the program or not.

## Cartogram Plotting

To properly plot the data in a way that was useful to appreciate the impact of the program, certain parameters were changed with respect to the scaling of the polygons and their color.

## Result

Each colored polygon represents a municipality. The color of each polygon indicates whether the municipality was classified as "municipio de la esperanza" (purple) or not (yellow). The size of each polygon is proportional to the population of each municipality, and the original borders are included for easier viewing.

![](https://miro.medium.com/max/4800/1*Ds6JdMLPlX3o1s2lmY7kVQ.png)

To see a more detailed look at the building process, you can visit my post in [Medium](https://f-franco.medium.com/covid-19-the-measure-of-hope-73b2242f56c).
