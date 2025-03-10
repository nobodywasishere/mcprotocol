module MCProtocol
  class PaginatedRequestParams
    include JSON::Serializable
    # An opaque token representing the current pagination position.
    # If provided, the server should return results starting after this cursor.
    getter cursor : String?

    def initialize(@cursor : String? = Nil) : self
    end
  end

  class PaginatedRequest
    include JSON::Serializable
    getter method : String
    getter params : PaginatedRequestParams?

    def initialize(@method : String, @params : PaginatedRequestParams? = Nil) : self
    end
  end
end
