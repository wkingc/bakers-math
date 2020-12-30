# Class for the starter
bakersStarter <- setClass(
  "bakersStarter",
  
  slots = c(
    mature_starter_percent = "numeric", # The amount of mature starter retained at the time of feeding.
    water_starter_percent = "numeric", # The amount of water in the starter.
    flour_starter_names = "character", # The names of each flour type in the starter.
    flour_starter_percent = "numeric" # The percentages of each flour type in the starter.
  ),
  
  prototype = list(
    mature_starter_percent = numeric(),
    water_starter_percent = numeric(),
    flour_starter_names = character(),
    flour_starter_percent = numeric()
  )
)

validStarterObject <- function(object) {
  v1 <- length(object@flour_starter_names) == length(object@flour_starter_percent)
  v2 <- sum(object@flour_starter_percent) == 100
  
  if(v1 & v2) { 
    return(TRUE)
  } else if(v1 == FALSE & v2 == TRUE) {
    return("The number of flours named in the starter and the number of percentage values stated are not the same.")
  } else if(v1 == TRUE & v2 == FALSE) { 
    return("Using Baker's Math, the sum of the flours in the starter should be 100%.")
  } else {
    return("(1) The number of flours named in the starter and the number of percentage values stated are not the same; (2) Using Baker's Math, the sum of the flours in the starter should be 100%.")
  }
}

setValidity("bakersStarter", validStarterObject)

t1 <- new("bakersStarter", 
          mature_starter_percent = 20,
          water_starter_percent = 80,
          flour_starter_names = c("white", "wheat", "rye"), 
          flour_starter_percent = c(80, 15, 5))

t2 <- new("bakersStarter", 
          mature_starter_percent = 20,
          water_starter_percent = 80,
          flour_starter_names = c("white", "wheat"), 
          flour_starter_percent = c(80, 15, 5))

t3 <- new("bakersStarter", 
          mature_starter_percent = 20,
          water_starter_percent = 80,
          flour_starter_names = c("white", "wheat", "rye"), 
          flour_starter_percent = c(80, 25, 25))

t4 <- new("bakersStarter", 
          mature_starter_percent = 20,
          water_starter_percent = 80,
          flour_starter_names = c("white", "wheat", "rye"), 
          flour_starter_percent = c(80, 25))

