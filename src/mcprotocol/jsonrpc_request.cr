module MCProtocol
  # A request that expects a response.
  class JSONRPCRequest
    include JSON::Serializable
    getter id : RequestId
    getter jsonrpc : String = "2.0"
    getter method : String
    getter params : JSON::Any?

    def initialize(@id : RequestId, @method : String, @jsonrpc : String = "2.0", @params : JSON::Any? = Nil) : self
    end
  end
end
