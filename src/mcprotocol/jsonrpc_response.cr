module MCProtocol
  # A successful (non-error) response to a request.
  class JSONRPCResponse
    include JSON::Serializable
    getter id : RequestId
    getter jsonrpc : String = "2.0"
    getter result : Result

    def initialize(@id : RequestId, @result : Result, @jsonrpc : String = "2.0") : self
    end
  end
end
