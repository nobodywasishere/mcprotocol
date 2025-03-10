module MCProtocol
  # The argument's information
  class CompleteRequestParamsArgument
    include JSON::Serializable
    # The name of the argument
    getter name : String
    # The value of the argument to use for completion matching.
    getter value : String

    def initialize(@name : String, @value : String) : self
    end
  end

  class CompleteRequestParams
    include JSON::Serializable
    # The argument's information
    getter argument : CompleteRequestParamsArgument
    getter ref : PromptReference | ResourceReference

    def initialize(@argument : CompleteRequestParamsArgument, @ref : PromptReference | ResourceReference) : self
    end
  end

  # A request from the client to the server, to ask for completion options.
  class CompleteRequest
    include JSON::Serializable
    getter method : String = "completion/complete"
    getter params : CompleteRequestParams

    def initialize(@method : String, @params : CompleteRequestParams) : self
    end
  end
end
