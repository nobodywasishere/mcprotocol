module MCProtocol
  # A prompt or prompt template that the server offers.
  class Prompt
    include JSON::Serializable
    # A list of arguments to use for templating the prompt.
    getter arguments : Array(PromptArgument)?
    # An optional description of what this prompt provides
    getter description : String?
    # The name of the prompt or prompt template.
    getter name : String

    def initialize(@name : String, @arguments : Array(PromptArgument)? = Nil, @description : String? = Nil) : self
    end
  end
end
