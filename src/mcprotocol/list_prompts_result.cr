module MCProtocol
  # The server's response to a prompts/list request from the client.
  class ListPromptsResult
    include JSON::Serializable
    # This result property is reserved by the protocol to allow clients and servers to attach additional metadata to their responses.
    getter _meta : JSON::Any?
    # An opaque token representing the pagination position after the last returned result.
    # If present, there may be more results available.
    getter nextCursor : String?
    getter prompts : Array(Prompt)

    def initialize(@prompts : Array(Prompt), @_meta : JSON::Any? = Nil, @nextCursor : String? = Nil) : self
    end
  end
end
