source("./bakers_math.R")

Sys.setenv(OPENSSL_CONF = "/dev/null")

# starter
  # 1:1.6:0.4:2 (1:2:2)
    # 65g old starter; 104g white; 26g wheat; 130g water = 325g starter 
    # 50% old starter; 80% white; 20% wheat; 0% other; 100% water
starter_1pt_mature_1.6pt_all_purpose_white_0.4pt_whole_wheat_2pt_water <-
    new(
        "bakersStarter",
        mature_starter_percent = 50,
        water_starter_percent = 100,
        flour_starter_names = c("All purpose flour", "Whole wheat flour"),
        flour_starter_percent = c(80, 20))

####################################
# Waimee's Levained Sandwich Bread #
####################################
waimee_levain_sandwich_bread <-
    new(
        "bakersFormula",
        formula_name = "Waimee's Sandwich Bread",
        total_flour_weight = 500,
        water_base_percent = 78,
        levain_base_percent = 12,
        flour_base_names = c("All purpose flour", "Whole wheat flour"),
        flour_base_percent = c(90, 10),
        other_names = c("Fine sea salt"),
        other_percent = c(2.2), 
        notes = 
            "1) Feed your levain with 80 degree water and keep it at room temperatue for about 8 hours until it has doubled in size from the build-up of gas.  If the starter smells like over-ripe fruit you will end up with a more buttery flavour.  If the starter goes longer, it will begin to have a vinergary smell, and the final loaf will be more sour.
        2) Mix the flour and 90-95 degree water in a tub and let it autolyse for about 30 minutes before incorporating the levain and salt.  The target temperature of the dough at the end of the final mix is 77-78 degrees. 
        3) Bulk ferment the dough until it's visibly risen and bubbly, about 8 hours after incorporating the levain.  Build up the dough's gluten structure by performing four stretch-and-folds at 30 minute intervals during the bulk ferment's first two hours. 
        4) After the bulk ferment, preshape the dough into a round with a slight amount of tension, and let it bench-rest for 15 minutes.
        5) Create a sausage-roll loaf with tension by pushing it back as you roll it (see https://www.youtube.com/watch?v=jIzKcred_lc for shaping technique).  Put the loaf seam-side down in a greased 2 lb loaf pan and dust with flour.  Loosely cover each loaf pan (a disposable plastic shower cap works well!) and put in a refrigerator to proof for 12-14 hours.
        6) Preheat your oven to 400 degrees and remove the loaf pans from the refrigerator.  By the time the loaves are ready to bake, the dough should have just crested above the top of each pan.
        7) Bake the loaves for about 40 minutes until the tops are medium brown.
        8) After removing the loaves from the oven, and while still in the loaf pans, brush the tops with butter.  This step will help keep the crust from getting too hard as it cools.
        9) Remove each loaf from their tin and place on a cooling rack for a minimum of one hour before slicing.")

waimee_levain_sandwich_bread_1pt_mature_1.6pt_all_purpose_white_0.4pt_whole_wheat_2pt_water <- bakers_math(starter_1pt_mature_1.6pt_all_purpose_white_0.4pt_whole_wheat_2pt_water, waimee_levain_sandwich_bread)

save_kable(waimee_levain_sandwich_bread_1pt_mature_1.6pt_all_purpose_white_0.4pt_whole_wheat_2pt_water, file = "./formula/waimee_levain_sandwich_loaf.pdf")

waimee_levain_sandwich_bread_1pt_mature_1.6pt_all_purpose_white_0.4pt_whole_wheat_2pt_water

