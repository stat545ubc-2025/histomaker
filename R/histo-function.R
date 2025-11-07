#' @title Histogram Plotting Function

#' @author
#' Kelsey McGuire \email{kmcgu@student.ubc.ca} \cr

#' @description This function takes in a dataset and a variable of interest to plot a
#' histogram based on the user specified bin width. The variable must be numeric, but can
#' have any range.

#' @param dataset Dataframe containing the values of the variable of interest. Can be any
#' length or size, but must contain the variable of interest column name and be in a
#' dataframe format. Named dataset because I wanted it to be clear that we want a complete
#' dataset into the function. [data.frame]
#' @param var_of_interest Specific variable pulled from the data inputted in the first
#' parameter. This parameter should be a list of values tied with the variable of interest.
#' This can be inputted either directly through the use of data$var_of_interest notation, or
#' assigned before the function to it's own stored variable. Named var_of_interest, because
#' this is the variable of interest, but I wanted to shorten it slightly to make it more
#' readible. Didn't want to do var_of_int since int can sometimes be used as integer [list]
#' @param binwidth This is a numeric value that will specify what bin width you'd like the
#' histogram to employ. You can specify any width between 0 and the max value from the
#' variable of interest. Named for what it represents, binwidth, for clarity. [numeric]
#' @param fill_colour This is an aesthetic parameter where you can put any suitable colour
#' with ggplot2 in and change the appearance of the histogram fill category. The default is
#' dodgerblue3, resulting in the default ggplot2 colour scheme. Named since this colour will be the
#' one used within the ggplot2 fill call. [string]
#' @param outline_colour This is an aesthetic parameter where you can put any suitable colour
#' with ggplot2 in and change the appearance of the histogram outline around each bin. The
#' default is NA, resulting in the default ggplot2 colour scheme. Named since this colour
#' will be the one used within the ggplot2 colour call to get an outline around the bins
#' [string]

#' @return This function returns a histogram disaplying the distribution of the variable of
#' interest

histo_function <- function(dataset, var_of_interest, binwidth,
                           fill_colour = "dodgerblue3", outline_colour = "black") {
  # test to make sure that data is a proper dataframe
  if(!is.data.frame(dataset)) { # if the class of data is not a data frame
    stop("Uh oh! dataset needs to be in a data frame format") #throw this error message and stop the function
  }

  # test to make sure that the binwidth is a numeric or integer value
  if(!is.numeric(binwidth)) { # if the class of bin width is not a numeric value
    stop("Woah! Bin width input needs to be numeric") #throw this error message and stop the function
  }

  # get variable of interest information
  var_enquo <- enquo(var_of_interest) # this stores the variable information name before processing - works like curly's but couldn't get those to work
  var_name <- as_name(var_enquo) # this converts the variable of interest to a name variable for labelling

  # test to make sure that the variable is within the supplied data
  if(!(var_name %in% names(dataset))) { # if the variable name is not in the list of dataset columns
    stop(glue::glue("Yoikes! '{var_name}' is not a column in the dataset")) #throw this error message and stop the function
  }

  # test to make sure that the binwidth is within a reasonable range
  if(!(binwidth > 0 & binwidth <= max(dataset[[var_name]]))) { # if the class of bin width is not a numeric value
    stop("Oops! You need to choose a binwidth greater than 0 and less than the max value of the variable") #throw this error message and stop the function
  }

  # plot a histogram displaying the distribution of diameter data based on the age classes
  histogram <- dataset %>%
    filter(!is.na(!!var_enquo)) %>% # remove any NA in the variable of interest before plotting; !! helps to unlock the variable from earlier
    ggplot( aes(x = !!var_enquo)) + # define the x variable for the histogram; !! helps to unlock the variable from earlier
    geom_histogram(binwidth = binwidth, fill = fill_colour, colour = outline_colour,
                   alpha = 0.9, linewidth = 0.1, position = "dodge") + # add design choices for clearer representation of data
    xlab(var_name) + # clean up labels/titles
    ylab("Count") +
    theme_minimal() # add a clearer theme

  return(histogram) # return your pretty histogram!
}
#' @examples
#' EXAMPLES USE RANDOM DATASET (BELOW)
#' ## create a random dataset that has an ID and value column where values are distributed normally
#' random_data <- data.frame(id = 1:132, values = rnorm(n=132, mean = 23, sd = 7))
#'
#' EXAMPLE 1: NO AESTHETICS APPLIED
#' ## apply the histogram function, employing a bin width of 3 displaying the distribution of values
#' histo_function(random_data, values, 3)
#'
#' EXAMPLE 2: AESTHETICS APPLIED
#' ## corrected histogram column name to get a returned plot showing the distribution of height ranges
#' histo_function(random_data, diameter, 5, fill_colour = "hotpink")
#'
#' @export
