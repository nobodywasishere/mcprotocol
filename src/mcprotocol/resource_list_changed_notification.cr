module MCProtocol
  # An optional notification from the server to the client, informing it that the list of resources it can read from has changed. This may be issued by servers without any previous subscription from the client.
  class ResourceListChangedNotification
    include JSON::Serializable
    getter method : String = "notifications/resources/list_changed"
    getter params : JSON::Any?

    def initialize(@method : String, @params : JSON::Any? = Nil) : self
    end
  end
end
