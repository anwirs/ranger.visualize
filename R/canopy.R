

canopy <- function(rForest){

  FirstSplitVariable <- c()
  FirstSplitVariableValue <- c()

  # get top nodes
  for (i in 1:rForest$num.trees){
    tree <- ranger::treeInfo(rForest,i)
    FirstSplitVariable[i] <- tree$splitvarName[1]
    FirstSplitVariableValue[i] <- tree$splitval[1]
    tree |> head()
  }
  #print(FirstSplitVariable)




  # Create a table of frequencies
  frequency_table <- table(FirstSplitVariable) |> as.data.frame()
  frequency_table$RelFreq <- frequency_table$Freq / length(FirstSplitVariable)

  frequency_table

  #print(length(FirstSplitVariable))


  #var stats
  for (i in 1:length(frequency_table$FirstSplitVariable)){
    varName <- frequency_table$FirstSplitVariable[i]
    values <- FirstSplitVariableValue[FirstSplitVariable==varName]

    frequency_table$mean[i] <- mean(values) |> round(2)
    frequency_table$min[i] <- min(values) |> round(2)
    frequency_table$max[i] <- max(values) |> round(2)
    frequency_table$variance[i] <- var(values) |> round(2)


  }



  # Print
  frequency_table <- frequency_table[order(frequency_table$Freq),] #sort
  frequency_table <-frequency_table[nrow(frequency_table):1,] #reverse order


  return(frequency_table)
}
canopy(rForest )
