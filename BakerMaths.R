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

new("bakersStarter")

# Class for the formula
bakersFormula <- setClass(
  "bakersFormula",
  
  slots = c(
    total_flour_weight = "numeric", # The total flour weight in grams.
    water_base_percent = "numeric", # The amount of water in the formula.
    leaven_base_percent = "numeric", # The leaven in the formula.
    flour_base_names = "character", # The names of each flour type in the starter.
    flour_base_percent = "numeric", # The percentages of each flour type in the starter.
    other_percent = "list"
  ),
  
  prototype = list(
    total_flour_weight = numeric(),
    water_base_percent = numeric(),
    leaven_base_percent = numeric(),
    flour_base_names = character(),
    flour_base_percent = numeric(),
    other_percent = list()
  )
)

validFormulaObject <- function(object) {
  v1 <- length(object@flour_base_names) == length(object@flour_base_percent)
  v2 <- sum(object@flour_base_percent) == 100
  
  if(v1 & v2) { 
    return(TRUE)
  } else if(v1 == FALSE & v2 == TRUE) {
    return("The number of flours named in the formula and the number of percentage values stated are not the same.")
  } else if(v1 == TRUE & v2 == FALSE) { 
    return("Using Baker's Math, the sum of the flours in the formula should be 100%.")
  } else {
    return("(1) The number of flours named in the formula and the number of percentage values stated are not the same; (2) Using Baker's Math, the sum of the flours in the formula should be 100%.")
  }
}

setValidity("bakersFormula", validFormulaObject)


