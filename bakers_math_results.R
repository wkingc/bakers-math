source("./bakers_math.R")

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

waimees_sourdough_sandwich_loaf_0.5kg <-
  new("bakersFormula",
      formula_name = "Waimee's Sourdough Sandwich Loaf (0.5 kg)",
      total_flour_weight = 500,
      water_base_percent = 78,
      leaven_base_percent = 20,
      flour_base_names = c("All purpose white flour", "Whole wheat flour"),
      flour_base_percent = c(90, 10),
      other_names = c("Fine sea salt", "Instant dried yeast"),
      other_percent = c(2.1, 0.2),
      notes = 
        "1) Feed your starter in the morning and keep it in an 85-90 degree environment to use  7-8 hours later, or when it has peaked (e.g., doubled in size and domed at the top from the build-up of gas).
        2) Mix the flour and water in a tub and let it autolyse for about 30 minutes before adding the leaven, salt, and baker's yeast.
        3) Bulk ferment the dough until it has doubled or tripled in size (about 5 hours in a 70-degree kitchen).  Build up the dough's gluten structure by performing four stretch-and-folds in the first two hours of the bulk ferment.
        4) After the bulk ferment, create a sausage-roll loaf with tension, put it in a greased 2 lb loaf pan, and prove overnight in the fridge.
        5) Remove the dough from the fridge in the morning and bake when it crests the top of the loaf pan (about three hours in a 70-degree kitchen).
        Comment:  The inclusion of a little bit of baker's yeast helps create a more fluffy sandwich loaf and doesn't compromise the sourdough flavor.
      ")

waimees_sourdough_sandwich_loaf_0.5kg_1pt_mature_1.6pt_all_purpose_white_0.4pt_whole_wheat_2pt_water <- bakers_math(starter_1pt_mature_1.6pt_all_purpose_white_0.4pt_whole_wheat_2pt_water, waimees_sourdough_sandwich_loaf_0.5kg)
save_kable(waimees_sourdough_sandwich_loaf_0.5kg_1pt_mature_1.6pt_all_purpose_white_0.4pt_whole_wheat_2pt_water, file = "./formula/waimees_sourdough_sandwich_loaf_1pt_mature_1.6pt_all_purpose_white_0.4pt_whole_wheat_2pt_water.pdf")
waimees_sourdough_sandwich_loaf_0.5kg_1pt_mature_1.6pt_all_purpose_white_0.4pt_whole_wheat_2pt_water