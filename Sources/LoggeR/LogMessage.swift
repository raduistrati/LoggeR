//
//  LogMessage.swift
//  
//
//  Created by Radu on 16/05/2022.
//

import Foundation

public struct LogMessage {
  let logLevel: LogLevel
  let date: Date = Date()
  let message: String
  let description: String
  let trace: String
  let userData: [String : Any]
}
