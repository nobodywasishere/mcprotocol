module MCProtocol
  class LoggingMessageNotificationParams
    include JSON::Serializable
    # The data to be logged, such as a string message or an object. Any JSON serializable type is allowed here.
    getter data : JSON::Any
    # The severity of this log message.
    getter level : LoggingLevel
    # An optional name of the logger issuing this message.
    getter logger : String?

    def initialize(@data : JSON::Any, @level : LoggingLevel, @logger : String? = Nil) : self
    end
  end

  # Notification of a log message passed from server to client. If no logging/setLevel request has been sent from the client, the server MAY decide which messages to send automatically.
  class LoggingMessageNotification
    include JSON::Serializable
    getter method : String = "notifications/message"
    getter params : LoggingMessageNotificationParams

    def initialize(@params : LoggingMessageNotificationParams) : self
    end
  end
end
