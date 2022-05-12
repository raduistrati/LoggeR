import Foundation

public class LoggeR {
  private init() {}
  public let shared = LoggeR()
  
  public func log(_ message: String) {
    debugPrint(message)
  }
}
