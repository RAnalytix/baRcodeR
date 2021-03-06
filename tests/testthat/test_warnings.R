library(baRcodeR)

context("Input warnings")

test_that("input errors are produced", {
  expect_error(uniqID_maker(string="example", level="hi"), "Level is not a string of numbers")
  expect_error(uniqID_maker(string="example", level = c(1:5), digits="a"), "Digits is not a numerical value")
  expect_warning(uniqID_maker(string="example", level=1:300, digits=2), "Digits specified less than max number. Increasing number of digits.")
  expect_error(uniqID_hier_maker(hierarchy = c("a",3,6)), "Hierarchy is not in list format")
  expect_error(uniqID_hier_maker(hierarchy = list(c("a",3,6), c("b",1))), "Hierarchy entries are not of equal length. Each element should have a string, a beginning value and an end value.")
  expect_error(uniqID_hier_maker(hierarchy = list(c("a",3,6), c("b",1,"j"))), "Invalid ending number on level")
  expect_error(uniqID_hier_maker(hierarchy = list(c("a",3,6), c("b","j",3)), "Invalid starting number"))
  expect_warning(uniqID_hier_maker(hierarchy = list(c("a",3,6), c("b",100,103)), digits = 2), "Digits specified less than max level number")
  expect_error(create_PDF(), "Labels do not exist. Please pass in Labels")
  expect_error(create_PDF(Labels = matrix(data=c(1:15), nrow=3, ncol = 5)), "Label input not a vector or a data frame")
  expect_error(custom_create_PDF(Labels = c(1, 2), x_space = 21), "ERROR: x_space value out of bounds.")
  expect_error(custom_create_PDF(Labels = c(1, 2), x_space = 251), "ERROR: x_space value out of bounds.")
  expect_error(custom_create_PDF(Labels = c(1, 2), y_space = 21), "ERROR: y_space value out of bounds.")
  expect_error(custom_create_PDF(Labels = c(1, 2), y_space = 251), "ERROR: y_space value out of bounds.")
  
})
