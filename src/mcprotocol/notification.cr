module MCProtocol
  class Notification
    include JSON::Serializable
    getter method : String
    getter params : JSON::Any?

    def initialize(@method : String, @params : JSON::Any? = Nil) : self
    end
  end
end
