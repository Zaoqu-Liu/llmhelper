#' Pipe operator
#'
#' See \code{magrittr::\link[magrittr:pipe]{\%>\%}} for details.
#'
#' @name %>%
#' @rdname pipe
#' @keywords internal
#' @export
#' @importFrom dplyr %>%
#' @usage lhs \%>\% rhs
#' @param lhs A value or the magrittr placeholder.
#' @param rhs A function call using the magrittr semantics.
#' @return The result of calling \code{rhs(lhs)}.
NULL

#' Null coalescing operator
#'
#' Returns the left-hand side if it is not NULL, otherwise returns the
#' right-hand side. This is useful for providing default values.
#'
#' @name grapes-or-or-grapes
#' @param x A value to check for NULL.
#' @param y A default value to return if x is NULL.
#' @return x if not NULL, otherwise y.
#' @export
#' @examples
#' NULL %||% "default"
#' "value" %||% "default"
`%||%` <- function(x, y) if (is.null(x)) y else x
