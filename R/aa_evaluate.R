#' @export
aa_evaluate <- function(token,
                        model,
                        prompt,
                        completion_expected,
                        hosting = NULL,
                        contextual_control_threshold = NULL,
                        control_log_additive = TRUE) {
  representation <- match.arg(representation)
  resp <- httr::POST(
    paste0(base_url, "/evaluate"),
    httr::add_headers(
      `Content-Type` = "application/json",
      Accept = "application/json",
      Authorization = paste("Bearer", token)
    ),
    body = list(
      model = model,
      prompt = prompt,
      completion_expected = completion_expected,
      hosting = hosting,
      contextual_control_threshold = contextual_control_threshold,
      control_log_additive = control_log_additive
    ),
    encode = "json"
  )

  httr::stop_for_status(resp)

  return(httr::content(resp))
}
