source("bakerMaths.R")

# Tests for bakersStarter objects
test_that("Valid bakersStarter object with expected values", {
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


test_that("An invalid bakersStarter object where the number of flours and number of percentages are not the same", {
  expect_error(new("bakersStarter",
                   mature_starter_percent = 20,
                   water_starter_percent = 80,
                   flour_starter_names = c("white", "wheat"),
                   flour_starter_percent = c(80, 15, 5)),
               "The number of flours named in the starter and the number of percentage values stated are not the same.",
               fixed = TRUE)
})

test_that("An invalid bakersStarter object where the number of flours in the starter are not the same as the number of percentages.", {
  expect_error(new("bakersStarter",
                   mature_starter_percent = 20,
                   water_starter_percent = 80,
                   flour_starter_names = c("white", "wheat"),
                   flour_starter_percent = c(80, 15, 5)),
               "The number of flours named in the starter and the number of percentage values stated are not the same.",
               fixed = TRUE)
})

test_that("An invalid bakersStarter object where the number of percentages in the starter are not the same as the number of flours.", {
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




