module MCProtocol
  class TextResourceContents
    include JSON::Serializable
    # The MIME type of this resource, if known.
    getter mimeType : String?
    # The text of the item. This must only be set if the item can actually be represented as text (not binary data).
    getter text : String
    # The URI of this resource.
    getter uri : URI

    def initialize(@text : String, @uri : URI, @mimeType : String? = Nil) : self
    end
  end
end
