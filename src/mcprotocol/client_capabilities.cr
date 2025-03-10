module MCProtocol
  # Present if the client supports listing roots.
  class ClientCapabilitiesRoots
    include JSON::Serializable
    # Whether the client supports notifications for changes to the roots list.
    getter listChanged : Bool?

    def initialize(@listChanged : Bool? = Nil) : self
    end
  end

  # Capabilities a client may support. Known capabilities are defined here, in this schema, but this is not a closed set: any client can define its own, additional capabilities.
  class ClientCapabilities
    include JSON::Serializable
    # Experimental, non-standard capabilities that the client supports.
    getter experimental : JSON::Any?
    # Present if the client supports listing roots.
    getter roots : ClientCapabilitiesRoots?
    # Present if the client supports sampling from an LLM.
    getter sampling : JSON::Any?

    def initialize(@experimental : JSON::Any? = Nil, @roots : ClientCapabilitiesRoots? = Nil, @sampling : JSON::Any? = Nil) : self
    end
  end
end
