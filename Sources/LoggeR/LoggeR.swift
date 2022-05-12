import Foundation

public class LoggeR {
  private init() {}
  public static let shared = LoggeR()
  
  public func log(_ message: String) {
    debugPrint(message)
  }
}
