#' @export
aa_semantic_embed <- function(token,
                              model,
                              prompt,
                              representation = c("symmetric", "document", "query"),
                              hosting = NULL,
                              compress_to_size = NULL,
                              normalize = FALSE,
                              contextual_control_threshold = NULL,
                              control_log_additive = TRUE) {
  representation <- match.arg(representation)
  resp <- httr::POST(
    paste0(base_url, "/semantic_embed"),
    httr::add_headers(
      `Content-Type` = "application/json",
      Accept = "application/json",
      Authorization = paste("Bearer", token)
    ),
    body = list(
      model = model,
      prompt = prompt,
      representation = representation,
      hosting = hosting,
      compress_to_size = compress_to_size,
      normalize = normalize,
      contextual_control_threshold = contextual_control_threshold,
      control_log_additive = control_log_additive
    ),
    encode = "json"
  )

  httr::stop_for_status(resp)

  return(httr::content(resp))
}
