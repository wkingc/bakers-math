source("./bakers_math.R")

Sys.setenv(OPENSSL_CONF="/dev/null")

# starter
  # 1:1.6:0.4:2 (1:2:2)
    # 65g old starter; 104g white; 26g wheat; 130g water = 325g starter 
    # 50% old starter; 80% white; 20% wheat; 0% other; 100% water
starter_1pt_mature_1.6pt_all_purpose_white_0.4pt_whole_wheat_2pt_water <-
  new("bakersStarter",
      mature_starter_percent = 50,
      water_starter_percent = 100,
      flour_starter_names = c("All purpose white flour", "Whole wheat flour"),
      flour_starter_percent = c(80, 20))

#######################################################
# Waimee's Naturally Levained Sandwich Bread (1.0 kg) #
#######################################################
waimees_naturally_levained_sandwich_loaf_1.0kg <-
  new("bakersFormula",
      formula_name = "Waimee's Sandwich Bread (1.0 kg)",
      total_flour_weight = 1000,
      water_base_percent = 78,
      levain_base_percent = 12,
      flour_base_names = c("All purpose white flour", "Whole wheat flour"),
      flour_base_percent = c(90, 10),
      other_names = c("Fine sea salt"),
      other_percent = c(2.2), 
      notes = 
        "1) Feed your starter in the evening and keep it at room temperatue (about 70 degrees) overnight.  In the morning it should have at least doubled in size from the build-up of gas.  If the starter smells like over-ripe fruit you will end up with a more buttery flavour.  If the starter goes longer, it will begin to have a vinergary smell, and the final loaf will be more sour.
        2) Mix the flour and 90-95 degree water in a tub and let it autolyse for about 30 minutes before incorporating the levain and salt.  The target temperature of the dough at the end of the final mix is 77-78 degrees. 
        3) Bulk ferment the dough until it has at most doubled in volume (about 8 hours later in a 70-degree kitchen).  Unlike with baker's yeast, if you allow the bulk ferment to go on for too long, the acidic starter will begin to break down the gluten network in the dough.  Build up the dough's gluten structure by performing four stretch-and-folds at 30 minute intervals during the bulk ferment's first two hours. 
        4) After the bulk ferment, preshape the dough into a two equal size rounds with a slight amount of tension, and let them bench-rest for 15 minutes.
        5) Create a sausage-roll loaf with tension by pushing it back as you roll it (https://www.youtube.com/watch?v=jIzKcred_lc).  Put the loaves seam-side down in a greased 2 lb loaf pans and dust with flour.  Loosely cover each loaf pan with plastic (a disposable plastic shower cap works well) and put in a refrigerator to develop for 12-14 hours.
        7) Preheat your oven to 400 degrees and remove the loaf pans from the refrigerator.  By the time the loaves are ready to bake, the dough should have just crested above the top of each pan.
        8) Bake the loaves for about 40 minutes until the tops are medium brown.
        8) After removing the loaves from the oven, and while still in the loaf pans, brush the tops with butter.  This step will help keep the crust from getting too hard as it cools.
        9) Remove each loaf from their tin and place on a cooling rack for a minimum of two hours, but preferably 3-4 hours, before slicing.")

waimees_naturally_levained_sandwich_loaf_1.0kg_1pt_mature_1.6pt_all_purpose_white_0.4pt_whole_wheat_2pt_water <- bakers_math(starter_1pt_mature_1.6pt_all_purpose_white_0.4pt_whole_wheat_2pt_water, waimees_naturally_levained_sandwich_loaf_1.0kg)

save_kable(waimees_naturally_levained_sandwich_loaf_1.0kg_1pt_mature_1.6pt_all_purpose_white_0.4pt_whole_wheat_2pt_water, file = "./formula/waimees_naturally_levained_sandwich_loaf_1.0kg_1pt_mature_1.6pt_all_purpose_white_0.4pt_whole_wheat_2pt_water.pdf")

