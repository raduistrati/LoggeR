//
//  LogMessage.swift
//  
//
//  Created by Radu on 16/05/2022.
//

import Foundation

public struct LogMessage {
  public let logLevel: LogLevel
  public let date: Date = Date()
  public let message: String
  public let description: String
  public let trace: String
  public let userData: [String : Any]
}
