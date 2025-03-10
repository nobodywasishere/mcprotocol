module MCProtocol
  class ResourceTemplateAnnotations
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

  # A template description for resources available on the server.
  class ResourceTemplate
    include JSON::Serializable
    getter annotations : ResourceTemplateAnnotations?
    # A description of what this template is for.
    #
    # This can be used by clients to improve the LLM's understanding of available resources. It can be thought of like a "hint" to the model.
    getter description : String?
    # The MIME type for all resources that match this template. This should only be included if all resources matching this template have the same type.
    getter mimeType : String?
    # A human-readable name for the type of resource this template refers to.
    #
    # This can be used by clients to populate UI elements.
    getter name : String
    # A URI template (according to RFC 6570) that can be used to construct resource URIs.
    getter uriTemplate : URI

    def initialize(@name : String, @uriTemplate : URI, @annotations : ResourceTemplateAnnotations? = Nil, @description : String? = Nil, @mimeType : String? = Nil) : self
    end
  end
end
