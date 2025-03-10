module MCProtocol
  # The severity of a log message.
  #
  # These map to syslog message severities, as specified in RFC-5424:
  # https://datatracker.ietf.org/doc/html/rfc5424#section-6.2.1
  enum LoggingLevel
    Alert
    Critical
    Debug
    Emergency
    Error
    Info
    Notice
    Warning
  end
end
