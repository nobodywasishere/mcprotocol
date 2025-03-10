module MCProtocol
  # The server's response to a tools/list request from the client.
  class ListToolsResult
    include JSON::Serializable
    # This result property is reserved by the protocol to allow clients and servers to attach additional metadata to their responses.
    getter _meta : JSON::Any?
    # An opaque token representing the pagination position after the last returned result.
    # If present, there may be more results available.
    getter nextCursor : String?
    getter tools : Array(Tool)

    def initialize(@tools : Array(Tool), @_meta : JSON::Any? = Nil, @nextCursor : String? = Nil) : self
    end
  end
end
