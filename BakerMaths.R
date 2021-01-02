library(kableExtra)

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
  } else if(v1 == FALSE) {
    return("The number of flours named in the starter and the number of percentage values stated should be equal.")
  } else if(v2 == FALSE) { 
    return("Using Baker's Math, the sum of the flours in the starter should be 100%.")
  } else {
    return("Something weird happened...")
  }
}

setValidity("bakersStarter", validStarterObject)

# Class for the formula
bakersFormula <- setClass(
  "bakersFormula",
  
  slots = c(
    formula_name = "character", # A name for the formula.
    total_flour_weight = "numeric", # The total flour weight in grams.
    water_base_percent = "numeric", # The amount of water in the formula.
    leaven_base_percent = "numeric", # The leaven in the formula.
    flour_base_names = "character", # The names of each flour type in the formula.
    flour_base_percent = "numeric", # The percentages of each flour type in the formula.
    other_names = "character", # The names of each additional ingredient in the formula.
    other_percent = "numeric", # The percentages of each additional ingredient in the formula.
    notes = "character" # Additional notes required to apply the formula.
  ),
  
  prototype = list(
    formula_name = character(),
    total_flour_weight = numeric(),
    water_base_percent = numeric(),
    leaven_base_percent = numeric(),
    flour_base_names = character(),
    flour_base_percent = numeric(),
    other_names = character(),
    other_percent = numeric(), 
    notes = character()
  ),
)

validFormulaObject <- function(object) {
  v1 <- length(object@flour_base_names) == length(object@flour_base_percent)
  v2 <- sum(object@flour_base_percent) == 100
  v3 <- length(object@other_names) == length(object@other_percent)
  
  if(v1 & v2 & v3) { 
    return(TRUE)
  } else if(v1 == FALSE) {
    return("The number of flours named in the formula and the number of percentage values stated should be the equal.")
  } else if(v2 == FALSE) { 
    return("Using Baker's Math, the sum of the flours in the formula should be 100%.")
  } else if(v3 == FALSE) { 
    return("The number of other ingredients named in the formula and the number of percentage values stated should be equal.")
  } else {
    return("Something weird happened...")
  }
}

setValidity("bakersFormula", validFormulaObject)

setGeneric(name = "bakers_math", def = function(object1, object2) standardGeneric("bakers_math"))

# Baker's math with bakers yeast
## Use object of class bakersFormula

# setMethod(f = "bakers_math",
#           signature = c("bakersFormula"),
#           definition = function(object1)
#           {
#             print(object1@total_flour_weight)
#           }
# )
# 
# bakers_math(t2)

# Baker's math with natural leaven
## Use object of class bakersStarter and bakersFormula

