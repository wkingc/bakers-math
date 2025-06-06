library(testthat)

source("./bakers_math.R")

# Tests for bakersStarter objects
test_that("Valid bakersStarter object with expected values.", {
    t1 <- new(
        "bakersStarter",
        mature_starter_percent = 20,
        water_starter_percent = 80,
        flour_starter_names = c("white", "wheat", "rye"),
        flour_starter_percent = c(80, 15, 5))
    
    expect_true(validObject(t1))
    expect_equal(t1@mature_starter_percent, 20)
    expect_equal(t1@water_starter_percent, 80)
    expect_equal(t1@flour_starter_names, c("white", "wheat", "rye"))
    expect_equal(t1@flour_starter_percent, c(80, 15, 5))
})

test_that("An invalid bakersStarter object where there are fewer flours than percentages.", {
    expect_error(
        new("bakersStarter",
            mature_starter_percent = 20,
            water_starter_percent = 80,
            flour_starter_names = c("white", "wheat"),
            flour_starter_percent = c(80, 15, 5)),
        "The number of flours named in the starter and the number of percentage values stated should be equal.",
        fixed = TRUE)
})

install.packages(c("callr", "crayon", "desc", "pkgload", "processx", "ps", "tibble", "withr"))

test_that("An invalid bakersStarter object where there are fewer percentages than flours.", {
    expect_error(
        new("bakersStarter",
            mature_starter_percent = 20,
            water_starter_percent = 80,
            flour_starter_names = c("white", "wheat", "rye"),
            flour_starter_percent = c(80, 20)),
        "The number of flours named in the starter and the number of percentage values stated should be equal.",
        fixed = TRUE)
})

test_that("An invalid bakersStarter object where the flour percentages do not sum to 100%.", {
    expect_error(
        new("bakersStarter",
            mature_starter_percent = 20,
            water_starter_percent = 80,
            flour_starter_names = c("white", "wheat", "rye"),
            flour_starter_percent = c(80, 20, 20)),
        "Using Baker's Math, the sum of the flours in the starter should be 100%.",
        fixed = TRUE)
})

test_that("An invalid bakersStarter object where the number of flours and percentages are not the same and the percentages do not sum to 100%", {
    expect_error(
        new("bakersStarter",
            mature_starter_percent = 20,
            water_starter_percent = 80,
            flour_starter_names = c("white", "wheat"),
            flour_starter_percent = c(80, 25, 25)),
        "The number of flours named in the starter and the number of percentage values stated should be equal.",
        fixed = TRUE)
})

# Tests for bakersFormula objects
test_that("Valid bakersFormula object with expected values.", {
    t2 <- new(
        "bakersFormula",
        formula_name = "Pain De Campagne",
        total_flour_weight = 1000,
        water_base_percent = 78,
        levain_base_percent = 12,
        flour_base_names = c("white", "wheat", "rye"),
        flour_base_percent = c(80, 15, 5),
        other_names = c("salt", "fat"),
        other_percent = c(2, 7),
        notes = "In a 70 deg kitchen, bulk fermentation should take about 5 hours.  In the fridge, the proof time is between 12-14 hours.")
    
    expect_true(validObject(t2))
    
    expect_equal(t2@formula_name, "Pain De Campagne")
    expect_equal(t2@total_flour_weight, 1000)
    expect_equal(t2@water_base_percent, 78)
    expect_equal(t2@levain_base_percent, 12)
    expect_equal(t2@flour_base_names, c("white", "wheat", "rye"))
    expect_equal(t2@flour_base_percent, c(80, 15, 5))
    expect_equal(t2@other_names, c("salt", "fat"))
    expect_equal(t2@other_percent, c(2, 7))
    expect_equal(t2@notes, "In a 70 deg kitchen, bulk fermentation should take about 5 hours.  In the fridge, the proof time is between 12-14 hours.")
})

test_that("An invalid bakersFormula object where the number of flours is fewer than the number of perentages.", {
    expect_error(
        new("bakersFormula",
            total_flour_weight = 1000,
            water_base_percent = 78,
            levain_base_percent = 12,
            flour_base_names = c("white", "wheat"),
            flour_base_percent = c(80, 15, 5),
            other_names = c("salt", "fat"),
            other_percent = c(2, 7)),
        "The number of flours named in the formula and the number of percentage values stated should be the equal.",
        fixed = TRUE)
})

