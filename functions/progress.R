progress_perc <- function(num_done, total){
    cat("\r", paste0(round(num_done/total*100), "% "))
}

# Example 

# for (i in 1:1000) {

#     Sys.sleep(0.01)

#     progress_perc(num_done = i, total = 1000)
# }