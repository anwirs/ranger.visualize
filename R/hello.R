# Hello, world!
#
# This is an example function named 'hello'
# which prints 'Hello, world!'.
#
# You can learn more about package authoring with RStudio at:
#
#   http://r-pkgs.had.co.nz/
#
# Some useful keyboard shortcuts for package authoring:
#
#   Install Package:           'Ctrl + Shift + B'
#   Check Package:             'Ctrl + Shift + E'
#   Test Package:              'Ctrl + Shift + T'



install.packages("devtools")
install.packages("roxygen2")
#devtools::create("ranger.visualize")



library(data.tree)
library(DiagrammeR)


library(datasets)
data(iris)
iris

forest <- ranger::ranger("Species ~ .",data=iris)
forest |> summary()



forest |> ranger::treeInfo()

source("./R/buildTree.R")
buildTree(rForrest=forest,nthTree = 1)
