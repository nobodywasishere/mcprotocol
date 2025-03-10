module MCProtocol
  # The server's response to a resources/read request from the client.
  class ReadResourceResult
    include JSON::Serializable
    # This result property is reserved by the protocol to allow clients and servers to attach additional metadata to their responses.
    getter _meta : JSON::Any?
    getter contents : Array(String)

    def initialize(@contents : Array(String), @_meta : JSON::Any? = Nil) : self
    end
  end
end
