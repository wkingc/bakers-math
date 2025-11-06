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

###########################
# Waimee's Sandwich Bread #
###########################
waimees_sandwich_bread <-
    new(
        "bakersFormula",
        formula_name = "Waimee's Sandwich Bread (2,340 kcal)",
        total_flour_weight = 400,
        water_base_percent = 78,
        levain_base_percent = 15,
        flour_base_names = c("All purpose flour", "Whole wheat flour"),
        flour_base_percent = c(90, 10),
        other_names = c("Fine sea salt", "Sugar", "Unsalted butter", "Non-fat dry milk", "Potato flour"),
        other_percent = c(2, 9.5, 15.5, 9.5, 11.5),
        notes = "1) Feed your levain with 80 degree water and keep it at room temperature until it has doubled in size from the build-up of gas (approx. 8-10 hours).  If the starter smells like over-ripe fruit you will end up with a more buttery flavour.  If the starter goes longer, it will begin to have a vinergary smell, and the final loaf will be more sour.
        2) Mix the flour with 90-95 degree water in a tub and let it autolyse for about 30 minutes before incorporating the remaining ingredients using the pencer method (see https://www.youtube.com/watch?v=HoY7CPw0E1s for a demonstration).  The target temperature of the dough at the end of the final mix is 77-78 degrees. 
        3) Bulk ferment the dough until it has roughly doubled in size from the build up of gas (approx. 8-9 hours).  Build up the dough's gluten structure by performing four stretch-and-folds at 30 minute intervals during the bulk ferment's first two hours (see https://www.youtube.com/watch?v=CQHuWDEo3SA for a demonstration).
        4) After the bulk ferment, preshape the dough into a round with a slight amount of tension, and let it bench-rest for 15 minutes.
        5) Flour the top of the dough, flip, and create a sausage-roll loaf with tension by pushing it back as you roll it (see https://www.youtube.com/watch?v=jIzKcred_lc for shaping technique).  Put the loaf seam-side down in a greased 2 lb loaf pan and loosely cover it (a disposable plastic shower cap works well!).
        6) Let the dough rise until it has crested about 1 inch above the rim of the pan.  If you don't have time to bake it the same day, this final proof can also be done in the refrigerator.
        7) Preheat your oven 350 degrees and bake the loaf for 35-40 minutes, tenting with alimuminum foil after 10-15 minutes if the top is browning too quickly.
        8) Remove cooked loaf from its tin and place on a cooling rack for a minimum of one hour, but preferably two hours, before slicing.")

waimees_sandwich_bread_1pt_mature_1.6pt_all_purpose_white_0.4pt_whole_wheat_2pt_water <- bakers_math(starter_1pt_mature_1.6pt_all_purpose_white_0.4pt_whole_wheat_2pt_water, waimees_sandwich_bread)

save_kable(waimees_sandwich_bread_1pt_mature_1.6pt_all_purpose_white_0.4pt_whole_wheat_2pt_water, file = "./formula/waimees_sandwich_loaf.pdf")

waimees_sandwich_bread_1pt_mature_1.6pt_all_purpose_white_0.4pt_whole_wheat_2pt_water

#########################
# Waimee's Hearth Bread #
#########################
waimees_hearth_bread <-
    new(
        "bakersFormula",
        formula_name = "Waimee's Hearth Bread (1807 kcal)",
        total_flour_weight = 500,
        water_base_percent = 78,
        levain_base_percent = 12,
        flour_base_names = c("Bread flour", "Whole wheat flour", "All purpose flour"),
        flour_base_percent = c(80.4, 10, 9.6),
        other_names = c("Fine sea salt"),
        other_percent = c(2.2),
        notes = "1) Feed your levain with 80 degree water and keep it at room temperature until it has doubled in size from the build-up of gas (approx. 8-10 hours).  If the starter smells like over-ripe fruit you will end up with a more buttery flavour.  If the starter goes longer, it will begin to have a vinergary smell, and the final loaf will be more sour.
        2) Mix the flour with 90-95 degree water in a tub and let it autolyse for about 30 minutes before incorporating the remaining ingredients using the pencer method (see https://www.youtube.com/watch?v=HoY7CPw0E1s for a demonstration).  The target temperature of the dough at the end of the final mix is 77-78 degrees. 
        3) Bulk ferment the dough until it has roughly doubled in size from the build up of gas (approx. 8-9 hours).  Build up the dough's gluten structure by performing four stretch-and-folds at 30 minute intervals during the bulk ferment's first two hours (see https://www.youtube.com/watch?v=CQHuWDEo3SA for a demonstration).
        4) After the bulk ferment, preshape the dough into a round with a slight amount of tension, and let it bench-rest for 15 minutes.
        5) Create a batard or boule and place it seam-side up in a 50% flour/50% rice flour seasoned proofing basket (see https://www.youtube.com/watch?v=O6INjgO91mg&t=130s for batard shaping technique).  Loosely cover the proofing basket (a disposable plastic shower cap works well!) and put in a refrigerator to proof for 12-14 hours.
        6) Preheat your baking vessel (see https://challengerbreadware.com/product/challenger-bread-pan/ for my recommendation) in the oven for an hour at 450 degrees.  Place your proofed bread in the baking vessel and score.  If there is enough room without touching the bread, add an ice cube for extra steam.  Bake for 20 minutes.
        7) After 20 minutes remove the baking vessel cover and bake for another 25 minutes, or until your desired crust color is achieved.
        8) Place the cooked loaf on a cooling rack for a minimum of one hour, but preferably two hours, before slicing.")

