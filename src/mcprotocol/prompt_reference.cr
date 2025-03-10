module MCProtocol
  # Identifies a prompt.
  class PromptReference
    include JSON::Serializable
    # The name of the prompt or prompt template
    getter name : String
    getter type : String = "ref/prompt"

    def initialize(@name : String, @type : String = "ref/prompt") : self
    end
  end
end
