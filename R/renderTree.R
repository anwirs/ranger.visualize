
#render tree



renderTree <- function(tree){


  #tree <- buildTree(rForrest=forest,nthTree = 2)
  tree #text form
  graph <- ToDiagrammeRGraph(tree)
  render_graph(graph)
}
