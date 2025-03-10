module MCProtocol
  class EmbeddedResourceAnnotations
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

  # The contents of a resource, embedded into a prompt or tool call result.
  #
  # It is up to the client how best to render embedded resources for the benefit
  # of the LLM and/or the user.
  class EmbeddedResource
    include JSON::Serializable
    getter annotations : EmbeddedResourceAnnotations?
    getter resource : TextResourceContents | BlobResourceContents
    getter type : String = "resource"

    def initialize(@resource : TextResourceContents | BlobResourceContents, @annotations : EmbeddedResourceAnnotations? = Nil, @type : String = "resource") : self
    end
  end
end
