#' @export
aa_available_models <- function(token) {
  resp <- httr::GET(
    paste0(base_url, "/models_available"),
    httr::add_headers(
      Accept = "application/json",
      Authorization = paste("Bearer", token)
    )
  )

  stop_for_status(resp)

  return(httr::content(resp))
}
