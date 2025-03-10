module MCProtocol
  class GetPromptRequestParams
    include JSON::Serializable
    # Arguments to use for templating the prompt.
    getter arguments : JSON::Any?
    # The name of the prompt or prompt template.
    getter name : String

    def initialize(@name : String, @arguments : JSON::Any? = Nil) : self
    end
  end

  # Used by the client to get a prompt provided by the server.
  class GetPromptRequest
    include JSON::Serializable
    getter method : String = "prompts/get"
    getter params : GetPromptRequestParams

    def initialize(@method : String, @params : GetPromptRequestParams) : self
    end
  end
end
