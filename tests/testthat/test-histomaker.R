# Load Vancouver Trees
vancouver_trees <- datateachr::vancouver_trees

## Test 1: Make sure that all errors appear when required

test_that("histo_function will throw errors when needed", {
  expect_error(histo_function(diameter, vancouver_trees, 5)) # testing that the input is a dastaset
  expect_error(histo_function(vancouver_trees, diameter, "five")) # testing that the bin width is numeric
  expect_error(histo_function(vancouver_trees, diam, 5)) # testing that the variable name is within the dataset
  expect_error(histo_function(vancouver_trees, diameter, -5)) # testing that the bin width is a reasonable number
})

## Test 2: Check that returned plot has a histogram component

test_that("Check that the correct Histogram properties exist", {
  histo <- histo_function(vancouver_trees, diameter, binwidth = 5,
                          fill_colour = "olivedrab3") # create test histogram

  # Check it's a ggplot
  expect_s3_class(histo, "ggplot")

  # Check it has a histogram layer
  expect_true(any(sapply(histo$layers, function(x) inherits(x$geom, "GeomBar"))))
})

## Test 3: Check that the labelling and colours of the plot are matching what is specified

test_that("histo_function applies specified fill and outline colours", {
  histo <- histo_function(vancouver_trees, diameter, binwidth = 5,
                          fill_colour = "olivedrab3", outline_colour = "black") # create test histogram

  # check labelling
  expect_equal(histo$labels$x, "diameter") # x-label check; only checking this one since it's the one that changes

  # check the colour aesthetics
  histo_layer <- histo$layers[[1]]  # histograms are in the first layer
  expect_equal(histo_layer$aes_params$fill, "olivedrab3") # check that the fill is what has been inputted
  expect_equal(histo_layer$aes_params$colour, "black") # check that the colour (outline) is what has been inputted
})
