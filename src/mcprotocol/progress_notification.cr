module MCProtocol
  class ProgressNotificationParams
    include JSON::Serializable
    # The progress thus far. This should increase every time progress is made, even if the total is unknown.
    getter progress : Float64
    # The progress token which was given in the initial request, used to associate this notification with the request that is proceeding.
    getter progressToken : ProgressToken
    # Total number of items to process (or total progress required), if known.
    getter total : Float64?

    def initialize(@progress : Float64, @progressToken : ProgressToken, @total : Float64? = Nil) : self
    end
  end

  # An out-of-band notification used to inform the receiver of a progress update for a long-running request.
  class ProgressNotification
    include JSON::Serializable
    getter method : String = "notifications/progress"
    getter params : ProgressNotificationParams

    def initialize(@method : String, @params : ProgressNotificationParams) : self
    end
  end
end
