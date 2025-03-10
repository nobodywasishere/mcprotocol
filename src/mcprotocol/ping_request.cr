module MCProtocol
  # A ping, issued by either the server or the client, to check that the other party is still alive. The receiver must promptly respond, or else may be disconnected.
  class PingRequest
    include JSON::Serializable
    getter method : String = "ping"
    getter params : JSON::Any?

    def initialize(@method : String, @params : JSON::Any? = Nil) : self
    end
  end
end
