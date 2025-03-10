module MCProtocol
  class SubscribeRequestParams
    include JSON::Serializable
    # The URI of the resource to subscribe to. The URI can use any protocol; it is up to the server how to interpret it.
    getter uri : URI

    def initialize(@uri : URI) : self
    end
  end

  # Sent from the client to request resources/updated notifications from the server whenever a particular resource changes.
  class SubscribeRequest
    include JSON::Serializable
    getter method : String = "resources/subscribe"
    getter params : SubscribeRequestParams

    def initialize(@method : String, @params : SubscribeRequestParams) : self
    end
  end
end
