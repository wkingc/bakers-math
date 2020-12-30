bakers_formula <- function(x) {
  total_flour_weight = x$total_flour_weight
  
  white_base_percent = x$white_base_percent/100
  wheat_base_percent = x$wheat_base_percent/100
  other_base_percent = x$other_base_percent/100
  water_base_percent = x$water_base_percent/100
  
  starter_base_percent = x$starter_base_percent/100
  
  white_starter_percent = x$white_starter_percent/100
  wheat_starter_percent = x$wheat_starter_percent/100
  other_starter_percent = x$other_starter_percent/100
  water_starter_percent = x$water_starter_percent/100
  
  salt_percent = x$salt_percent
  fat_percent = x$fat_percent
  instant_dried_yeast_percent = x$instant_dried_yeast_percent
  
  if((white_base_percent + wheat_base_percent + other_base_percent) != 1) stop("The flour weight must sum to 1")
  if((white_starter_percent + wheat_starter_percent + other_starter_percent) != 1) stop("The flour weight in the starter must sum to 1")
  
  white_flour_starter = (total_flour_weight*starter_base_percent)*white_starter_percent
  wheat_flour_starter = (total_flour_weight*starter_base_percent)*wheat_starter_percent
  other_flour_starter = (total_flour_weight*starter_base_percent)*other_starter_percent
  water_starter = (total_flour_weight*starter_base_percent)*water_starter_percent
  
  starter_total = white_flour_starter + wheat_flour_starter + other_flour_starter + water_starter
  
  white_total = total_flour_weight*white_base_percent - white_flour_starter
  wheat_total = total_flour_weight*wheat_base_percent - wheat_flour_starter
  other_total = total_flour_weight*other_base_percent - other_flour_starter
  water_total = total_flour_weight*water_base_percent - water_starter
  
  starter_ratios <- 
    paste("(1 pt mature starter; ", 
          (white_starter_percent)/(x$mature_starter_percent/100), " pt white flour; ", 
          (wheat_starter_percent)/(x$mature_starter_percent/100), " pt wheat flour; ", 
          (other_starter_percent)/(x$mature_starter_percent/100), " pt other flour; ", 
          (water_starter_percent)/(x$mature_starter_percent/100), " pt water)",
          sep =  "")
  
  tfl_cat <- 
    paste("The total flour weight (TFL) is ", x$total_flour_weight, "g.", sep = "")
  
  starter_cat <- 
    paste(starter_total, "g (", starter_base_percent*100, "% TFL) of leaven ", starter_ratios,
          sep = "")
  
  white_cat <- 
    paste(white_total, "g (", white_base_percent*100,
          "% TFL) of white flour in addition to the ", white_flour_starter, 
          "g coming from the leaven.", 
          sep = "")
  
  wheat_cat <- 
    paste(wheat_total, "g (", wheat_base_percent*100, 
          "% TFL) of wheat flour in addition to the ", wheat_flour_starter, 
          "g coming from the leaven.", 
          sep = "")
  
  other_cat <- 
    paste(other_total, "g (", other_base_percent*100, 
          "% TFL) of other flour in addition to the ", other_flour_starter, 
          "g coming from the leaven.", 
          sep = "")
  
  water_cat <- 
    paste(water_total, "g (", water_base_percent*100, 
          "% TFL) of water in addition to the ", water_starter, 
          "g coming from the leaven.", 
          sep = "")
  
  salt_cat <- 
    paste((salt_percent/100)*total_flour_weight, "g (" , salt_percent, "% TFL) of salt.",
          sep = "")
  
  fat_cat <- 
    paste((fat_percent/100)*total_flour_weight, "g (" , fat_percent, "% TFL) of fat.",
          sep = "")
  
  instant_dried_yeast_cat <- 
    paste((instant_dried_yeast_percent/100)*total_flour_weight, "g (" , 
          instant_dried_yeast_percent, "% TFL) of instant dried yeast.",
          sep = "")
  
  cat("--", tfl_cat, "\n",
      "--", starter_cat, "\n",
      "--", white_cat, "\n",
      "--", wheat_cat, "\n",
      "--", other_cat, "\n",
      "--", water_cat, "\n",
      "--", salt_cat, "\n",
      "--", fat_cat, "\n",
      "--", instant_dried_yeast_cat)
  
  # cat("There is a total of", starter_total, "g of starter\n",
  #     "There is a total of", white_total, "g of white flour.\n",
  #     "There is a total of", wheat_total, "g of wheat flour.\n",
  #     "There is a total of", other_total, "g of other flour.\n",
  #     "There is a total of", water_total, "g of water.\n",
  #     "There is a total of", (salt_percent/100)*total_flour_weight, "g of salt.\n",
  #     "There is a total of", (fat_percent/100)*total_flour_weight, "g of fat\n",
  #     "There is a total of", (instant_dried_yeast_percent/100)*total_flour_weight, "g of instant dried yeast."
  #     )
}

