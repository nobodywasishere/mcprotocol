module MCProtocol
  class ResourceUpdatedNotificationParams
    include JSON::Serializable
    # The URI of the resource that has been updated. This might be a sub-resource of the one that the client actually subscribed to.
    getter uri : URI

    def initialize(@uri : URI) : self
    end
  end

  # A notification from the server to the client, informing it that a resource has changed and may need to be read again. This should only be sent if the client previously sent a resources/subscribe request.
  class ResourceUpdatedNotification
    include JSON::Serializable
    getter method : String = "notifications/resources/updated"
    getter params : ResourceUpdatedNotificationParams

    def initialize(@params : ResourceUpdatedNotificationParams) : self
    end
  end
end
