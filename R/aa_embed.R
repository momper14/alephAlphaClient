#' @export
aa_embed <- function(token,
                     model,
                     prompt,
                     hosting = NULL,
                     layers = NULL,
                     tokens = FALSE,
                     pooling = NULL,
                     type = NULL,
                     normalize = FALSE,
                     contextual_control_threshold = NULL,
                     control_log_additive = TRUE) {
  resp <- httr::POST(
    paste0(base_url, "/embed"),
    httr::add_headers(
      `Content-Type` = "application/json",
      Accept = "application/json",
      Authorization = paste("Bearer", token)
    ),
    body = list(
      model = model,
      prompt = prompt,
      hosting = hosting,
      layers = layers,
      tokens = tokens,
      pooling = pooling,
      type = type,
      normalize = normalize,
      contextual_control_threshold = contextual_control_threshold,
      control_log_additive = control_log_additive
    ),
    encode = "json"
  )

  httr::stop_for_status(resp)

  return(httr::content(resp))
}