# Notation
  # starter:White:Wheat:Other:Water

# starter
  # 1:4:1:0:4 (1:5:4)
    # 50g old starter; 200g white; 50g wheat; 0g other; 200g water = 500g starter
    # 20% old; 80% white; 20% wheat; 0% other; 80% water
pain_de_campagne_1_4_1_0_4 <- 
  list(total_flour_weight = 1000, 
       white_base_percent = 90,
       wheat_base_percent = 10,
       other_base_percent = 0,
       water_base_percent = 78,
       starter_base_percent = 20,
       mature_starter_percent = 20,
       white_starter_percent = 80,
       wheat_starter_percent = 20,
       other_starter_percent = 0,
       water_starter_percent = 80,
       salt_percent = 2.1,
       fat_percent = 0,
       instant_dried_yeast_percent = 0.2)

bakers_formula(pain_de_campagne_1_4_1_0_4)

overnight_country_blonde_1_4_1_0_4 <- 
  list(total_flour_weight = 1000, 
       white_base_percent = 90,
       wheat_base_percent = 10,
       other_base_percent = 0,
       water_base_percent = 78,
       starter_base_percent = 12,
       mature_starter_percent = 20,
       white_starter_percent = 80,
       wheat_starter_percent = 20,
       other_starter_percent = 0,
       water_starter_percent = 80,
       salt_percent = 2.2,
       fat_percent = 0,
       instant_dried_yeast_percent = 0)

bakers_formula(overnight_country_blonde_1_4_1_0_4)

overnight_country_blonde_wfat_1_4_1_0_4 <- 
  list(total_flour_weight = 1000, 
       white_base_percent = 90,
       wheat_base_percent = 10,
       other_base_percent = 0,
       water_base_percent = 78,
       starter_base_percent = 12,
       mature_starter_percent = 20,
       white_starter_percent = 80,
       wheat_starter_percent = 20,
       other_starter_percent = 0,
       water_starter_percent = 80,
       salt_percent = 2.2,
       fat_percent = 3,
       instant_dried_yeast_percent = 0)

bakers_formula(overnight_country_blonde_wfat_1_4_1_0_4)

# starter
  # 1:1:1:0:2 (1:2:2)
    # 100g starter; 100g white; 100g wheat; 0g other; 200g water = 500g of starter
    # 50% old; 50% white; 50% wheat; 0% other; 100% water
pain_de_campagne_1_1_1_0_2 <- 
  list(total_flour_weight = 1000, 
       white_base_percent = 90,
       wheat_base_percent = 10,
       other_base_percent = 0,
       water_base_percent = 78,
       starter_base_percent = 20,
       mature_starter_percent = 50,
       white_starter_percent = 50,
       wheat_starter_percent = 50,
       other_starter_percent = 0,
       water_starter_percent = 100,
       salt_percent = 2.1,
       fat_percent = 0,
       instant_dried_yeast_percent = 0.2)

bakers_formula(pain_de_campagne_1_1_1_0_2)

overnight_country_blonde_1_1_1_0_2 <- 
  list(total_flour_weight = 500, 
       white_base_percent = 90,
       wheat_base_percent = 10,
       other_base_percent = 0,
       water_base_percent = 78,
       starter_base_percent = 12,
       mature_starter_percent = 50,
       white_starter_percent = 50,
       wheat_starter_percent = 50,
       other_starter_percent = 0,
       water_starter_percent = 100,
       salt_percent = 2.2,
       fat_percent = 0,
       instant_dried_yeast_percent = 0)

