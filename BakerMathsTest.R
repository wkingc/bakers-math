source("bakerMaths.R")

# Tests for bakersStarter objects
test_that("Valid bakersStarter object with expected values.", {
  t1 <- new("bakersStarter",
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
  expect_error(new("bakersStarter",
                   mature_starter_percent = 20,
                   water_starter_percent = 80,
                   flour_starter_names = c("white", "wheat"),
                   flour_starter_percent = c(80, 15, 5)),
               "The number of flours named in the starter and the number of percentage values stated are not the same.",
               fixed = TRUE)
})

test_that("An invalid bakersStarter object where there are fewer percentages than flours.", {
  expect_error(new("bakersStarter",
                   mature_starter_percent = 20,
                   water_starter_percent = 80,
                   flour_starter_names = c("white", "wheat", "rye"),
                   flour_starter_percent = c(80, 20)),
               "The number of flours named in the starter and the number of percentage values stated are not the same.",
               fixed = TRUE)
})


test_that("An invalid bakersStarter object where the number of flours and percentages are not the same and the percentages do not sum to 100%", {
  expect_error(new("bakersStarter",
                   mature_starter_percent = 20,
                   water_starter_percent = 80,
                   flour_starter_names = c("white", "wheat"),
                   flour_starter_percent = c(80, 25, 25)),
               "(1) The number of flours named in the starter and the number of percentage values stated are not the same; (2) Using Baker's Math, the sum of the flours in the starter should be 100%.",
               fixed = TRUE)
})

# Tests for bakersFormula objects
test_that("Valid bakersFormula object with expected values.", {
  t2 <- new("bakersFormula",
            total_flour_weight = 1000,
            water_base_percent = 78,
            leaven_base_percent = 12,
            flour_base_names = c("white", "wheat", "rye"),
            flour_base_percent = c(80, 15, 5),
            other_percent = list(salt = 2, fat = 7))
  
  expect_true(validObject(t2))
  expect_equal(t2@total_flour_weight, 1000)
  expect_equal(t2@water_base_percent, 78)
  expect_equal(t2@leaven_base_percent, 12)
  expect_equal(t2@flour_base_names, c("white", "wheat", "rye"))
  expect_equal(t2@flour_base_percent, c(80, 15, 5))
  expect_equal(t2@other_percent, list(salt = 2, fat = 7))
})


test_that("An invalid bakersFormula object where the number of flours is fewer than the number of perentages.", {
  expect_error(new("bakersFormula",
                   total_flour_weight = 1000,
                   water_base_percent = 78,
                   leaven_base_percent = 12,
                   flour_base_names = c("white", "wheat"),
                   flour_base_percent = c(80, 15, 5)),
               "The number of flours named in the formula and the number of percentage values stated are not the same.",
               fixed = TRUE)
})

test_that("An invalid bakersFormula object where the number of fpercentages is less than the number of flours.", {
  expect_error(new("bakersFormula",
                   total_flour_weight = 1000,
                   water_base_percent = 78,
                   leaven_base_percent = 12,
                   flour_base_names = c("white", "wheat", "rye"),
                   flour_base_percent = c(80, 20)),
               "The number of flours named in the formula and the number of percentage values stated are not the same.",
               fixed = TRUE)
})


test_that("An invalid bakersFormula object where the number of flours and percentages are not the same, and the percentages do not sum to 100%", {
  expect_error(new("bakersFormula",
                   total_flour_weight = 1000,
                   water_base_percent = 78,
                   leaven_base_percent = 12,
                   flour_base_names = c("white", "wheat"),
                   flour_base_percent = c(80, 15, 20)),
               "(1) The number of flours named in the formula and the number of percentage values stated are not the same; (2) Using Baker's Math, the sum of the flours in the formula should be 100%.",
               fixed = TRUE)
})
