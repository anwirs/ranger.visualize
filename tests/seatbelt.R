
library(datasets)
data(Seatbelts)
Seatbelts
rForest <- ranger::ranger("DriversKilled ~ .",data=Seatbelts)



devtools::install_github("anwirs/ranger.visualize",force = TRUE)


tree <- ranger.visualize::buildTree(rForest,1)
tree
tree |> renderTree()
rForest |> canopy()

