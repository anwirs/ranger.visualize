
library(datasets)
data(iris)
iris
rForest <- ranger::ranger("Species ~ .",data=iris)



devtools::install_github("anwirs/ranger.visualize",force = TRUE)


tree <- ranger.visualize::buildTree(rForest,1)
renderTree(tree)