##################################
# Waimee's Levained Hearth Bread #
##################################
waimee_levain_hearth_bread <-
    new(
        "bakersFormula",
        formula_name = "Waimee's Hearth Bread",
        total_flour_weight = 500,
        water_base_percent = 78,
        levain_base_percent = 12,
        flour_base_names = c("All purpose flour", "Whole wheat flour"),
        flour_base_percent = c(90, 10),
        other_names = c("Fine sea salt"),
        other_percent = c(2.2),
        notes = 
            "1) Feed your levain with 80 degree water and keep it at room temperatue for about 8 hours until it has doubled in size from the build-up of gas.  If the starter smells like over-ripe fruit you will end up with a more buttery flavour.  If the starter goes longer, it will begin to have a vinergary smell, and the final loaf will be more sour.
         2) Mix the flour and 90-95 degree water in a tub and let it autolyse for about 30 minutes before incorporating the levain and salt.  The target temperature of the dough at the end of the final mix is 77-78 degrees. 
         3) Bulk ferment the dough until it's visibly risen and bubbly, about 8 hours after incorporating the levain.  Build up the dough's gluten structure by performing four stretch-and-folds at 30 minute intervals during the bulk ferment's first two hours.
         4) After the bulk ferment, preshape the dough into a round with a slight amount of tension, and let it bench-rest for 15 minutes.
         5) Create a batard or boule (see https://www.youtube.com/watch?v=O6INjgO91mg&t=130s for shaping technique) and place it seam-side up in 50% flour/50% rice flour seasoned proofing basket.  Loosely cover the proofing basket (a disposable plastic shower cap works well!) and put in a refrigerator to proof for 12-14 hours.
         6) Preheat your cast-iron baking vessel (see https://challengerbreadware.com/product/challenger-bread-pan/ for a recommendation) in the oven for an hour at 450 degrees.  Place your proofed bread in the baking vessel and score.  If there is enough room without touching the bread, put in an ice cube for extra steam.  Bake for 20 minutes.
         7) After 20 minutes remove the baking vessel cover and bake for another 25 minutes, or until your desired crust color is achieved.")

waimee_levain_hearth_bread_1pt_mature_1.6pt_all_purpose_white_0.4pt_whole_wheat_2pt_water <- bakers_math(starter_1pt_mature_1.6pt_all_purpose_white_0.4pt_whole_wheat_2pt_water, waimee_levain_hearth_bread)

save_kable(waimee_levain_hearth_bread_1pt_mature_1.6pt_all_purpose_white_0.4pt_whole_wheat_2pt_water, file = "./formula/waimees_levain_hearth_bread.pdf")

waimee_levain_hearth_bread_1pt_mature_1.6pt_all_purpose_white_0.4pt_whole_wheat_2pt_water

############################################
# Waimee's Overnight Levained Hearth Bread #
############################################
waimee_overnight_levain_hearth_bread <-
    new(
        "bakersFormula",
        formula_name = "Waimee's Overnight Hearth Bread",
        total_flour_weight = 500,
        water_base_percent = 78,
        levain_base_percent = 4,
        flour_base_names = c("Bread flour", "Whole wheat flour", "All purpose flour"),
        flour_base_percent = c(86.8, 10, 3.2),
        other_names = c("Fine sea salt"),
        other_percent = c(2.2),
        notes = 
            "1) Feed your levain with 70 degree water and keep it at room temperatue for about 11 hours until it has doubled in size from the build-up of gas.  If the starter smells like over-ripe fruit you will end up with a more buttery flavour.  If the starter goes longer, it will begin to have a vinergary smell, and the final loaf will be more sour.
         2) Mix the flour and 90-95 degree water in a tub and let it autolyse for about 30 minutes before incorporating the levain and salt.  The target temperature of the dough at the end of the final mix is 77-78 degrees. 
         3) Bulk ferment the dough until it's visibly risen and bubbly, about 12 hours after incorporating the levain.  Build up the dough's gluten structure by performing four stretch-and-folds at 30 minute intervals during the bulk ferment's first two hours.
         4) After the bulk ferment, preshape the dough into a round with a slight amount of tension, and let it bench-rest for 15 minutes.
         5) Create a batard or boule (see https://www.youtube.com/watch?v=O6INjgO91mg&t=130s shaping technique) and place it seam-side up in a 50% flour/50% rice flour seasoned proofing basket.  Loosely cover the proofing basket (a disposable plastic shower cap works well!) and put in a refrigerator to proof for 12-14 hours.
         6) Preheat your baking vessel (see https://challengerbreadware.com/product/challenger-bread-pan/ for my recommendation) in the oven for an hour at 450 degrees.  Place your proofed bread in the baking vessel and score.  If there is enough room without touching the bread, put in an ice cube for extra steam.  Bake for 20 minutes.
         7) After 20 minutes remove the baking vessel cover and bake for another 25 minutes, or until your desired crust color is achieved.")

