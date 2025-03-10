module MCProtocol
  # A notification which does not expect a response.
  class JSONRPCNotification
    include JSON::Serializable
    getter jsonrpc : String = "2.0"
    getter method : String
    getter params : JSON::Any?

    def initialize(@jsonrpc : String, @method : String, @params : JSON::Any? = Nil) : self
    end
  end
end