bakers_formula(overnight_country_blonde_1_1_1_0_2)

# starter
  # 1:1.6:0.4:0:2 (1:2:2)
    # 65g old starter; 104g white; 26g wheat; 0g other; 130g water = 325g starter 
    # 50% old starter; 80% white; 20% wheat; 0% other; 100% water
pain_de_campagne_1_1.6_0.4_0_2 <- 
  list(total_flour_weight = 500, 
       white_base_percent = 90,
       wheat_base_percent = 10,
       other_base_percent = 0,
       water_base_percent = 78,
       starter_base_percent = 20,
       mature_starter_percent = 50,
       white_starter_percent = 80,
       wheat_starter_percent = 20,
       other_starter_percent = 0,
       water_starter_percent = 100,
       salt_percent = 2.1,
       fat_percent = 0,
       instant_dried_yeast_percent = 0.2)

bakers_formula(pain_de_campagne_1_1.6_0.4_0_2)

overnight_country_blonde_1_1.6_0.4_0_2 <- 
  list(total_flour_weight = 500, 
       white_base_percent = 90,
       wheat_base_percent = 10,
       other_base_percent = 0,
       water_base_percent = 78,
       starter_base_percent = 12,
       mature_starter_percent = 50,
       white_starter_percent = 80,
       wheat_starter_percent = 20,
       other_starter_percent = 0,
       water_starter_percent = 100,
       salt_percent = 2.2,
       fat_percent = 0,
       instant_dried_yeast_percent = 0)

bakers_formula(overnight_country_blonde_1_1.6_0.4_0_2)

overnight_country_brown_1_1.6_0.4_0_2 <- 
  list(total_flour_weight = 1000, 
       white_base_percent = 70,
       wheat_base_percent = 30,
       other_base_percent = 0,
       water_base_percent = 78,
       starter_base_percent = 12,
       mature_starter_percent = 50,
       white_starter_percent = 80,
       wheat_starter_percent = 20,
       other_starter_percent = 0,
       water_starter_percent = 100,
       salt_percent = 2.2,
       fat_percent = 0,
       instant_dried_yeast_percent = 0)

bakers_formula(overnight_country_brown_1_1.6_0.4_0_2)

whole_wheat_1_1.6_0.4_0_2 <- 
  list(total_flour_weight = 500, 
       white_base_percent = 25,
       wheat_base_percent = 75,
       other_base_percent = 0,
       water_base_percent = 82,
       starter_base_percent = 20,
       mature_starter_percent = 50,
       white_starter_percent = 80,
       wheat_starter_percent = 20,
       other_starter_percent = 0,
       water_starter_percent = 100,
       salt_percent = 2.1,
       fat_percent = 0,
       instant_dried_yeast_percent = 0.175)

bakers_formula(whole_wheat_1_1.6_0.4_0_2)

wade_blonde_1_1_1.6_0.4_0_2 <- 
  list(total_flour_weight = 500, 
       white_base_percent = 90,
       wheat_base_percent = 10,
       other_base_percent = 0,
       water_base_percent = 78,
       starter_base_percent = 10,
       mature_starter_percent = 50,
       white_starter_percent = 80,
       wheat_starter_percent = 20,
       other_starter_percent = 0,
       water_starter_percent = 100,
       salt_percent = 2.2,
       fat_percent = 0,
       instant_dried_yeast_percent = 0)

bakers_formula(wade_blonde_1_1_1.6_0.4_0_2)

pain_au_bacon_1_1_1.6_0.4_0_2 <- 
  list(total_flour_weight = 1000, 
       white_base_percent = 96,
       wheat_base_percent = 4,
       other_base_percent = 0,
       water_base_percent = 78,
       starter_base_percent = 10,
       mature_starter_percent = 50,
       white_starter_percent = 80,
       wheat_starter_percent = 20,
       other_starter_percent = 0,
       water_starter_percent = 100,
       salt_percent = 2,
       fat_percent = 0,
       instant_dried_yeast_percent = 0)

bakers_formula(pain_au_bacon_1_1_1.6_0.4_0_2)







