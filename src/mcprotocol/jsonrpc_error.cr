module MCProtocol
  class JSONRPCErrorError
    include JSON::Serializable
    # The error type that occurred.
    getter code : Int64
    # Additional information about the error. The value of this member is defined by the sender (e.g. detailed error information, nested errors etc.).
    getter data : JSON::Any?
    # A short description of the error. The message SHOULD be limited to a concise single sentence.
    getter message : String

    def initialize(@code : Int64, @message : String, @data : JSON::Any? = Nil) : self
    end
  end

  # A response to a request that indicates an error occurred.
  class JSONRPCError
    include JSON::Serializable
    getter error : JSONRPCErrorError
    getter id : RequestId
    getter jsonrpc : String = "2.0"

    def initialize(@error : JSONRPCErrorError, @id : RequestId, @jsonrpc : String = "2.0") : self
    end
  end
end