waimee_overnight_levain_hearth_bread_1pt_mature_1.6pt_all_purpose_white_0.4pt_whole_wheat_2pt_water <- bakers_math(starter_1pt_mature_1.6pt_all_purpose_white_0.4pt_whole_wheat_2pt_water, waimee_overnight_levain_hearth_bread)

save_kable(waimee_overnight_levain_hearth_bread_1pt_mature_1.6pt_all_purpose_white_0.4pt_whole_wheat_2pt_water, file = "./formula/waimee_overnight_levain_hearth_bread.pdf")

waimee_overnight_levain_hearth_bread_1pt_mature_1.6pt_all_purpose_white_0.4pt_whole_wheat_2pt_water

########################################
# Waimee's Pizza Dough (3 Dough Balls) #
########################################
waimees_pizza_dough_3balls <-
    new(
        "bakersFormula",
        formula_name = "Waimee's Pizza Dough (3 Dough Balls)",
        total_flour_weight = 500,
        water_base_percent = 70,
        levain_base_percent = 4,
        flour_base_names = c("All purpose flour", "Whole wheat flour"),
        flour_base_percent = c(99.2, 0.8),
        other_names = "Fine sea salt",
        other_percent = 2.8,
        notes = 
            "1) Feed your levain with 70 degree water and keep it at room temperatue for about 11 hours until it has doubled in size from the build-up of gas.  If the starter smells like over-ripe fruit you will end up with a more buttery flavour.  If the starter goes longer, it will begin to have a vinergary smell, and the final loaf will be more sour.
         2) Mix the flour and 90-95 degree water in a tub and let it autolyse for about 30 minutes before incorporating the levain and salt.  The target temperature of the dough at the end of the final mix is 77-78 degrees. 
         3) Bulk ferment the dough until it's visibly risen and bubbly, about 12 hours after incorporating the levain.  Build up the dough's gluten structure by performing four stretch-and-folds at 30 minute intervals during the bulk ferment's first two hours.
         4) Create three equal size rounds.  Place them each in a glass container to proof in the refridgerator for 12-15 hours (see https://www.ikea.com/us/en/p/ikea-365-food-container-with-lid-round-glass-bamboo-s59567147/ for what I use).
         5) Preheat the oven to it's maximum temperature with a pizza steel (see https://bakingsteel.com/collections/steels/products/baking-steel-original for my recommendation) on an upper rack about 8 inches below the broiler coil.
         6) Switch the oven to broil about 10 minutes before loading the pizza.  Meanwhile, shape the pizza and top it. After 10 minutes on broil, turn the oven off and load the pizza onto the pizza steel.  Close the oven door and return the oven to its maximum bake temperature.
         7) Set a timer for 5 minutes.  Switch the oven back to broil and set the timer for 1-2 minutes, until the pizza is finished.
         8) Set the oven to broil to reheat the steel for a few minutes while you prep the next pizza.
      ")

waimees_pizza_dough_3balls_1pt_mature_1.6pt_all_purpose_white_0.4pt_whole_wheat_2pt_water <- bakers_math(starter_1pt_mature_1.6pt_all_purpose_white_0.4pt_whole_wheat_2pt_water, waimees_pizza_dough_3balls)

save_kable(waimees_pizza_dough_3balls_1pt_mature_1.6pt_all_purpose_white_0.4pt_whole_wheat_2pt_water, file = "./formula/waimees_pizza_dough_3balls.pdf")

waimees_pizza_dough_3balls_1pt_mature_1.6pt_all_purpose_white_0.4pt_whole_wheat_2pt_water
