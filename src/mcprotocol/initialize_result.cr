module MCProtocol
  # After receiving an initialize request from the client, the server sends this response.
  class InitializeResult
    include JSON::Serializable
    # This result property is reserved by the protocol to allow clients and servers to attach additional metadata to their responses.
    getter _meta : JSON::Any?
    getter capabilities : ServerCapabilities
    # Instructions describing how to use the server and its features.
    #
    # This can be used by clients to improve the LLM's understanding of available tools, resources, etc. It can be thought of like a "hint" to the model. For example, this information MAY be added to the system prompt.
    getter instructions : String?
    # The version of the Model Context Protocol that the server wants to use. This may not match the version that the client requested. If the client cannot support this version, it MUST disconnect.
    getter protocolVersion : String
    getter serverInfo : Implementation

    def initialize(@capabilities : ServerCapabilities, @protocolVersion : String, @serverInfo : Implementation, @_meta : JSON::Any? = Nil, @instructions : String? = Nil) : self
    end
  end
end
