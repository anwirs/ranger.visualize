
#render tree



renderTree <- function(tree){


  #tree <- buildTree(rForrest=forest,nthTree = 2)
  tree #text form
  graph <- data.tree::ToDiagrammeRGraph(tree)
  DiagrammeR::render_graph(graph)
}
