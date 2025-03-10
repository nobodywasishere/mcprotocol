module MCProtocol
  # An optional notification from the server to the client, informing it that the list of tools it offers has changed. This may be issued by servers without any previous subscription from the client.
  class ToolListChangedNotification
    include JSON::Serializable
    getter method : String = "notifications/tools/list_changed"
    getter params : JSON::Any?

    def initialize(@params : JSON::Any? = Nil) : self
    end
  end
end
