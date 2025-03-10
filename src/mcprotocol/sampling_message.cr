module MCProtocol
  # Describes a message issued to or received from an LLM API.
  class SamplingMessage
    include JSON::Serializable
    getter content : TextContent | ImageContent
    getter role : Role

    def initialize(@content : TextContent | ImageContent, @role : Role) : self
    end
  end
end