test_that("An invalid bakersFormula object where the number of percentages is less than the number of flours.", {
    expect_error(
        new("bakersFormula",
            total_flour_weight = 1000,
            water_base_percent = 78,
            levain_base_percent = 12,
            flour_base_names = c("white", "wheat", "rye"),
            flour_base_percent = c(80, 20),
            other_names = c("salt", "fat"),
            other_percent = c(2, 7)),
        "The number of flours named in the formula and the number of percentage values stated should be the equal.",
        fixed = TRUE)
})

test_that("An invalid bakersFormula object where the flour percentages do not sum to 100%.", {
    expect_error(
        new("bakersFormula",
            total_flour_weight = 1000,
            water_base_percent = 78,
            levain_base_percent = 12,
            flour_base_names = c("white", "wheat", "rye"),
            flour_base_percent = c(80, 20, 20),
            other_names = c("salt", "fat"),
            other_percent = c(2, 7)),
        "Using Baker's Math, the sum of the flours in the formula should be 100%.",
        fixed = TRUE)
})

test_that("An invalid bakersFormula object where the number of named other ingedients is less than the number of percentages named for them.", {
    expect_error(
        new("bakersFormula",
            total_flour_weight = 1000,
            water_base_percent = 78,
            levain_base_percent = 12,
            flour_base_names = c("white", "wheat"),
            flour_base_percent = c(80, 20),
            other_names = c("salt", "fat", "bacon"),
            other_percent = c(2, 7)),
        "The number of other ingredients named in the formula and the number of percentage values stated should be equal.",
        fixed = TRUE)
})

test_that("An invalid bakersFormula object where the number of flours and percentages are not the same, and the percentages do not sum to 100%", {
    expect_error(
        new("bakersFormula",
            total_flour_weight = 1000,
            water_base_percent = 78,
            levain_base_percent = 12,
            flour_base_names = c("white", "wheat"),
            flour_base_percent = c(80, 15, 20),
            other_names = c("salt", "fat"),
            other_percent = c(2, 7)),
        "The number of flours named in the formula and the number of percentage values stated should be the equal.",
        fixed = TRUE)
})

# Tests for bakers_math (with bakers yeast)
test_that("The expected results for Saturday White Bread.", {
    saturday_white_bread <-
        new("bakersFormula",
            formula_name = "Saturday White Bread",
            total_flour_weight = 1000,
            water_base_percent = 72,
            flour_base_names = c("White flour"),
            flour_base_percent = c(100),
            other_names = c("Fine sea salt", "Instant dried yeast"),
            other_percent = c(2.1, 0.4),
            notes = "In A 70 degree kitchen, the bulk fermentation should take about 5 hours.  The proof time in the same, is about 1 1/4 hours.")
    
    saturday_white_bread_bakers_yeast_test <- bakers_math(object1 = saturday_white_bread)
    # saturday_white_bread_bakers_yeast <- saturday_white_bread_bakers_yeast_test
    # cat(saturday_white_bread_bakers_yeast)
    # save(saturday_white_bread_bakers_yeast, file = "./saturday_white_bread_bakers_yeast.RData")
    
    load("./test_files/saturday_white_bread_bakers_yeast.RData")
    
    expect_identical(saturday_white_bread_bakers_yeast_test, saturday_white_bread_bakers_yeast)
})

test_that("The expected results for Saturday Wheat Bread.", {
    saturday_wheat_bread <-
        new("bakersFormula",
            formula_name = "Saturday Wheat Bread",
            total_flour_weight = 1000,
            water_base_percent = 80,
            flour_base_names = c("White flour", "Wheat"),
            flour_base_percent = c(75, 25),
            other_names = c("Fine sea salt", "Instant dried yeast"),
            other_percent = c(2.2, 0.3),
            notes = "In A 70 degree kitchen, the bulk fermentation should take about 5 hours.  The proof time in the same, is about 1 1/4 hours.")
    
    saturday_wheat_bread_bakers_yeast_test <- bakers_math(object1 = saturday_wheat_bread)
    # saturday_wheat_bread_bakers_yeast <- saturday_wheat_bread_bakers_yeast_test
    # cat(saturday_wheat_bread_bakers_yeast)
    # save(saturday_wheat_bread_bakers_yeast, file = "./saturday_wheat_bread_bakers_yeast.RData")
    
    load("./test_files/saturday_wheat_bread_bakers_yeast.RData")
    
    expect_identical(saturday_wheat_bread_bakers_yeast_test, saturday_wheat_bread_bakers_yeast)
})

