#' @export
aa_available_models <- function(token) {
  resp <- httr::GET(
    paste0(base_url, "/models_available"),
    httr::add_headers(
      Accept = "application/json",
      Authorization = sprintf("Bearer %s", token)
    )
  )

  return(httr::content(resp))
}
