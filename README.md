# COVID-19: Visualizing the municipalities of hope in Mexico

![](https://img.shields.io/badge/programming-r-276DC3?style=for-the-badge&logo=R)

![](https://img.shields.io/badge/data_manipulation-dplyr-1A162D?style=for-the-badge&logo=Tidyverse)

![](https://img.shields.io/badge/data_visualization-ggplot2-1A162D?style=for-the-badge&logo=Tidyverse)

By summer 2020, the federal government in Mexico presented a program that would lead the re-opening of the economy, *"municipios de la esperanza"* (municipalities of hope).

![This is the map that the federal government of Mexico showed when unveiling the program.](https://external-content.duckduckgo.com/iu/?u=https%253A%252F%252Fwww.alcaldesdemexico.com%252Fwp-content%252Fuploads%252F2020%252F05%252Fmapa-municipios-768x452-1.jpg&f=1&nofb=1&ipt=31f265cfbc56831477c97e1267ce0ca0fe3f5f955c3d820babfe89f1fcf22b5c&ipo=images)

Although the map does a good work to show the geographic extension of the chosen municipalities, it does little to reflect the amount of people that would benefit. This notebook shows the execution process of building a visualization with which better evaluate the extent of this program in Mexico with respect to the population. There are two main parts to this process, data transformation and cartogram plotting.

## Data Transformation

It was necessary to build a table that contained the names of all municipalities in Mexico, along with its population and whether they were part of the program or not.

## Cartogram Plotting

To properly plot the data in a way that was useful to appreciate the impact of the program, certain parameters were changed with respect to the scaling of the polygons and their color.

## Result

![This visualization shows the chosen municipalities (purple) and the remaining ones (yellow).](https://miro.medium.com/max/4800/1*Ds6JdMLPlX3o1s2lmY7kVQ.png)
