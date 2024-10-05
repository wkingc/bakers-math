require(knitr)
require(kableExtra)

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
    levain_base_percent = "numeric", # The levain in the formula.
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
    levain_base_percent = numeric(),
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

# Baker's math generic
setGeneric(name = "bakers_math", def = function(object1, object2) standardGeneric("bakers_math"))

# Baker's math with bakers yeast -- Uses object of class bakersFormula
setMethod(
  f = "bakers_math",
  signature = c("bakersFormula"),
  definition = function(object1)
  {
    # Formula name and notes
    formula_name = object1@formula_name
    notes = object1@notes
    
    # Total flour weight
    total_flour_weight = object1@total_flour_weight
    names(total_flour_weight) <- "TFL"
    
    # Convert formula percents to decimal values
    water_base_percent = object1@water_base_percent/100
    names(water_base_percent) <- "Water"
    
    flour_base_percent = object1@flour_base_percent/100
    names(flour_base_percent) <- object1@flour_base_names
    
    other_percent = object1@other_percent/100
    names(other_percent) <- object1@other_names
    
    # The amount of water in the formula
    water_total = water_base_percent*total_flour_weight
    
    # The total amount of flour in the formula
    flour_total <- total_flour_weight*flour_base_percent
    
    # The total amount of the other ingredients
    other_total <- total_flour_weight*other_percent
    
    # Create the output table
    tab <- cbind(
      c(names(flour_base_percent), names(water_base_percent), names(other_percent)),
      c(flour_total, water_total, other_total),
      c(flour_base_percent*100, water_base_percent*100, other_percent*100)
    )
    
    colnames(tab) <- c("Ingredient", "Quantity (g)", "Baker's Percentage (%)")
    rownames(tab) <- NULL
    
    ktab <- kbl(tab, escape = F, caption = formula_name) %>%
      kable_styling(bootstrap_options = c("striped", "hover")) %>%
      row_spec(0, color = "#8B0D1A") %>%
      column_spec(1, background = "#E7E5E4", bold = T) %>%
      column_spec(2, background = "#E7E5E4") %>% 
      column_spec(3, background = "#F4F3F3") %>%
      footnote(general = notes)
    
    return(ktab)
  }
)

# Baker's math with natural levain -- Uses object of class bakersStarter and bakersFormula
setMethod(
  f = "bakers_math",
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
    names(mature_starter_percent) <- "Mature, active starter"
    
    water_starter_percent = object1@water_starter_percent/100
    names(water_starter_percent) <- "Water"
    
    flour_starter_percent = object1@flour_starter_percent/100
    names(flour_starter_percent) <- object1@flour_starter_names
    
    # Convert formula percents to decimal values
    water_base_percent = object2@water_base_percent/100
    names(water_base_percent) <- "Water"
    
    levain_base_percent = object2@levain_base_percent/100
    names(levain_base_percent) <- "Levain"
    
    flour_base_percent = object2@flour_base_percent/100
    names(flour_base_percent) <- object2@flour_base_names
    
    other_percent = object2@other_percent/100
    names(other_percent) <- object2@other_names
    
    # The amount of levain in the formula
    levain_in_formula = (total_flour_weight*levain_base_percent)
    names(levain_in_formula) <- "Levain"
    
    # Set differences between the flours in the formula and flours in the starter.
    flour_shared <- intersect(names(flour_base_percent), names(flour_starter_percent))
    flour_base_diff <- setdiff(names(flour_base_percent), names(flour_starter_percent))
    flour_starter_diff <- setdiff(names(flour_starter_percent), names(flour_base_percent))
    flour_union <- union(names(flour_base_percent), names(flour_starter_percent))
    # If there are more flours in the in the starter than formula, fail with an error message.
    if(length(flour_starter_diff) > 0) {
      stop(paste("The starter includes flour not part of the original formula (", tolower(paste(flour_starter_diff, collapse = ", ")), ") and will increase the total flour weight beyond ", object2@total_flour_weight, "g.", sep = ""))
    }
    
    # Harmonize flours from the levain with flours from the formula.
    flour_base_percent <- flour_base_percent[flour_union]
    
    levain_zeros <- rep(0, length(flour_base_diff))
    names(levain_zeros) <- flour_base_diff
    
    flour_starter_percent <- c(flour_starter_percent, levain_zeros)
    flour_starter_percent <- flour_starter_percent[flour_union]
    
    # I cannot think of how it would happen, but in case the flour harmonization fails, this will catch it.
    if(!all(names(flour_base_percent) == names(flour_starter_percent))) stop("The flour harmonization failed.  Please contact the webmaster.")
    
    # The flour contributed to the formula from the levain
    flour_from_levain <- list()
    for(i in 1:length(flour_starter_percent)) {
      flour_from_levain[[i]] <- flour_starter_percent[i]*levain_in_formula
    }
    flour_from_levain <- unlist(flour_from_levain)
    
    # The water contributed to the formula from the levain
    water_from_levain <- water_starter_percent*levain_in_formula
    
    # Total levain in the formula
    levain_total = sum(flour_from_levain, water_from_levain)
    names(levain_total) <- "Levain"
    
    # The amount of additional water in the formula
    water_total = water_base_percent*total_flour_weight
    water_total_no_levain <- water_total - water_from_levain
    
    # The total amount of flour assuming that the flours in the starter and formula are the same.
    flour_total <- total_flour_weight*flour_base_percent
    flour_total_no_levain <- flour_total - flour_from_levain
    
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
      c(names(flour_starter_percent), names(water_base_percent), names(other_percent), names(levain_total)),
      c(flour_total_no_levain, water_total_no_levain, other_total, levain_total),
      c(flour_from_levain, water_from_levain, rep(0, length(other_total)), NA),
      c(flour_total, water_total, other_total, NA),
      c(flour_base_percent*100, water_base_percent*100, other_percent*100, levain_base_percent*100)
    )
    
    colnames(tab) <- c("Ingredient", "Final Dough Mix Quantity (g)", "Quantity in Levain (g)", "Total Recipe Quantity (g)", "Baker's Percentage (%)")
    rownames(tab) <- NULL
    
    levain_ind = which(tab[, "Ingredient"] == "Levain")
    tab[levain_ind, "Ingredient"] <- paste0(tab[levain_ind, "Ingredient"], footnote_marker_symbol(1))
    tab[levain_ind, "Baker's Percentage (%)"] <- paste0(tab[levain_ind, "Baker's Percentage (%)"], footnote_marker_symbol(2))
    
    ktab <- kbl(tab, escape = F, caption = formula_name) %>%
      kable_styling(bootstrap_options = c("striped", "hover")) %>%
      row_spec(0, color = "#8B0D1A") %>%
      column_spec(1, background = "#E7E5E4", bold = T) %>%
      column_spec(2, background = "#E7E5E4") %>%
      column_spec(3:5, background = "#F4F3F3") %>%
      add_header_above(c("Final Dough" = 2, "Baker's Formula" = 3), color = "#8B0D1A") %>%
      footnote(
        general = notes, 
        symbol = c(starter_ratios_cat, "The baker's percentage for levain is the amount of flour in the levain expressed as a percentage of the total flour in the recipie.")
      )
    
    return(ktab)
  }
)