#' @export
aa_current_api_version <- function() {
  httr::add_headers(Accept = "text/plain")
  resp <- httr::GET(paste0(base_url, "/version"))

  return(httr::content(resp))
}
