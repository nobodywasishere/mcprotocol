module MCProtocol
  class InitializeRequestParams
    include JSON::Serializable
    getter capabilities : ClientCapabilities
    getter clientInfo : Implementation
    # The latest version of the Model Context Protocol that the client supports. The client MAY decide to support older versions as well.
    getter protocolVersion : String

    def initialize(@capabilities : ClientCapabilities, @clientInfo : Implementation, @protocolVersion : String) : self
    end
  end

  # This request is sent from the client to the server when it first connects, asking it to begin initialization.
  class InitializeRequest
    include JSON::Serializable
    getter method : String = "initialize"
    getter params : InitializeRequestParams

    def initialize(@method : String, @params : InitializeRequestParams) : self
    end
  end
end