# Tests for bakers_math (with natural levain)
test_that("The expected results for Pain De Campagne.", {
    starter_1mature_4white_1wheat_4water <-
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
            levain_base_percent = 20,
            flour_base_names = c("White flour", "Wheat flour"),
            flour_base_percent = c(90, 10),
            other_names = c("Fine sea salt", "Instant dried yeast"),
            other_percent = c(2.1, 0.2),
            notes = "In a 70 deg kitchen, bulk fermentation should take about 5 hours.  In the fridge, the proof time is between 12-14 hours.")
    
    pain_de_campagne_1mature_4white_1wheat_4water_test <- bakers_math(object1 = starter_1mature_4white_1wheat_4water, object2 = pain_de_campagne)
    # pain_de_campagne_1mature_4white_1wheat_4water <- pain_de_campagne_1mature_4white_1wheat_4water_test
    # cat(pain_de_campagne_1mature_4white_1wheat_4water)
    # save(pain_de_campagne_1mature_4white_1wheat_4water, file = "./pain_de_campagne_1mature_4white_1wheat_4water.RData")
    
    load("./test_files/pain_de_campagne_1mature_4white_1wheat_4water.RData")
    
    expect_identical(pain_de_campagne_1mature_4white_1wheat_4water_test, pain_de_campagne_1mature_4white_1wheat_4water)
})

test_that("The expected results for Overnight Country Blonde.", {
    starter_1mature_4white_1wheat_4water <-
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
            levain_base_percent = 12,
            flour_base_names = c("White flour", "Wheat flour", "Rye flour"),
            flour_base_percent = c(90, 5, 5),
            other_names = c("Fine sea salt"),
            other_percent = c(2.2),
            notes = "In a 70 deg kitchen, bulk fermentation should take 12-15 hours and the proof time should be about 4 hours.")
    
    overnight_country_blonde_1mature_4white_1wheat_4water_test <- bakers_math(object1 = starter_1mature_4white_1wheat_4water, object2 = overnight_country_blonde)
    # overnight_country_blonde_1mature_4white_1wheat_4water <- overnight_country_blonde_1mature_4white_1wheat_4water_test
    # cat(overnight_country_blonde_1mature_4white_1wheat_4water)
    # save(overnight_country_blonde_1mature_4white_1wheat_4water, file = "./overnight_country_blonde_1mature_4white_1wheat_4water.RData")
    
    load("./test_files/overnight_country_blonde_1mature_4white_1wheat_4water.RData")
    
    expect_identical(overnight_country_blonde_1mature_4white_1wheat_4water_test, overnight_country_blonde_1mature_4white_1wheat_4water)
})

test_that("The starter includes more flour types than the formula.", {
    starter_1mature_4white_0.5wheat_0.25rye_0.25semolina <-
        new("bakersStarter",
            mature_starter_percent = 20,
            water_starter_percent = 80,
            flour_starter_names = c("White flour", "Wheat flour", "Rye flour", "Semolina flour"),
            flour_starter_percent = c(80, 10, 5, 5))
    
    pain_de_campagne <-
        new("bakersFormula",
            formula_name = "Pain De Campagne",
            total_flour_weight = 1000,
            water_base_percent = 78,
            levain_base_percent = 20,
            flour_base_names = c("White flour", "Wheat flour"),
            flour_base_percent = c(90, 10),
            other_names = c("Fine sea salt", "Instant dried yeast"),
            other_percent = c(2.1, 0.2),
            notes = "In a 70 deg kitchen, bulk fermentation should take about 5 hours.  In the fridge, the proof time is between 12-14 hours.")
    
    expect_error(
        bakers_math(object1 = starter_1mature_4white_0.5wheat_0.25rye_0.25semolina, object2 = pain_de_campagne), 
        "The starter includes flour not part of the original formula (rye flour, semolina flour) and will increase the total flour weight beyond 1000g.", 
        fixed = TRUE)
})
