module MCProtocol
  # A JSON Schema object defining the expected parameters for the tool.
  class ToolInputSchema
    include JSON::Serializable
    getter properties : JSON::Any?
    getter required : Array(String)?
    getter type : String = "object"

    def initialize(@type : String, @properties : JSON::Any? = Nil, @required : Array(String)? = Nil) : self
    end
  end

  # Definition for a tool the client can call.
  class Tool
    include JSON::Serializable
    # A human-readable description of the tool.
    getter description : String?
    # A JSON Schema object defining the expected parameters for the tool.
    getter inputSchema : ToolInputSchema
    # The name of the tool.
    getter name : String

    def initialize(@inputSchema : ToolInputSchema, @name : String, @description : String? = Nil) : self
    end
  end
end
