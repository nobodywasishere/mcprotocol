module MCProtocol
  # The server's response to a prompts/get request from the client.
  class GetPromptResult
    include JSON::Serializable
    # This result property is reserved by the protocol to allow clients and servers to attach additional metadata to their responses.
    getter _meta : JSON::Any?
    # An optional description for the prompt.
    getter description : String?
    getter messages : Array(PromptMessage)

    def initialize(@messages : Array(PromptMessage), @_meta : JSON::Any? = Nil, @description : String? = Nil) : self
    end
  end
end
