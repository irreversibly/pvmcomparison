# Generated by using Rcpp::compileAttributes() -> do not edit by hand
# Generator token: 10BE3573-1514-4C36-9D1C-5A225CD40393

#' Generate a ROC
#' 
#' @param truth A vector with the truth
#' @param output An order vector with the output of the method. The first elements
#'               represent the items more likely to be TRUE. 
#' @param n_levels Number of unique values in the output 
#' 
#' @return \item{TPR}{Vector with the true positive rate}
#'         \item{FPR}{Vector with the false positive rate} 
#'         \item{AUC}{Area under the curve - based on the values in \code{TPR} and \code{FPR}} 
#' @export 
rocRcpp <- function(truth, output, n_levels) {
    .Call('_pvmcomparison_rocRcpp', PACKAGE = 'pvmcomparison', truth, output, n_levels)
}

#' Update the Tables with the Smallest Lambda
#' 
#' A function used by the \code{\link{batchLASSO}} function. 
#' It updates the column \code{smallest_lambda} in the data frame \code{tables}
#' with the regression estimates given in \code{beta}. The \code{beta}s are the 
#' result of regressing the drugs on event with id \code{event_id} using 
#' \code{lambda} as the shrinkage parameter.
#' 
#' @param lowest_lambda Vector with the lowest lambdas 
#' @param n_drugs The number of drugs
#' @param event_id The ID of the event
#' @param lambda The shrinkage parameter that was used 
#' @param beta The regression coefficients
#' 
#' @return The \code{tables} with an updated column \code{smallest_lambda} 
#' @export
updateSmallestLambda <- function(lowest_lambda, n_drugs, event_id, lambda, beta) {
    .Call('_pvmcomparison_updateSmallestLambda', PACKAGE = 'pvmcomparison', lowest_lambda, n_drugs, event_id, lambda, beta)
}

