#' @export
aa_detokenize <- function(token, model, token_ids) {
  representation <- match.arg(representation)
  resp <- httr::POST(
    paste0(base_url, "/detokenize"),
    httr::add_headers(
      `Content-Type` = "application/json",
      Accept = "application/json",
      Authorization = paste("Bearer", token)
    ),
    body = list(model = model,
                token_ids = token_ids),
    encode = "json"
  )

  httr::stop_for_status(resp)

  return(httr::content(resp))
}
