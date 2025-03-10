module MCProtocol
  class CallToolRequestParams
    include JSON::Serializable
    getter arguments : JSON::Any?
    getter name : String

    def initialize(@name : String, @arguments : JSON::Any? = Nil) : self
    end
  end

  # Used by the client to invoke a tool provided by the server.
  class CallToolRequest
    include JSON::Serializable
    getter method : String = "tools/call"
    getter params : CallToolRequestParams

    def initialize(@method : String, @params : CallToolRequestParams) : self
    end
  end
end
