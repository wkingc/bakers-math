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
        formula_name = "Waimee's Sandwich Bread (~2,340 kcal)",
        total_flour_weight = 400,
        water_base_percent = 80,
        levain_base_percent = 15,
        flour_base_names = c("All purpose flour", "Whole wheat flour"),
        flour_base_percent = c(90, 10),
        other_names = c("Fine sea salt", "Sugar", "Unsalted butter", "Non-fat dry milk", "Potato flour"),
        other_percent = c(2, 9.5, 15.5, 9.5, 11.5),
        notes = "1) In the evening, feed your levain with 80 degree water and keep it at room temperature until it has doubled in size from the build-up of gas, and before it collapses (approx. 8 hours in a 68 degree kitchen). If the starter smells like over-ripe fruit, indicating a buildup of lactic acid, you will end up with a more buttery flavour. If the starter goes longer, it will begin to have a vinegary smell, indicating a buildup of acetic acid, and the final loaf will be more sour.
        2) Melt the butter and mix the dry ingedients, minus the salt, with 90-95 degree water in a tub and let them hydrate for about 30 minutes before incorporating the salt, melted butter, and levain using the pencer method (see https://www.youtube.com/watch?v=HoY7CPw0E1s for a demonstration). The target temperature of the dough at the end of the final mix is 77-78 degrees.
        3) Bulk ferment the dough for about 6 hours in a 72 degree kitchen. It should increase in volume 50 to 75 percent from the build up of gas. It's important not to overferment the dough at this stage.
        4) Build up the dough's gluten structure by briefly kneading the dough at 30 minute intervals during the bulk ferment's first two hours.
        5) After the bulk ferment, preshape the dough into a round with a slight amount of tension, and let it benchrest for 15 minutes. Afterward, flour the top of the dough, flip, and create a sausage-roll loaf with tension by pushing it back as you roll it (see https://www.youtube.com/watch?v=jIzKcred_lc for a demonstation of the shaping technique). Put the loaf seam-side down in a greased 2 lb loaf pan and loosely cover it (a disposable plastic shower cap works well!).
        6) Let the dough rise until it has crested about 1 inch above the rim of the pan (approx. 2 hours in a 72 degree kitchen).
        7) Preheat your oven to 350 degrees and bake the loaf for 35-40 minutes, tenting it with aluminum foil after 25-30 minutes if the top is browning too quickly.
        8) Remove baked loaf from its tin and place on a cooling rack for a minimum of one hour, but preferably two hours, before slicing.")

waimees_sandwich_bread_1pt_mature_1.6pt_all_purpose_white_0.4pt_whole_wheat_2pt_water <- bakers_math(starter_1pt_mature_1.6pt_all_purpose_white_0.4pt_whole_wheat_2pt_water, waimees_sandwich_bread)

save_kable(waimees_sandwich_bread_1pt_mature_1.6pt_all_purpose_white_0.4pt_whole_wheat_2pt_water, file = "./formula/waimees_sandwich_bread.pdf")

# waimees_sandwich_bread_1pt_mature_1.6pt_all_purpose_white_0.4pt_whole_wheat_2pt_water

