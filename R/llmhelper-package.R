#' @keywords internal
"_PACKAGE"

#' llmhelper: Unified Interface for Large Language Model Interactions in R
#'
#' The llmhelper package provides a unified and user-friendly interface for
#' interacting with Large Language Models (LLMs) through various providers
#' including OpenAI, Ollama, and other OpenAI-compatible APIs.
#'
#' @section Main Functions:
#' \describe{
#'   \item{\code{\link{llm_provider}}}{Create an OpenAI-compatible LLM provider}
#'   \item{\code{\link{llm_ollama}}}{Create an Ollama LLM provider}
#'   \item{\code{\link{get_llm_response}}}{Get text or JSON responses from LLM}
#'   \item{\code{\link{build_prompt}}}{Build prompts from templates}
#'   \item{\code{\link{set_prompt}}}{Create prompt objects}
#'   \item{\code{\link{generate_json_schema}}}{Interactively generate JSON schemas}
#'   \item{\code{\link{diagnose_llm_connection}}}{Debug connection issues}
#' }
#'
#' @section Ollama Functions:
#' \describe{
#'   \item{\code{\link{ollama_list_models}}}{List available Ollama models}
#'   \item{\code{\link{ollama_download_model}}}{Download Ollama models}
#'   \item{\code{\link{ollama_delete_model}}}{Delete Ollama models}
#' }
#'
#' @section Environment Variables:
#' The package uses the following environment variables:
#' \describe{
#'   \item{LLM_API_KEY}{Default API key for LLM providers}
#'   \item{OPENAI_API_KEY}{OpenAI API key}
#'   \item{DEEPSEEK_API_KEY}{DeepSeek API key}
#' }
#'
#' @author Zaoqu Liu \email{liuzaoqu@@163.com}
#' @seealso Useful links:
#' \itemize{
#'   \item \url{https://github.com/Zaoqu-Liu/llmhelper}
#'   \item Report bugs at \url{https://github.com/Zaoqu-Liu/llmhelper/issues}
#' }
#'
#' @docType package
#' @name llmhelper-package
#' @aliases llmhelper
#'
#' @importFrom cli cli_alert_info cli_alert_success cli_alert_warning
#' @importFrom cli cli_alert_danger cli_h1 cli_h2 cli_h3 cli_rule
#' @importFrom cli cli_text cli_progress_bar cli_progress_update cli_progress_done
#' @importFrom glue glue_data
#' @importFrom jsonlite toJSON fromJSON write_json
#' @importFrom httr GET POST content status_code add_headers timeout content_type_json
#' @importFrom httr2 request req_url_path req_perform resp_body_json req_body_json
#' @importFrom httr2 req_method req_error req_perform_stream
#' @importFrom purrr map_dfr
#' @importFrom tibble tibble
#' @importFrom stringr str_replace_all str_replace str_detect
#' @importFrom dplyr %>%
NULL
