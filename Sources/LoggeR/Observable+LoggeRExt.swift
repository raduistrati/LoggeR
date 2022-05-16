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
    level: LogLevel,
    _ message: String,
    description: String = "",
    observableName: String,
    includeElemnts: Bool = false,
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
          logger.log(
            level: level,
            observableName + " RxNext     ->| " + elements + message,
            fullMessage: description,
            file: file,
            function: function,
            line: line
          )
        },
        onError: { error in
          logger.log(
            level: .error,
            observableName + " RxError     " + error.localizedDescription,
            fullMessage: description,
            file: file,
            function: function,
            line: line
          )
        },
        onCompleted: {
          guard loggAllEvents else { return }
          logger.log(
            level: .debug,
            observableName + " RxCompleted ",
            fullMessage: description,
            file: file,
            function: function,
            line: line
          )
        },
        onSubscribe: {
          guard loggAllEvents else { return }
          logger.log(
            level: .debug,
            observableName + " RxSubscribed",
            fullMessage: description,
            file: file,
            function: function,
            line: line
          )
        },
        onDispose: {
          guard loggAllEvents else { return }
          logger.log(
            level: .debug,
            observableName + " RxDisposed  ",
            fullMessage: description,
            file: file,
            function: function,
            line: line
          )
        }
      )
  }
}
