module MCProtocol
  alias ServerNotification = CancelledNotification | ProgressNotification | ResourceListChangedNotification | ResourceUpdatedNotification | PromptListChangedNotification | ToolListChangedNotification | LoggingMessageNotification
end
