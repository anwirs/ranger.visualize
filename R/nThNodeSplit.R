showFirstNodes <- function(rForest){

  topNodes <- c()
  for (i in 1:rForest$num.trees){
    forest <- treeInfo(rForest,i)
    topNodes[i] <- forest$splitvarName[1]
    forest |> head()
  }
  print(topNodes)
  string_vector <-  topNodes




  # Step 1: Create a table of frequencies
  frequency_table <- table(string_vector) |> as.data.frame()
  print(length(string_vector))

  # Calculate relative frequency
  #total_count <- sum(frequency_df$Freq)
  #frequency_df$RelativeFreq <- frequency_df$Freq / total_count


  # Print
  frequency_table <- frequency_table[order(frequency_table$Freq),] #sort
  frequency_table <-frequency_table[nrow(frequency_table):1,] #reverse order


  print(frequency_table)

}
