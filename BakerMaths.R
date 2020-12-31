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
  ),
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




# PAIN DE CAMPAGNE

starter_1mature_4water_4white_1wheat <- 
  new("bakersStarter",
      mature_starter_percent = 20,
      water_starter_percent = 80,
      flour_starter_names = c("white", "wheat"),
      flour_starter_percent = c(80, 20))

pain_de_campagne <- 
  new("bakersFormula",
      total_flour_weight = 1000,
      water_base_percent = 78,
      leaven_base_percent = 12,
      flour_base_names = c("white", "wheat"),
      flour_base_percent = c(90, 10),
      other_percent = list(salt = 2, bacon = 7))


setGeneric(name = "bakers_math", def = function(object1, object2) standardGeneric("bakers_math"))

# Baker's math with bakers yeast
## Use object of class bakersFormula
setMethod(f = "bakers_math",
          signature = c("bakersFormula"),
          definition = function(object1) 
          {
            print(object1@total_flour_weight)
          }
)

bakers_math(t2)



# Baker's math with natural leaven
## Use object of class bakersStarter and bakersFormula

object1 = starter_1mature_4water_4white_1wheat
object2 = pain_de_campagne

setMethod(f = "bakers_math",
          signature = c("bakersStarter", "bakersFormula"),
          definition = function(object1, object2) 
          {
            

            
            
            
          }
)

bakers_math(t1, t2)




