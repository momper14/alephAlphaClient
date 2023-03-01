#' @export
aa_tokenize <- function(token, model, prompt, tokens, token_ids) {
  representation <- match.arg(representation)
  resp <- httr::POST(
    paste0(base_url, "/tokenize"),
    httr::add_headers(
      `Content-Type` = "application/json",
      Accept = "application/json",
      Authorization = paste("Bearer", token)
    ),
    body = list(
      model = model,
      prompt = prompt,
      tokens = tokens,
      token_ids = token_ids
    ),
    encode = "json"
  )

  stop_for_status(resp)

  return(httr::content(resp))
}
