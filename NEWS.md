# llmhelper 1.0.0

## Initial CRAN Release

### New Features

* `llm_provider()`: Create OpenAI-compatible LLM providers with automatic connection testing and max_tokens auto-adjustment
* `llm_ollama()`: Create Ollama LLM providers with auto-download capability for missing models
* `get_llm_response()`: Unified interface for getting text or JSON responses from LLMs
* `build_prompt()`: Template-based prompt construction using glue syntax
* `set_prompt()`: Create structured prompts with system and user messages
* `generate_json_schema()`: Interactive JSON schema generation through LLM conversation
* `extract_schema_only()`: Extract schema portion from generated results
* `diagnose_llm_connection()`: Comprehensive diagnostics for LLM connection issues
* `ollama_list_models()`: List available Ollama models
* `ollama_download_model()`: Download models from Ollama registry
* `ollama_delete_model()`: Remove models from Ollama

### Provider Support

* OpenAI API
* Ollama (local LLM server)
* DeepSeek API
* Any OpenAI-compatible API endpoints

### Key Capabilities

* Automatic max_tokens limit detection and adjustment
* Structured JSON response with schema validation
* Multiple test modes: full, http_only, skip
* Retry mechanism with configurable attempts
* Clean chat history management
* Verbose logging and debugging options
