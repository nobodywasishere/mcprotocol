module MCProtocol
  # Describes the name and version of an MCP implementation.
  class Implementation
    include JSON::Serializable
    getter name : String
    getter version : String

    def initialize(@name : String, @version : String) : self
    end
  end
end
