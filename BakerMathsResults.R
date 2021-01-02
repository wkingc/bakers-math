# Pain De Campagne
starter_1mature_4water_4white_1wheat <-
  new("bakersStarter",
      mature_starter_percent = 20,
      water_starter_percent = 80,
      flour_starter_names = c("White flour", "Wheat flour"),
      flour_starter_percent = c(80, 20))

pain_de_campagne <-
  new("bakersFormula",
      formula_name = "Pain De Campagne",
      total_flour_weight = 1000,
      water_base_percent = 78,
      leaven_base_percent = 20,
      flour_base_names = c("White flour", "Wheat flour"),
      flour_base_percent = c(90, 10),
      other_names = c("Fine sea salt", "Instant dried yeast"),
      other_percent = c(2.1, 0.2),
      notes = "In a 70 deg kitchen, bulk fermentation should take about 5 hours.  In the fridge, the proof time is between 12-14 hours.")

pain_de_campagne_1m_4w_4wh_1wh <- bakers_math(object1 = starter_1mature_4water_4white_1wheat, object2 = pain_de_campagne)
pain_de_campagne_1m_4w_4wh_1wh
# cat(pain_de_campagne_1m_4w_4wh_1wh)
# save(pain_de_campagne_1m_4w_4wh_1wh, file = "./tests/pain_de_campagne_1m_4w_4wh_1wh.RData")


# Overnight Country Blonde
starter_1mature_4water_4white_1wheat <-
  new("bakersStarter",
      mature_starter_percent = 20,
      water_starter_percent = 80,
      flour_starter_names = c("White flour", "Wheat flour"),
      flour_starter_percent = c(80, 20))

overnight_country_blonde <-
  new("bakersFormula",
      formula_name = "Overnight Country Blonde",
      total_flour_weight = 1000,
      water_base_percent = 78,
      leaven_base_percent = 12,
      flour_base_names = c("White flour", "Wheat flour", "Rye flour"),
      flour_base_percent = c(90, 5, 5),
      other_names = c("Fine sea salt"),
      other_percent = c(2.2),
      notes = "In a 70 deg kitchen, bulk fermentation should take 12-15 hours and the proof time should be about 4 hours.")

overnight_country_blonde_1m_4w_4wh_1wh <- bakers_math(object1 = starter_1mature_4water_4white_1wheat, object2 = overnight_country_blonde)
overnight_country_blonde_1m_4w_4wh_1wh
# cat(overnight_country_blonde_1m_4w_4wh_1wh)
# save(overnight_country_blonde_1m_4w_4wh_1wh, file = "./tests/overnight_country_blonde_1m_4w_4wh_1wh.RData")

