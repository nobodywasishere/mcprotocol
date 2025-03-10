module MCProtocol
  # The client's response to a sampling/create_message request from the server. The client should inform the user before returning the sampled message, to allow them to inspect the response (human in the loop) and decide whether to allow the server to see it.
  class CreateMessageResult
    include JSON::Serializable
    # This result property is reserved by the protocol to allow clients and servers to attach additional metadata to their responses.
    getter _meta : JSON::Any?
    getter content : TextContent | ImageContent
    # The name of the model that generated the message.
    getter model : String
    getter role : Role
    # The reason why sampling stopped, if known.
    getter stopReason : String?

    def initialize(@content : TextContent | ImageContent, @model : String, @role : Role, @_meta : JSON::Any? = Nil, @stopReason : String? = Nil) : self
    end
  end
end
