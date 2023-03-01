#' @export
aa_summarize <- function(token,
                         model,
                         documents,
                         hosting = NULL,
                         disable_optimizations = FALSE) {
  representation <- match.arg(representation)
  resp <- httr::POST(
    paste0(base_url, "/summarize"),
    httr::add_headers(
      `Content-Type` = "application/json",
      Accept = "application/json",
      Authorization = paste("Bearer", token)
    ),
    body = list(
      model = model,
      query  = query ,
      completion_expected = completion_expected,
      hosting = hosting,
      contextual_control_threshold = contextual_control_threshold,
      control_log_additive = control_log_additive
    ),
    encode = "json"
  )

  stop_for_status(resp)

  return(httr::content(resp))
}
