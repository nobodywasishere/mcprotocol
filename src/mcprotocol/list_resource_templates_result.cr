module MCProtocol
  # The server's response to a resources/templates/list request from the client.
  class ListResourceTemplatesResult
    include JSON::Serializable
    # This result property is reserved by the protocol to allow clients and servers to attach additional metadata to their responses.
    getter _meta : JSON::Any?
    # An opaque token representing the pagination position after the last returned result.
    # If present, there may be more results available.
    getter nextCursor : String?
    getter resourceTemplates : Array(ResourceTemplate)

    def initialize(@resourceTemplates : Array(ResourceTemplate), @_meta : JSON::Any? = Nil, @nextCursor : String? = Nil) : self
    end
  end
end
