#' @export
aa_completion <- function(token,
                          model,
                          prompt,
                          maximum_tokens,
                          hosting = NULL,
                          minimum_tokens = 0,
                          echo = FALSE,
                          temperature = 0.0,
                          top_k = 0,
                          top_p = 0,
                          presence_penalty = 0.0,
                          frequency_penalty = 0.0,
                          sequence_penalty = 0.0,
                          sequence_penalty_min_length = 2,
                          repetition_penalties_include_prompt = FALSE,
                          repetition_penalties_include_completion = TRUE,
                          use_multiplicative_presence_penalty = FALSE,
                          use_multiplicative_frequency_penalty = FALSE,
                          use_multiplicative_sequence_penalty = FALSE,
                          penalty_bias = NULL,
                          penalty_exceptions = NULL,
                          penalty_exceptions_include_stop_sequences = TRUE,
                          best_of = NULL,
                          n = 1,
                          logit_bias = NULL,
                          log_probs = NULL,
                          stop_sequences = NULL,
                          tokens = FALSE,
                          raw_completion = FALSE,
                          disable_optimizations = FALSE,
                          completion_bias_inclusion = NULL,
                          completion_bias_inclusion_first_token_only = FALSE,
                          completion_bias_exclusion = NULL,
                          completion_bias_exclusion_first_token_only = FALSE,
                          contextual_control_threshold = NULL,
                          control_log_additive = TRUE) {
  resp <- httr::POST(
    paste0(base_url, "/complete"),
    httr::add_headers(
      `Content-Type` = "application/json",
      Accept = "application/json",
      Authorization = paste("Bearer", token)
    ),
    body = list(
      model = model,
      prompt = prompt,
      maximum_tokens = maximum_tokens,
      hosting = hosting,
      minimum_tokens = minimum_tokens,
      echo = echo,
      temperature = temperature,
      top_k = top_k,
      top_p = top_p,
      presence_penalty = presence_penalty,
      frequency_penalty = frequency_penalty,
      sequence_penalty = sequence_penalty,
      sequence_penalty_min_length = sequence_penalty_min_length,
      repetition_penalties_include_prompt = repetition_penalties_include_prompt,
      repetition_penalties_include_completion = repetition_penalties_include_completion,
      use_multiplicative_presence_penalty = use_multiplicative_presence_penalty,
      use_multiplicative_frequency_penalty = use_multiplicative_frequency_penalty,
      use_multiplicative_sequence_penalty = use_multiplicative_sequence_penalty,
      penalty_bias = penalty_bias,
      penalty_exceptions = penalty_exceptions,
      penalty_exceptions_include_stop_sequences = penalty_exceptions_include_stop_sequences,
      best_of = best_of,
      n = n,
      logit_bias = logit_bias,
      log_probs = log_probs,
      stop_sequences = stop_sequences,
      tokens = tokens,
      raw_completion = raw_completion,
      disable_optimizations = disable_optimizations,
      completion_bias_inclusion = completion_bias_inclusion,
      completion_bias_inclusion_first_token_only = completion_bias_inclusion_first_token_only,
      completion_bias_exclusion = completion_bias_exclusion,
      completion_bias_exclusion_first_token_only = completion_bias_exclusion_first_token_only,
      contextual_control_threshold = contextual_control_threshold,
      control_log_additive = control_log_additive
    ),
    encode = "json"
  )

  httr::stop_for_status(resp)

  return(httr::content(resp))
}
