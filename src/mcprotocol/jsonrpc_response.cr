module MCProtocol
  # A successful (non-error) response to a request.
  class JSONRPCResponse
    include JSON::Serializable
    getter id : RequestId
    getter jsonrpc : String = "2.0"
    getter result : Result

    def initialize(@id : RequestId, @jsonrpc : String, @result : Result) : self
    end
  end
end
