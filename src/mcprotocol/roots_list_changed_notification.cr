module MCProtocol
  # A notification from the client to the server, informing it that the list of roots has changed.
  # This notification should be sent whenever the client adds, removes, or modifies any root.
  # The server should then request an updated list of roots using the ListRootsRequest.
  class RootsListChangedNotification
    include JSON::Serializable
    getter method : String = "notifications/roots/list_changed"
    getter params : JSON::Any?

    def initialize(@method : String, @params : JSON::Any? = Nil) : self
    end
  end
end
