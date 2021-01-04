source("./BakerMaths.R")

# starter
  # 1:1.6:0.4:2 (1:2:2)
    # 65g old starter; 104g white; 26g wheat; 130g water = 325g starter 
    # 50% old starter; 80% white; 20% wheat; 0% other; 100% water
starter_1mature_1.6white_0.4wheat_2water <-
  new("bakersStarter",
      mature_starter_percent = 50,
      water_starter_percent = 100,
      flour_starter_names = c("White flour", "Wheat flour"),
      flour_starter_percent = c(80, 20))

pain_de_campagne_0.5kg <-
  new("bakersFormula",
      formula_name = "Pain De Campagne",
      total_flour_weight = 500,
      water_base_percent = 78,
      leaven_base_percent = 20,
      flour_base_names = c("White flour", "Wheat flour"),
      flour_base_percent = c(90, 10),
      other_names = c("Fine sea salt", "Instant dried yeast"),
      other_percent = c(2.1, 0.2),
      notes = "In A 70 degree kitchen, the bulk fermentation should take about 5 hours.  The proof time in the same is about 12-14 hours.")

pain_de_campagne_0.5kg_1mature_1.6white_0.4wheat_2water <- bakers_math(starter_1mature_1.6white_0.4wheat_2water, pain_de_campagne_0.5kg)
save_kable(pain_de_campagne_0.5kg_1mature_1.6white_0.4wheat_2water, file = "./formula/pain_de_campagne_0.5kg_1mature_1.6white_0.4wheat_2water.pdf")
pain_de_campagne_0.5kg_1mature_1.6white_0.4wheat_2water

overnight_white_0.5kg <-
  new("bakersFormula",
      formula_name = "Overnight White",
      total_flour_weight = 500,
      water_base_percent = 78,
      leaven_base_percent = 12,
      flour_base_names = c("White flour", "Wheat flour"),
      flour_base_percent = c(90, 10),
      other_names = c("Fine sea salt"),
      other_percent = 2.2,
      notes = "In a 70 degree kitchen, bulk fermentation should take 12-15 hours and the proof time in the same about 4 hours.")

overnight_white_0.5kg_1mature_1.6white_0.4wheat_2water <- bakers_math(starter_1mature_1.6white_0.4wheat_2water, overnight_white_0.5kg)
save_kable(overnight_white_0.5kg_1mature_1.6white_0.4wheat_2water, file = "./formula/overnight_white_0.5kg_1mature_1.6white_0.4wheat_2water.pdf")
overnight_white_0.5kg_1mature_1.6white_0.4wheat_2water

saturday_white_bread_0.5kg <-
  new("bakersFormula",
      formula_name = "Saturday White Bread",
      total_flour_weight = 500,
      water_base_percent = 72,
      flour_base_names = c("White flour"),
      flour_base_percent = c(100),
      other_names = c("Fine sea salt", "Instant dried yeast"),
      other_percent = c(2.1, 0.4),
      notes = "In A 70 degree kitchen, the bulk fermentation should take about 5 hours.  The proof time in the same, is about 1 1/4 hours.")

saturday_white_bread_0.5kg_bakers_yeast <- bakers_math(saturday_white_bread_0.5kg)
save_kable(saturday_white_bread_0.5kg_bakers_yeast, file = "./formula/saturday_white_bread_0.5kg_bakers_yeast.pdf")
saturday_white_bread_0.5kg_bakers_yeast