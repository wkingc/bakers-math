
tmp <-
    new("bakersFormula",
        formula_name = "No Knead Bread",
        total_flour_weight = 680,
        water_base_percent = (450/680)*100,
        flour_base_names = c("All Purpose flour"),
        flour_base_percent = c(100),
        other_names = c("Fine sea salt", "Instant dried yeast", "Sugar", "Olive Oil"),
        other_percent = c((15/680)*100, (7/680)*100, (20/680)*100, (20/680)*100),
        notes = "")

tmp2 <- bakers_math(object1 = tmp)

tmp2
