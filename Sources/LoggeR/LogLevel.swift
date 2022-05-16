//
//  LogLevel.swift
//  
//
//  Created by Radu on 16/05/2022.
//

import Foundation

public enum LogLevel: Int {
  case debug
  case info
  case warning
  case error
  
  public var title: String {
    switch self {
    case .debug:
      return "DEBUG  "
    case .info:
      return "INFO   "
    case .warning:
      return "WARNING"
    case .error:
      return "ERROR  "
    }
  }
  public var icon: String {
    switch self {
    case .debug:
      return "🟤"
    case .info:
      return "🔵"
    case .warning:
      return "🟠"
    case .error:
      return "🔴"
    }
  }
  public var titleWithIcon: String {
    return icon.appending(" ").appending(title)
  }
}
