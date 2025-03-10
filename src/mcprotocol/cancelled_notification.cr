module MCProtocol
  class CancelledNotificationParams
    include JSON::Serializable
    # An optional string describing the reason for the cancellation. This MAY be logged or presented to the user.
    getter reason : String?
    # The ID of the request to cancel.
    #
    # This MUST correspond to the ID of a request previously issued in the same direction.
    getter requestId : RequestId

    def initialize(@requestId : RequestId, @reason : String? = Nil) : self
    end
  end

  # This notification can be sent by either side to indicate that it is cancelling a previously-issued request.
  #
  # The request SHOULD still be in-flight, but due to communication latency, it is always possible that this notification MAY arrive after the request has already finished.
  #
  # This notification indicates that the result will be unused, so any associated processing SHOULD cease.
  #
  # A client MUST NOT attempt to cancel its `initialize` request.
  class CancelledNotification
    include JSON::Serializable
    getter method : String = "notifications/cancelled"
    getter params : CancelledNotificationParams

    def initialize(@params : CancelledNotificationParams) : self
    end
  end
end
