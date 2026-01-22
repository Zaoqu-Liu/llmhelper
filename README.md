# llmhelper <img src="man/figures/logo.png" align="right" height="139" />

<!-- badges: start -->
[![R-CMD-check](https://github.com/Zaoqu-Liu/llmhelper/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/Zaoqu-Liu/llmhelper/actions/workflows/R-CMD-check.yaml)
[![CRAN status](https://www.r-pkg.org/badges/version/llmhelper)](https://CRAN.R-project.org/package=llmhelper)
[![Lifecycle: experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
<!-- badges: end -->

## Overview

**llmhelper** provides a unified and user-friendly interface for interacting with Large Language Models (LLMs) in R. Built on top of the `tidyprompt` package, it offers:
- **Multiple Provider Support**: OpenAI, Ollama, DeepSeek, and any OpenAI-compatible APIs
- **Automatic Connection Testing**: Validates your LLM setup before use
- **Smart max_tokens Handling**: Auto-adjusts when model limits are exceeded
- **Structured JSON Responses**: With schema validation
- **Interactive JSON Schema Generator**: Create schemas through conversation
- **Prompt Templating**: Build dynamic prompts with variable injection
- **Comprehensive Diagnostics**: Debug connection issues easily

## Installation

### From CRAN (once available)

```r
install.packages("llmhelper")
```

### From GitHub

```r
# install.packages("pak")
pak::pak("Zaoqu-Liu/llmhelper")
```

### From R-universe

```r
install.packages("llmhelper", repos = "https://Zaoqu-Liu.r-universe.dev")
```

## Quick Start

### Setting up an LLM Provider

```r
library(llmhelper)

# OpenAI
openai_client <- llm_provider(
  base_url = "https://api.openai.com/v1/chat/completions",
  api_key = Sys.getenv("OPENAI_API_KEY"),
  model = "gpt-4o-mini"
)

# Ollama (local)
ollama_client <- llm_ollama(
  model = "qwen2.5:1.5b-instruct",
  auto_download = TRUE
)

# DeepSeek
deepseek_client <- llm_provider(
  base_url = "https://api.deepseek.com/v1/chat/completions",
  api_key = Sys.getenv("DEEPSEEK_API_KEY"),
  model = "deepseek-chat"
)
```

### Getting Responses

```r
# Simple text response
response <- get_llm_response(
  prompt = "What is machine learning?",
  llm_client = openai_client,
  max_words = 100
)

# Structured JSON response
schema <- list(
  name = "analysis_result",
  schema = list(
    type = "object",
    properties = list(
      summary = list(type = "string", description = "Brief summary"),
      key_points = list(
        type = "array",
        items = list(type = "string"),
        description = "Main key points"
      ),
      confidence = list(type = "number", description = "Confidence score 0-1")
    ),
    required = c("summary", "key_points", "confidence")
  )
)

json_response <- get_llm_response(
  prompt = "Analyze the benefits of R programming",
  llm_client = openai_client,
  json_schema = schema
)
```

### Using Prompt Templates

```r
template <- "
Analyze the following dataset: {dataset_name}
Focus on: {focus_area}
Output format: {output_format}
"

prompt <- build_prompt(
  template = template,
  dataset_name = "iris",
  focus_area = "species classification",
  output_format = "bullet points"
)
```

### Interactive JSON Schema Generation

```r
result <- generate_json_schema(
  description = "A user profile with name, email, and preferences",
  llm_client = openai_client
)

# Use the generated schema
final_schema <- extract_schema_only(result)
```

### Managing Ollama Models

```r
# List available models
ollama_list_models()

# Download a new model
ollama_download_model("llama3.2:1b")

# Delete a model
ollama_delete_model("old-model:latest")
```

### Diagnostics

```r
# Debug connection issues
diagnose_llm_connection(
  base_url = "https://api.openai.com/v1/chat/completions",
  api_key = Sys.getenv("OPENAI_API_KEY"),
  model = "gpt-4o-mini"
)
```

## Main Functions

| Function | Description |
|----------|-------------|
| `llm_provider()` | Create an OpenAI-compatible LLM provider |
| `llm_ollama()` | Create an Ollama LLM provider |
| `get_llm_response()` | Get text or JSON responses from LLM |
| `build_prompt()` | Build prompts from templates |
| `set_prompt()` | Create prompt objects with system/user messages |
| `generate_json_schema()` | Interactively generate JSON schemas |
| `diagnose_llm_connection()` | Debug connection issues |
| `ollama_list_models()` | List available Ollama models |
| `ollama_download_model()` | Download Ollama models |
| `ollama_delete_model()` | Delete Ollama models |

## Environment Variables

Set your API keys as environment variables:

```r
# In your .Renviron file or before using the package:
Sys.setenv(OPENAI_API_KEY = "your-openai-key")
Sys.setenv(DEEPSEEK_API_KEY = "your-deepseek-key")
Sys.setenv(LLM_API_KEY = "your-default-key")
```

## Requirements

- R >= 4.1.0
- A running Ollama server (for local LLM usage)
- Valid API keys (for cloud LLM providers)

## Related Packages
- [tidyprompt](https://github.com/tjarkvandemerwe/tidyprompt): Core prompt engineering package
- [httr2](https://httr2.r-lib.org/): HTTP client
- [jsonlite](https://jeroen.r-universe.dev/jsonlite): JSON handling

## Citation

```r
citation("llmhelper")
```

## License

GPL (>= 3)

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## Author

**Zaoqu Liu** (liuzaoqu@163.com)
- ORCID: [0000-0002-0452-742X](https://orcid.org/0000-0002-0452-742X)
