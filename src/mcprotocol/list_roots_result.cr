module MCProtocol
  # The client's response to a roots/list request from the server.
  # This result contains an array of Root objects, each representing a root directory
  # or file that the server can operate on.
  class ListRootsResult
    include JSON::Serializable
    # This result property is reserved by the protocol to allow clients and servers to attach additional metadata to their responses.
    getter _meta : JSON::Any?
    getter roots : Array(Root)

    def initialize(@roots : Array(Root), @_meta : JSON::Any? = Nil) : self
    end
  end
end
