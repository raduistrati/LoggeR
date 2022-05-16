//
//  File.swift
//  
//
//  Created by Radu on 16/05/2022.
//

import Foundation

internal class DefaultLogger: LogHandlerType {
  func handleLog(_ log: LogMessage) {
    let printMessage = makePrintMessage(log)
    debugPrint(printMessage)
  }
  
  private func makePrintMessage(_ logMessage: LogMessage) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "y-MM-dd H:mm:ss.SSSS"
    let dateMessage = "\(dateFormatter.string(from: logMessage.date)) | "
    let levelWithIcon = "\(logMessage.logLevel.titleWithIcon) | "
    let message = "\(logMessage.message) | "
    let fullMessage = logMessage.description.isEmpty ? "" : "Full Message: \(logMessage.description) | "
    let trace = logMessage.trace
    let messageToPrint = dateMessage + levelWithIcon + message + fullMessage + trace
    return messageToPrint
  }
}
