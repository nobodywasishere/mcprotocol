module MCProtocol
  # Present if the server offers any prompt templates.
  class ServerCapabilitiesPrompts
    include JSON::Serializable
    # Whether this server supports notifications for changes to the prompt list.
    getter listChanged : Bool?

    def initialize(@listChanged : Bool? = Nil) : self
    end
  end

  # Present if the server offers any resources to read.
  class ServerCapabilitiesResources
    include JSON::Serializable
    # Whether this server supports notifications for changes to the resource list.
    getter listChanged : Bool?
    # Whether this server supports subscribing to resource updates.
    getter subscribe : Bool?

    def initialize(@listChanged : Bool? = Nil, @subscribe : Bool? = Nil) : self
    end
  end

  # Present if the server offers any tools to call.
  class ServerCapabilitiesTools
    include JSON::Serializable
    # Whether this server supports notifications for changes to the tool list.
    getter listChanged : Bool?

    def initialize(@listChanged : Bool? = Nil) : self
    end
  end

  # Capabilities that a server may support. Known capabilities are defined here, in this schema, but this is not a closed set: any server can define its own, additional capabilities.
  class ServerCapabilities
    include JSON::Serializable
    # Experimental, non-standard capabilities that the server supports.
    getter experimental : JSON::Any?
    # Present if the server supports sending log messages to the client.
    getter logging : JSON::Any?
    # Present if the server offers any prompt templates.
    getter prompts : ServerCapabilitiesPrompts?
    # Present if the server offers any resources to read.
    getter resources : ServerCapabilitiesResources?
    # Present if the server offers any tools to call.
    getter tools : ServerCapabilitiesTools?

    def initialize(@experimental : JSON::Any? = Nil, @logging : JSON::Any? = Nil, @prompts : ServerCapabilitiesPrompts? = Nil, @resources : ServerCapabilitiesResources? = Nil, @tools : ServerCapabilitiesTools? = Nil) : self
    end
  end
end
