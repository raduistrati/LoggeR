//
//  File.swift
//  
//
//  Created by Radu on 16/05/2022.
//

import Foundation
import RxSwift

public extension ObservableConvertibleType {
  func logActivity(
    observableName: String,
    message: String,
    includeElemnts: Bool = false,
    logLevel: LogLevel = .info,
    loggAllEvents: Bool = true,
    file: String = #file,
    function: String = #function,
    line: Int = #line
  ) -> Observable<Element> {
    
    let logger = LoggeR.shared
    return self.asObservable()
      .do(
        onNext: { newElement in
          let elements = includeElemnts ? " \(newElement) | " : ""
          logger.log(level: .info, observableName + " RxNext     ->| " + elements + message, file: file, function: function, line: line)
        },
        onError: {error in
          logger.log(level: .error, observableName + error.localizedDescription, file: file, function: function, line: line)
        },
        onCompleted: {
          guard loggAllEvents else { return }
          logger.log(level: .debug, observableName + " RxCompleted ", file: file, function: function, line: line)
        },
        onSubscribe: {
          guard loggAllEvents else { return }
          logger.log(level: .debug, observableName + " RxSubscribed", file: file, function: function, line: line)
        },
        onDispose: {
          guard loggAllEvents else { return }
          logger.log(level: .debug, observableName + " RxDisposed  ", file: file, function: function, line: line)
        }
      )
  }
}
