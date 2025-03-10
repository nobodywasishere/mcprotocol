module MCProtocol
  class TextContentAnnotations
    include JSON::Serializable
    # Describes who the intended customer of this object or data is.
    #
    # It can include multiple entries to indicate content useful for multiple audiences (e.g., `["user", "assistant"]`).
    getter audience : Array(Role)?
    # Describes how important this data is for operating the server.
    #
    # A value of 1 means "most important," and indicates that the data is
    # effectively required, while 0 means "least important," and indicates that
    # the data is entirely optional.
    getter priority : Float64?

    def initialize(@audience : Array(Role)? = Nil, @priority : Float64? = Nil) : self
    end
  end

  # Text provided to or from an LLM.
  class TextContent
    include JSON::Serializable
    getter annotations : TextContentAnnotations?
    # The text content of the message.
    getter text : String
    getter type : String = "text"

    def initialize(@text : String, @annotations : TextContentAnnotations? = Nil, @type : String = "text") : self
    end
  end
end
