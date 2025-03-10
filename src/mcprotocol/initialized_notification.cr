module MCProtocol
  # This notification is sent from the client to the server after initialization has finished.
  class InitializedNotification
    include JSON::Serializable
    getter method : String = "notifications/initialized"
    getter params : JSON::Any?

    def initialize(@method : String, @params : JSON::Any? = Nil) : self
    end
  end
end
