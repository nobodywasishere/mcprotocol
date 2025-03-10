module MCProtocol
  class ListToolsRequestParams
    include JSON::Serializable
    # An opaque token representing the current pagination position.
    # If provided, the server should return results starting after this cursor.
    getter cursor : String?

    def initialize(@cursor : String? = Nil) : self
    end
  end

  # Sent from the client to request a list of tools the server has.
  class ListToolsRequest
    include JSON::Serializable
    getter method : String = "tools/list"
    getter params : ListToolsRequestParams?

    def initialize(@params : ListToolsRequestParams? = Nil) : self
    end
  end
end
