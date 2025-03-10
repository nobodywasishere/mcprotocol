module MCProtocol
  class AnnotatedAnnotations
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

  # Base for objects that include optional annotations for the client. The client can use annotations to inform how objects are used or displayed
  class Annotated
    include JSON::Serializable
    getter annotations : AnnotatedAnnotations?

    def initialize(@annotations : AnnotatedAnnotations? = Nil) : self
    end
  end
end
