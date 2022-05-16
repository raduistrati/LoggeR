//
//  LogHandlerType.swift
//  
//
//  Created by Radu on 16/05/2022.
//

import Foundation

public protocol LogHandlerType {
  func handleLog(_ log: LogMessage)
}
