module MCProtocol
  class Result
    include JSON::Serializable
    # This result property is reserved by the protocol to allow clients and servers to attach additional metadata to their responses.
    getter _meta : JSON::Any?

    def initialize(@_meta : JSON::Any? = Nil) : self
    end
  end
end
