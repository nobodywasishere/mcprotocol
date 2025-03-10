module MCProtocol
  class ListPromptsRequestParams
    include JSON::Serializable
    # An opaque token representing the current pagination position.
    # If provided, the server should return results starting after this cursor.
    getter cursor : String?

    def initialize(@cursor : String? = Nil) : self
    end
  end

  # Sent from the client to request a list of prompts and prompt templates the server has.
  class ListPromptsRequest
    include JSON::Serializable
    getter method : String = "prompts/list"
    getter params : ListPromptsRequestParams?

    def initialize(@params : ListPromptsRequestParams? = Nil) : self
    end
  end
end
