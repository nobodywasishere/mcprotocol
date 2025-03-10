module MCProtocol
  # A request to include context from one or more MCP servers (including the caller), to be attached to the prompt. The client MAY ignore this request.
  enum CreateMessageRequestParamsIncludeContext
    AllServers
    None
    ThisServer
  end

  class CreateMessageRequestParams
    include JSON::Serializable
    # A request to include context from one or more MCP servers (including the caller), to be attached to the prompt. The client MAY ignore this request.
    getter includeContext : CreateMessageRequestParamsIncludeContext?
    # The maximum number of tokens to sample, as requested by the server. The client MAY choose to sample fewer tokens than requested.
    getter maxTokens : Int64
    getter messages : Array(SamplingMessage)
    # Optional metadata to pass through to the LLM provider. The format of this metadata is provider-specific.
    getter metadata : JSON::Any?
    # The server's preferences for which model to select. The client MAY ignore these preferences.
    getter modelPreferences : ModelPreferences?
    getter stopSequences : Array(String)?
    # An optional system prompt the server wants to use for sampling. The client MAY modify or omit this prompt.
    getter systemPrompt : String?
    getter temperature : Float64?

    def initialize(@maxTokens : Int64, @messages : Array(SamplingMessage), @includeContext : CreateMessageRequestParamsIncludeContext? = Nil, @metadata : JSON::Any? = Nil, @modelPreferences : ModelPreferences? = Nil, @stopSequences : Array(String)? = Nil, @systemPrompt : String? = Nil, @temperature : Float64? = Nil) : self
    end
  end

  # A request from the server to sample an LLM via the client. The client has full discretion over which model to select. The client should also inform the user before beginning sampling, to allow them to inspect the request (human in the loop) and decide whether to approve it.
  class CreateMessageRequest
    include JSON::Serializable
    getter method : String = "sampling/createMessage"
    getter params : CreateMessageRequestParams

    def initialize(@method : String, @params : CreateMessageRequestParams) : self
    end
  end
end
