module MCProtocol
  # Sent from the server to request a list of root URIs from the client. Roots allow
  # servers to ask for specific directories or files to operate on. A common example
  # for roots is providing a set of repositories or directories a server should operate
  # on.
  #
  # This request is typically used when the server needs to understand the file system
  # structure or access specific locations that the client has permission to read from.
  class ListRootsRequest
    include JSON::Serializable
    getter method : String = "roots/list"
    getter params : JSON::Any?

    def initialize(@method : String, @params : JSON::Any? = Nil) : self
    end
  end
end
