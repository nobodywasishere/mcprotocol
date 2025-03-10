module MCProtocol
  class SetLevelRequestParams
    include JSON::Serializable
    # The level of logging that the client wants to receive from the server. The server should send all logs at this level and higher (i.e., more severe) to the client as notifications/message.
    getter level : LoggingLevel

    def initialize(@level : LoggingLevel) : self
    end
  end

  # A request from the client to the server, to enable or adjust logging.
  class SetLevelRequest
    include JSON::Serializable
    getter method : String = "logging/setLevel"
    getter params : SetLevelRequestParams

    def initialize(@method : String, @params : SetLevelRequestParams) : self
    end
  end
end
