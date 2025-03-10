module MCProtocol
  class ListResourcesRequestParams
    include JSON::Serializable
    # An opaque token representing the current pagination position.
    # If provided, the server should return results starting after this cursor.
    getter cursor : String?

    def initialize(@cursor : String? = Nil) : self
    end
  end

  # Sent from the client to request a list of resources the server has.
  class ListResourcesRequest
    include JSON::Serializable
    getter method : String = "resources/list"
    getter params : ListResourcesRequestParams?

    def initialize(@params : ListResourcesRequestParams? = Nil) : self
    end
  end
end
