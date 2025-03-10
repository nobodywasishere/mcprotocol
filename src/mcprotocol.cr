require "json"
require "uri"
require "./mcprotocol/*"

module MCProtocol
  VERSION = "0.1.0"

  # Hand-rolled
  METHOD_TYPES = {
    "initialize" => {
      InitializeRequest, InitializeResult, InitializeRequestParams,
    },
    "ping" => {
      PingRequest, Nil, JSON::Any?,
    },
    "resources/list" => {
      ListResourcesRequest, ListResourcesResult, ListResourcesRequestParams,
    },
    "resources/templates/list" => {
      ListResourceTemplatesRequest, ListResourcesResult, ListResourcesRequestParams,
    },
    "resources/read" => {
      ReadResourceRequest, ReadResourceResult, ReadResourceRequestParams,
    },
    "resources/subscribe" => {
      SubscribeRequest, Nil, SubscribeRequestParams,
    },
    "resources/unsubscribe" => {
      UnsubscribeRequest, Nil, UnsubscribeRequestParams,
    },
    "prompts/list" => {
      ListPromptsRequest, ListPromptsResult, ListPromptsRequestParams,
    },
    "prompts/get" => {
      GetPromptRequest, GetPromptResult, GetPromptRequestParams,
    },
    "tools/list" => {
      ListToolsRequest, ListToolsResult, ListToolsRequestParams,
    },
    "tools/call" => {
      CallToolRequest, CallToolResult, CallToolRequestParams,
    },
    "logging/setLevel" => {
      SetLevelRequest, Nil, SetLevelRequestParams,
    },
    "completion/complete" => {
      CompleteRequest, CompleteResult, CompleteRequestParams,
    },
    "notifications/cancelled" => {
      CancelledNotification, Nil, CancelledNotificationParams,
    },
    "sampling/createMessage" => {
      CreateMessageRequest, CreateMessageResult, CreateMessageRequestParams,
    },
    "notifications/initialized" => {
      InitializedNotification, Nil, JSON::Any?,
    },
    "notifications/message" => {
      LoggingMessageNotification, Nil, LoggingMessageNotificationParams,
    },
    "notifications/progress" => {
      ProgressNotification, Nil, ProgressNotificationParams,
    },
    "notifications/prompts/list_changed" => {
      PromptListChangedNotification, Nil, JSON::Any?,
    },
    "notifications/resources/list_changed" => {
      ResourceListChangedNotification, Nil, JSON::Any?,
    },
    "notifications/resources/updated" => {
      ResourceUpdatedNotification, Nil, ResourceUpdatedNotificationParams,
    },
    "notifications/roots/list_changed" => {
      RootsListChangedNotification, Nil, JSON::Any?,
    },
    "notifications/tools/list_changed" => {
      ToolListChangedNotification, Nil, JSON::Any?,
    },
  }

  class ParseError < Exception
  end

  # Copied from `nobodywasishere/lsprotocol-crystal`, may or may not work
  def self.parse_message(data : String, method : String? = nil, *, as obj_type = nil) : ClientRequest
    json = JSON.parse(data)
    json_h = json.as_h

    if method.nil?
      method = json_h["method"]?.try(&.as_s) || nil
    end

    if obj_type
      # already have type
      # elsif json_h["result"]?.try(&.as_h?) || json_h["result"]?.try(&.as_a?)
      #   raise ParseError.new("Method cannot be nil (found result)") if method.nil?

      #   obj_type = METHOD_TYPES[method][1]
    elsif json_h["error"]?.try(&.as_h?)
      obj_type = JSONRPCError
    else
      raise ParseError.new("Method cannot be nil") if method.nil?

      obj_type = METHOD_TYPES[method][0]
    end

    obj_type.from_json(data).as(ClientRequest)
  end
end
