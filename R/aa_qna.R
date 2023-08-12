#' @export
aa_qna <- function(token,
                   model,
                   query,
                   documents,
                   maximum_tokens,
                   hosting = NULL,
                   max_chunk_size  = 175,
                   disable_optimizations = FALSE,
                   max_answers  = NULL,
                   min_score = NULL) {
  representation <- match.arg(representation)
  resp <- httr::POST(
    paste0(base_url, "/qa"),
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

  httr::stop_for_status(resp)

  return(httr::content(resp))
}
