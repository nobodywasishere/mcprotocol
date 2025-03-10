module MCProtocol
  class ResourceAnnotations
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

  # A known resource that the server is capable of reading.
  class Resource
    include JSON::Serializable
    getter annotations : ResourceAnnotations?
    # A description of what this resource represents.
    #
    # This can be used by clients to improve the LLM's understanding of available resources. It can be thought of like a "hint" to the model.
    getter description : String?
    # The MIME type of this resource, if known.
    getter mimeType : String?
    # A human-readable name for this resource.
    #
    # This can be used by clients to populate UI elements.
    getter name : String
    # The size of the raw resource content, in bytes (i.e., before base64 encoding or any tokenization), if known.
    #
    # This can be used by Hosts to display file sizes and estimate context window usage.
    getter size : Int64?
    # The URI of this resource.
    getter uri : URI

    def initialize(@name : String, @uri : URI, @annotations : ResourceAnnotations? = Nil, @description : String? = Nil, @mimeType : String? = Nil, @size : Int64? = Nil) : self
    end
  end
end
