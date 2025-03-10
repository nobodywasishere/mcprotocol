module MCProtocol
  class CompleteResultCompletion
    include JSON::Serializable
    # Indicates whether there are additional completion options beyond those provided in the current response, even if the exact total is unknown.
    getter hasMore : Bool?
    # The total number of completion options available. This can exceed the number of values actually sent in the response.
    getter total : Int64?
    # An array of completion values. Must not exceed 100 items.
    getter values : Array(String)

    def initialize(@values : Array(String), @hasMore : Bool? = Nil, @total : Int64? = Nil) : self
    end
  end

  # The server's response to a completion/complete request
  class CompleteResult
    include JSON::Serializable
    # This result property is reserved by the protocol to allow clients and servers to attach additional metadata to their responses.
    getter _meta : JSON::Any?
    getter completion : CompleteResultCompletion

    def initialize(@completion : CompleteResultCompletion, @_meta : JSON::Any? = Nil) : self
    end
  end
end