setMethod(f = "bakers_math",
          signature = c("bakersStarter", "bakersFormula"),
          definition = function(object1, object2)
          {
            # Formula name and notes
            formula_name = object2@formula_name
            notes = object2@notes
            
            # Total flour weight
            total_flour_weight = object2@total_flour_weight
            names(total_flour_weight) <- "TFL"
            
            # Convert starter percents to decimal values
            mature_starter_percent = object1@mature_starter_percent/100
            names(mature_starter_percent) <- "Mature, active leaven"
            
            water_starter_percent = object1@water_starter_percent/100
            names(water_starter_percent) <- "Water"
            
            flour_starter_percent = object1@flour_starter_percent/100
            names(flour_starter_percent) <- object1@flour_starter_names
            
            # Convert formula percents to decimal values
            water_base_percent = object2@water_base_percent/100
            names(water_base_percent) <- "Water"
            
            leaven_base_percent = object2@leaven_base_percent/100
            names(leaven_base_percent) <- "Leaven"
            
            flour_base_percent = object2@flour_base_percent/100
            names(flour_base_percent) <- object2@flour_base_names
            
            other_percent = object2@other_percent/100
            names(other_percent) <- object2@other_names
            
            # The amount of leaven in the formula
            leaven_in_formula = (total_flour_weight*leaven_base_percent)
            names(leaven_in_formula) <- "Leaven"
            
            # Set differences between the flours in the formula and flours in the starter.
            flour_shared <- intersect(names(flour_base_percent), names(flour_starter_percent))
            flour_base_diff <- setdiff(names(flour_base_percent), names(flour_starter_percent))
            flour_starter_diff <- setdiff(names(flour_starter_percent), names(flour_base_percent))
            flour_union <- union(names(flour_base_percent), names(flour_starter_percent))
            # If there are more flours in the in the starter than formula, fail with an error message.
            if(length(flour_starter_diff) > 0) {
              stop(paste("The starter includes flour not part of the original formula (", tolower(paste(flour_starter_diff, collapse = ", ")), 
                         ") and will increase the total flour weight beyond ", object2@total_flour_weight, "g.", sep = ""))
            }
            
            # Harmonize flours from the leaven with flours from the formula.
            flour_base_percent <- flour_base_percent[flour_union]
            
            leaven_zeros <- rep(0, length(flour_base_diff))
            names(leaven_zeros) <- flour_base_diff
            
            flour_starter_percent <- c(flour_starter_percent, leaven_zeros)
            flour_starter_percent <- flour_starter_percent[flour_union]

            # I cannot think of how it would happen, but in case the flour harmonization fails, this will catch it.
            if(!all(names(flour_base_percent) == names(flour_starter_percent))) stop("The flour harmonization failed.  Please contact the webmaster.")
            
            # The flour contributed to the formula from the leaven
            flour_from_leaven <- list()
            for(i in 1:length(flour_starter_percent)) {
              flour_from_leaven[[i]] <- flour_starter_percent[i]*leaven_in_formula
            }
            flour_from_leaven <- unlist(flour_from_leaven)
            
            # The water contributed to the formula from the leaven
            water_from_leaven <- water_starter_percent*leaven_in_formula
            
            # Total leaven in the formula
            leaven_total = sum(flour_from_leaven, water_from_leaven)
            names(leaven_total) <- "Leaven"
            
            # The amount of additional water in the formula
            water_total = water_base_percent*total_flour_weight
            water_total_no_leaven <- water_total - water_from_leaven
            
            # The total amount of flour assuming that the flours in the starter and formula are the same.
            flour_total <- total_flour_weight*flour_base_percent
            flour_total_no_leaven <- flour_total - flour_from_leaven
            
            # The total amount of the other ingredients
            other_total <- total_flour_weight*other_percent
            
            # Starter ratios
            starter_ratios <- c(mature_starter_percent/mature_starter_percent, flour_starter_percent/mature_starter_percent, water_starter_percent/mature_starter_percent)
            
            # Starter ratios cat
            starter_cat_constructor <- list()
            for(i in 1:length(starter_ratios)) {
              starter_cat_constructor[i] <- paste(starter_ratios[i], " part ", names(starter_ratios)[i], sep = "")
            }
            
            starter_ratios_cat <- paste(do.call("c", starter_cat_constructor), collapse = "; ")
            starter_ratios_cat <- tolower(starter_ratios_cat)
            
            # Create the output table
            tab <- cbind(
              c(names(flour_starter_percent), names(water_base_percent), names(other_percent), names(leaven_total)),
              c(flour_total_no_leaven, water_total_no_leaven, other_total, leaven_total),
              c(flour_from_leaven, water_from_leaven, rep(0, length(other_total)), NA),
              c(flour_total, water_total, other_total, NA),
              c(flour_base_percent*100, water_base_percent*100, other_percent*100, leaven_base_percent*100)
            )
            
            colnames(tab) <- c("Ingredient", "Final Dough Mix Quantity (g)", "Quantity in Leaven (g)", "Total Recipe Quantity (g)", "Baker's Percentage (%)")
            rownames(tab) <- NULL
            
            leaven_ind = which(tab[, "Ingredient"] == "Leaven")
            tab[leaven_ind, "Ingredient"] <- paste0(tab[leaven_ind, "Ingredient"], footnote_marker_symbol(1))
            tab[leaven_ind, "Baker's Percentage (%)"] <- paste0(tab[leaven_ind, "Baker's Percentage (%)"], footnote_marker_symbol(2))
            
            ktab <- kbl(tab, escape = F, caption = formula_name) %>%
              kable_styling(bootstrap_options = c("striped", "hover")) %>%
              row_spec(0, color = "#8B0D1A") %>%
              column_spec(1, background = "#E7E5E4", bold = T) %>%
              column_spec(2, background = "#E7E5E4", border_right = T) %>%
              column_spec(3:5, background = "#F4F3F3") %>%
              add_header_above(c("Final Dough" = 2, "Baker's Formula" = 3), color = "#8B0D1A") %>%
              footnote(general = notes, 
                       symbol = c(starter_ratios_cat, 
                                  "The baker's percentage for leaven is the amount of flour in the leaven expressed as a percentage of the total flour in the recipie.")
              )
            
            return(ktab)
          }
)