waimees_naturally_levained_sandwich_loaf_1.0kg_1pt_mature_1.6pt_all_purpose_white_0.4pt_whole_wheat_2pt_water

###################################################
# Waimee's Naturally Levained Hearth Bread (1 kg) #
###################################################
waimees_naturally_levained_hearth_bread_1kg <-
  new("bakersFormula",
      formula_name = "Waimee's Hearth Bread (1 kg)",
      total_flour_weight = 1000,
      water_base_percent = 78,
      levain_base_percent = 12,
      flour_base_names = c("All purpose white flour", "Whole wheat flour"),
      flour_base_percent = c(90, 10),
      other_names = c("Fine sea salt"),
      other_percent = c(2.2),
      notes = 
        "1) Feed your starter in the evening and keep it at room temperatue (about 70 degrees) overnight.  In the morning it should have doubled in size from the build-up of gas.  If the starter smells like over-ripe fruit you will end up with a more buttery flavour.  If the starter goes longer, it will begin to have a vinergary smell, and the final loaf will be more sour.
         2) Mix the flour and 90-95 degree water in a tub and let it autolyse for about 30 minutes before incorporating the levain and salt.  The target temperature of the dough at the end of the final mix is 77-78 degrees. 
         3) Bulk ferment the dough until it has doubled in volume (about 8 hours later in a 70-degree kitchen).  Build up the dough's gluten structure by performing four stretch-and-folds at 30 minute intervals during the bulk ferment's first two hours.
         4) After the bulk ferment, preshape the dough into two rounds with a slight amount of tension, and let them bench-rest for 15 minutes.
         5) Create two batards or boules (https://www.youtube.com/watch?v=O6INjgO91mg&t=130s) and place them seam-side up in seasoned proofing baskets.  Loosely cover them with plastic and let the dough proof overnight in the fridge for 12-15 hours.
         6) Preheat your cast-iron baking vessel (https://challengerbreadware.com/product/challenger-bread-pan/) in the oven for an hour at 500 degrees.  Place your proofed bread in the baking vessel and score.  If there is enough room without touching the bread, put in an ice cube or two for extra steam.
         7) Place the baking vessel in the oven and adjust to 435 degrees.  Bake for 15 minutes.
         8) After 15 minutes remove the baking vessel cover and bake for another 30 minutes, or until your desired crust color is achieved.")

waimees_naturally_levained_hearth_bread_1kg_1pt_mature_1.6pt_all_purpose_white_0.4pt_whole_wheat_2pt_water <- bakers_math(starter_1pt_mature_1.6pt_all_purpose_white_0.4pt_whole_wheat_2pt_water, waimees_naturally_levained_hearth_bread_1kg)

save_kable(waimees_naturally_levained_hearth_bread_1kg_1pt_mature_1.6pt_all_purpose_white_0.4pt_whole_wheat_2pt_water, file = "./formula/waimees_naturally_levained_hearth_bread_1kg_1pt_mature_1.6pt_all_purpose_white_0.4pt_whole_wheat_2pt_water.pdf")

waimees_naturally_levained_hearth_bread_1kg_1pt_mature_1.6pt_all_purpose_white_0.4pt_whole_wheat_2pt_water

