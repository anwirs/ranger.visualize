
buildTree <- function(rForrest,nthTree){
  # Initialize the root of the tree
  tree_data = ranger::treeInfo(rForrest,tree=nthTree)

  tree <- Node$new(paste("tree",nthTree,sep=""))


  # Function to recursively add nodes to the tree
  add_nodes <- function(parent_node, node_id) {
      node_info <- tree_data[tree_data$nodeID == node_id, ]
      if (is.numeric(node_info$prediction)) node_info$prediction <- round(node_info$prediction, 2)


      node_label <- ifelse(is.na(node_info$splitvarName),
                           paste("Prediction:", node_info$prediction),
                           paste(node_info$splitvarName, "<=", node_info$splitval))

      child_node <- parent_node$AddChild(node_label)

      if (!is.na(node_info$leftChild)) {
        add_nodes(child_node, node_info$leftChild)
      }
      if (!is.na(node_info$rightChild)) {
        add_nodes(child_node, node_info$rightChild)
      }

  }

  # Building the tree
  add_nodes(tree, 0)



  ###takes too many ressources
  # Convert to DiagrammeR graph

  return(tree)
}
