module MCProtocol
  class UnsubscribeRequestParams
    include JSON::Serializable
    # The URI of the resource to unsubscribe from.
    getter uri : URI

    def initialize(@uri : URI) : self
    end
  end

  # Sent from the client to request cancellation of resources/updated notifications from the server. This should follow a previous resources/subscribe request.
  class UnsubscribeRequest
    include JSON::Serializable
    getter method : String = "resources/unsubscribe"
    getter params : UnsubscribeRequestParams

    def initialize(@params : UnsubscribeRequestParams) : self
    end
  end
end