###################################
# Waimee's Hearth Bread (Daytime) #
###################################
waimees_hearth_bread <-
    new(
        "bakersFormula",
        formula_name = "Waimee's Hearth Bread (Daytime Schedule) (1,880 kcal)",
        total_flour_weight = 500,
        water_base_percent = 78,
        levain_base_percent = 12,
        flour_base_names = c("Bread flour", "Whole wheat flour", "All purpose flour"),
        flour_base_percent = c(80.4, 10, 9.6),
        other_names = c("Fine sea salt", "Olive Oil"),
        other_percent = c(2.2, 1.6),
        notes = "1) In the evening, feed your levain with 80 degree water and keep it at room temperature until it has doubled in size from the build-up of gas, and before it collapses (approx. 8 hours in a 68 degree kitchen). If the starter smells like over-ripe fruit, indicating a buildup of lactic acid, you will end up with a more buttery flavour. If the starter goes longer, it will begin to have a vinegary smell, indicating a buildup of acetic acid, and the final loaf will be more sour.
        2) Mix the flour with 90 degree water in a tub and let the dough autolyse for about 30 minutes before incorporating the remaining ingredients using the pencer method (see https://www.youtube.com/watch?v=HoY7CPw0E1s for a demonstration). The target temperature of the dough at the end of the final mix is 77-78 degrees. 
        3) Bulk ferment the dough for about 6 hours in a 72 degree kitchen. It should increase in volume 50 to 75 percent from the build up of gas. It's important not to overferment the dough at this stage. 
        4) Build up the dough's gluten structure by performing four stretch-and-folds at 30 minute intervals during the bulk ferment's first two hours (see https://www.youtube.com/watch?v=CQHuWDEo3SA for a demonstration).
        5) After the bulk ferment, preshape the dough into a round with a slight amount of tension, and let it benchrest for 15 minutes.
        6) Create a batard or boule and place it seam-side up in a 50% flour/50% rice flour seasoned proofing basket (see https://www.youtube.com/watch?v=O6INjgO91mg&t=130s for batard shaping technique). Loosely cover the proofing basket (a disposable plastic shower cap works well!) and put in a refrigerator to proof for 12-14 hours.
        7) Preheat your baking vessel (see https://challengerbreadware.com/product/challenger-bread-pan/ for my recommendation) in the oven for an hour at 475 degrees. Place your proofed bread in the baking vessel and score. If there is enough room without touching the bread, add one or two ice cubes for extra steam. Bake for 30 minutes.
        8) After 25 minutes remove the baking vessel cover and bake for another 20 minutes, or until your desired crust color is achieved.
        9) Place the cooked loaf on a cooling rack for a minimum of two hours, but preferably three hours, before slicing.")

waimees_daytime_hearth_bread_1pt_mature_1.6pt_all_purpose_white_0.4pt_whole_wheat_2pt_water <- bakers_math(starter_1pt_mature_1.6pt_all_purpose_white_0.4pt_whole_wheat_2pt_water, waimees_hearth_bread)

save_kable(waimees_daytime_hearth_bread_1pt_mature_1.6pt_all_purpose_white_0.4pt_whole_wheat_2pt_water, file = "./formula/waimees_daytime_hearth_bread.pdf")

# waimees_daytime_hearth_bread_1pt_mature_1.6pt_all_purpose_white_0.4pt_whole_wheat_2pt_water

#####################################
# Waimee's Hearth Bread (Overnight) #
#####################################
waimees_overnight_hearth_bread <-
    new(
        "bakersFormula",
        formula_name = "Waimee's Hearth Bread (Overnight Schedule) (1,942 kcal)",
        total_flour_weight = 500,
        water_base_percent = 78,
        levain_base_percent = 7,
        flour_base_names = c("Bread flour", "Whole wheat flour", "All purpose flour"),
        flour_base_percent = c(84.40, 10, 5.60),
        other_names = c("Fine sea salt", "Olive Oil"),
        other_percent = c(2.2, 1.6),
        notes = "1) In the morning, feed your levain with 70 degree water and keep it at room temperature until it has doubled in size from the build-up of gas, and before it collapses (approx. 12 hours in a 72 degree kitchen). If the starter smells like over-ripe fruit, indicating a buildup of lactic acid, you will end up with a more buttery flavour. If the starter goes longer, it will begin to have a vinegary smell, indicating a buildup of acetic acid, and the final loaf will be more sour.
        2) Mix the flour with 70 degree water in a tub and let the dough autolyse for about 30 minutes before incorporating the remaining ingredients using the pencer method (see https://www.youtube.com/watch?v=HoY7CPw0E1s for a demonstration). The target temperature of the dough at the end of the final mix is 75 degrees. 
        3) Bulk ferment the dough for about 8 hours in a 68 degree kitchen. It should increase in volume 50 to 75 percent from the build up of gas. It's important not to overferment the dough at this stage. 
        4) Build up the dough's gluten structure by performing four stretch-and-folds at 30 minute intervals during the bulk ferment's first two hours (see https://www.youtube.com/watch?v=CQHuWDEo3SA for a demonstration).
        5) After the bulk ferment, preshape the dough into a round with a slight amount of tension, and let it benchrest for 15 minutes.
        6) Create a batard or boule and place it seam-side up in a 50% flour/50% rice flour seasoned proofing basket (see https://www.youtube.com/watch?v=O6INjgO91mg&t=130s for batard shaping technique). Loosely cover the proofing basket (a disposable plastic shower cap works well!) and put in a refrigerator to proof for 12-14 hours.
        7) Preheat your baking vessel (see https://challengerbreadware.com/product/challenger-bread-pan/ for my recommendation) in the oven for an hour at 475 degrees. Place your proofed bread in the baking vessel and score. If there is enough room without touching the bread, add one or two ice cubes for extra steam. Bake for 30 minutes.
        8) After 25 minutes remove the baking vessel cover and bake for another 20 minutes, or until your desired crust color is achieved.
        9) Place the cooked loaf on a cooling rack for a minimum of two hours, but preferably three hours, before slicing.")