#####################################################
# Waimee's Naturally Levained Hearth Bread (0.5 kg) #
#####################################################
waimees_naturally_levained_hearth_bread_0.5kg <-
  new("bakersFormula",
      formula_name = "Waimee's Hearth Bread (0.5 kg)",
      total_flour_weight = 500,
      water_base_percent = 78,
      levain_base_percent = 12,
      flour_base_names = c("All purpose white flour", "Whole wheat flour"),
      flour_base_percent = c(90, 10),
      other_names = c("Fine sea salt"),
      other_percent = c(2.2),
      notes = 
        "1) Feed your starter in the evening and keep it at room temperatue (about 70 degrees) overnight.  In the morning it should have doubled in size from the build-up of gas.  If the starter smells like over-ripe fruit you will end up with a more buttery flavour.  If the starter goes longer, it will begin to have a vinergary smell, and the final loaf will be more sour.
         2) Mix the flour and 90-95 degree water in a tub and let it autolyse for about 30 minutes before incorporating the levain and salt.  The target temperature of the dough at the end of the final mix is 77-78 degrees. 
         3) Bulk ferment the dough until it has doubled in volume (about 8 hours later in a 70-degree kitchen).  Build up the dough's gluten structure by performing four stretch-and-folds at 30 minute intervals during the bulk ferment's first two hours.
         4) After the bulk ferment, preshape the dough into two rounds with a slight amount of tension, and let them bench-rest for 15 minutes.
         5) Create two batards or boules (https://www.youtube.com/watch?v=O6INjgO91mg&t=130s) and place them seam-side up in seasoned proofing baskets.  Loosely cover them with plastic and let the dough proof overnight in the fridge for 12-15 hours.
         6) Preheat your cast-iron baking vessel (https://challengerbreadware.com/product/challenger-bread-pan/) in the oven for an hour at 500 degrees.  Place your proofed bread in the baking vessel and score.  If there is enough room without touching the bread, put in an ice cube or two for extra steam.
         7) Place the baking vessel in the oven and adjust to 435 degrees.  Bake for 15 minutes.
         8) After 15 minutes remove the baking vessel cover and bake for another 30 minutes, or until your desired crust color is achieved.")

waimees_naturally_levained_hearth_bread_0.5kg_1pt_mature_1.6pt_all_purpose_white_0.4pt_whole_wheat_2pt_water <- bakers_math(starter_1pt_mature_1.6pt_all_purpose_white_0.4pt_whole_wheat_2pt_water, waimees_naturally_levained_hearth_bread_0.5kg)

save_kable(waimees_naturally_levained_hearth_bread_0.5kg_1pt_mature_1.6pt_all_purpose_white_0.4pt_whole_wheat_2pt_water, file = "./formula/waimees_naturally_levained_hearth_bread_0.5kg_1pt_mature_1.6pt_all_purpose_white_0.4pt_whole_wheat_2pt_water.pdf")

waimees_naturally_levained_hearth_bread_0.5kg_1pt_mature_1.6pt_all_purpose_white_0.4pt_whole_wheat_2pt_water

########################################
# Waimee's Pizza Dough (3 Dough Balls) #
########################################
waimees_pizza_dough_3balls <-
  new("bakersFormula",
      formula_name = "Waimee's Pizza Dough (3 Dough Balls)",
      total_flour_weight = 500,
      water_base_percent = 70,
      levain_base_percent = 25,
      flour_base_names = c("Caputo 00 flour", "All purpose white flour", "Whole wheat flour"),
      flour_base_percent = c(75, 20, 5),
      other_names = "Fine sea salt",
      other_percent = 2.8,
      notes = 
        "
        See 'Overnight Levain Pizza Dough' from 'The Elements of Pizza' by Ken Forkish.
      ")

waimees_pizza_dough_3balls_1pt_mature_1.6pt_all_purpose_white_0.4pt_whole_wheat_2pt_water <- bakers_math(starter_1pt_mature_1.6pt_all_purpose_white_0.4pt_whole_wheat_2pt_water, waimees_pizza_dough_3balls)

save_kable(waimees_pizza_dough_3balls_1pt_mature_1.6pt_all_purpose_white_0.4pt_whole_wheat_2pt_water, file = "./formula/waimees_pizza_dough_3balls_1pt_mature_1.6pt_all_purpose_white_0.4pt_whole_wheat_2pt_water.pdf")

waimees_pizza_dough_3balls_1pt_mature_1.6pt_all_purpose_white_0.4pt_whole_wheat_2pt_water
