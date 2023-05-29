# Function to identity all the packages used in a script using "::" to load namespace

#get_packages <- 

# Function to automatically install packages

magic_library <- function(x) {
  y <- x %in% rownames(installed.packages())
  if(any(!y)) install.packages(x[!y])
  invisible(lapply(x, library, character.only=T))
  rm(x, y)
}


