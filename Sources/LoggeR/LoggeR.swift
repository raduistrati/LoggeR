//
//  LoggeR.swift
//
//
//  Created by Radu on 16/05/2022.
//


import Foundation

public class LoggeR {
  private init() {
    self.defaultLogger = DefaultLogger()
  }
  public static let shared = LoggeR()
  private let defaultLogger: LogHandlerType
  
  public var defaultUserData: [String : Any] = [:]
  public var customLogger: LogHandlerType? = nil
  public var enableConsolePrint = true
  
  public func log(
    level: LogLevel,
    _ message: String,
    fullMessage: String = "",
    file: String = #file,
    function: String = #function,
    line: Int = #line
  ) {
    let logMessage = makeLogMessage(
      level: level,
      message,
      fullMessage: fullMessage,
      file: file,
      function: function,
      line: line
    )
    if enableConsolePrint {
      defaultLogger.handleLog(logMessage)
    }
    if let customLogger = customLogger {
      customLogger.handleLog(logMessage)
    }
  }
  
  private func makeLogMessage(level: LogLevel, _ message: String, fullMessage: String, file: String, function: String, line: Int) -> LogMessage {
    let fileName = file.components(separatedBy: "/").last ?? ""
    let trace = "\(fileName): \(line) - \(function)"
    return LogMessage(logLevel: level, message: message, description: fullMessage, trace: trace, userData: defaultUserData)
  }
}