waimees_hearth_bread_1pt_mature_1.6pt_all_purpose_white_0.4pt_whole_wheat_2pt_water <- bakers_math(starter_1pt_mature_1.6pt_all_purpose_white_0.4pt_whole_wheat_2pt_water, waimees_hearth_bread)

save_kable(waimees_hearth_bread_1pt_mature_1.6pt_all_purpose_white_0.4pt_whole_wheat_2pt_water, file = "./formula/waimees_hearth_bread.pdf")

waimees_hearth_bread_1pt_mature_1.6pt_all_purpose_white_0.4pt_whole_wheat_2pt_water

########################################
# Waimee's Pizza Dough (3 Dough Balls) #
########################################
waimees_pizza_dough_3balls <-
    new(
        "bakersFormula",
        formula_name = "Waimee's Pizza Dough (3 Dough Balls) (1816 kcal)",
        total_flour_weight = 500,
        water_base_percent = 70,
        levain_base_percent = 12,
        flour_base_names = c("All purpose flour", "Whole wheat flour"),
        flour_base_percent = c(97.6, 2.4),
        other_names = "Fine sea salt",
        other_percent = 2.8,
        notes = "1) Feed your levain with 80 degree water and keep it at room temperature until it has doubled in size from the build-up of gas (approx. 8-10 hours).  If the starter smells like over-ripe fruit you will end up with a more buttery flavour.  If the starter goes longer, it will begin to have a vinergary smell, and the final loaf will be more sour.
        2) Mix the flour with 90-95 degree water in a tub and let it autolyse for about 30 minutes before incorporating the remaining ingredients using the pencer method (see https://www.youtube.com/watch?v=HoY7CPw0E1s for a demonstration).  The target temperature of the dough at the end of the final mix is 77-78 degrees.
        3) Bulk ferment the dough until it has roughly doubled in size from the build up of gas (approx. 8-9 hours).  Build up the dough's gluten structure by performing four stretch-and-folds at 30 minute intervals during the bulk ferment's first two hours (see https://www.youtube.com/watch?v=CQHuWDEo3SA for a demonstration).
        4) Create three equal size rounds and put each in a glass container to proof in the refridgerator for 12-15 hours (see https://www.ikea.com/us/en/p/ikea-365-food-container-with-lid-round-glass-bamboo-s59567147/ for what I use).
        5) Heat your oven to its maximum temperature (500-550 degree) with a pizza steel (see https://bakingsteel.com/collections/steels/products/baking-steel-original for my recommendation) about 8 inches below the broiler coil for an hour.
        6) Load a pizza and set a timer for 5 minutes.  Switch the oven back to broil and observe until the pizza is finished, about 1-2 minutes.
      ")

waimees_pizza_dough_3balls_1pt_mature_1.6pt_all_purpose_white_0.4pt_whole_wheat_2pt_water <- bakers_math(starter_1pt_mature_1.6pt_all_purpose_white_0.4pt_whole_wheat_2pt_water, waimees_pizza_dough_3balls)

save_kable(waimees_pizza_dough_3balls_1pt_mature_1.6pt_all_purpose_white_0.4pt_whole_wheat_2pt_water, file = "./formula/waimees_pizza_dough_3balls.pdf")

waimees_pizza_dough_3balls_1pt_mature_1.6pt_all_purpose_white_0.4pt_whole_wheat_2pt_water
