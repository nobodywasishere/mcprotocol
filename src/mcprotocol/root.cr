module MCProtocol
  # Represents a root directory or file that the server can operate on.
  class Root
    include JSON::Serializable
    # An optional name for the root. This can be used to provide a human-readable
    # identifier for the root, which may be useful for display purposes or for
    # referencing the root in other parts of the application.
    getter name : String?
    # The URI identifying the root. This *must* start with file:// for now.
    # This restriction may be relaxed in future versions of the protocol to allow
    # other URI schemes.
    getter uri : URI

    def initialize(@uri : URI, @name : String? = Nil) : self
    end
  end
end
