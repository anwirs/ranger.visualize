\name{buildTree}
\title{Extract tree from ranger::ranger() forest}
\usage{
buildTree(
  rForrest,
  nthTree=1
)
}
\description{

}
\examples{
library(datasets)
data(iris)
rForest <- ranger::ranger("Species ~ .",data=iris)
tree <- ranger.visualize::buildTree(rForest,1)
}