waimees_overnight_hearth_bread_1pt_mature_1.6pt_all_purpose_white_0.4pt_whole_wheat_2pt_water <- bakers_math(starter_1pt_mature_1.6pt_all_purpose_white_0.4pt_whole_wheat_2pt_water, waimees_overnight_hearth_bread)

save_kable(waimees_overnight_hearth_bread_1pt_mature_1.6pt_all_purpose_white_0.4pt_whole_wheat_2pt_water, file = "./formula/waimees_overnight_hearth_bread.pdf")

# waimees_overnight_hearth_bread_1pt_mature_1.6pt_all_purpose_white_0.4pt_whole_wheat_2pt_water

########################################
# Waimee's Pizza Dough (3 Dough Balls) #
########################################
waimees_pizza_dough_3balls <-
    new(
        "bakersFormula",
        formula_name = "Waimee's Pizza Dough (3 Dough Balls) (1,816 kcal)",
        total_flour_weight = 500,
        water_base_percent = 70,
        levain_base_percent = 12,
        flour_base_names = c("Caputo '00'", "All purpose flour", "Whole wheat flour"),
        flour_base_percent = c(88, 9.6, 2.4),
        other_names = "Fine sea salt",
        other_percent = 2.8,
        notes = "1) Feed your levain with 80 degree water and keep it at room temperature until it has increased in volume 75 to 100 percent from the build-up of gas (approx. 8 hours in a 72 degree kitchen). If the starter smells like over-ripe fruit, indicating a buildup of lactic acid, you will end up with a more buttery flavour. If the starter goes longer, it will begin to have a vinegary smell, indicating a buildup of acetic acid, and the final loaf will be more sour.
        2) Mix the flour with 90 degree water in a tub and let the dough autolyse for about 30 minutes before incorporating the remaining ingredients using the pencer method (see https://www.youtube.com/watch?v=HoY7CPw0E1s for a demonstration). The target temperature of the dough at the end of the final mix is 77-78 degrees.
        3) Bulk ferment the dough for about 6 hours in a 72 degree kitchen. It should increase in volume 50 to 75 percent from the build up of gas. It's important not to overferment the dough at this stage.
        4) Build up the dough's gluten structure by performing four stretch-and-folds at 30 minute intervals during the bulk ferment's first two hours (see https://www.youtube.com/watch?v=CQHuWDEo3SA for a demonstration).
        5) Create three equal size rounds, coat in olive oil, and put each in a container to proof in the refridgerator for 12-15 hours (see https://www.ikea.com/us/en/p/ikea-365-food-container-with-lid-round-glass-bamboo-s59567147/ for what I use).
        6) About two hours before baking, remove the dough from the refrigerator to allow it to come to room temperature.
        7) Heat your oven to 500 degrees with a pizza steel (see https://bakingsteel.com/collections/steels/products/baking-steel-original for my recommendation) about 8 inches below the broiler coil for an hour. A few minutes before loading your first pizza turn the broiler on high.
        8) Dust your pizza peel with Semolina flour to prevent sticking.
        9) Prepare your pizza with your desired toppings while the oven is heating (see https://youtu.be/TGwU87ndEzo?si=we7oLAvlVJYpIPA6 for stretching technique).
        10) Set the oven back to 500 degrees and load a pizza and set a timer for 4 minutes. Switch the oven back to broil and observe until the pizza is finished, about 1-2 minutes.
      ")

waimees_pizza_dough_3balls_1pt_mature_1.6pt_all_purpose_white_0.4pt_whole_wheat_2pt_water <- bakers_math(starter_1pt_mature_1.6pt_all_purpose_white_0.4pt_whole_wheat_2pt_water, waimees_pizza_dough_3balls)

save_kable(waimees_pizza_dough_3balls_1pt_mature_1.6pt_all_purpose_white_0.4pt_whole_wheat_2pt_water, file = "./formula/waimees_pizza_dough_3balls.pdf")

# waimees_pizza_dough_3balls_1pt_mature_1.6pt_all_purpose_white_0.4pt_whole_wheat_2pt_water
