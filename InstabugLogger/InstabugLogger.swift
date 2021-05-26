//
//  InstabugLogger.swift
//  InstabugLogger
//
//  Created by Yosef Hamza on 19/04/2021.
//

import Foundation

public class InstabugLogger {
    
    public static var shared = InstabugLogger()
    
    
    public enum LoggerLevel: String {
        case trace = "trace"
        case debug = "debug"
        case info = "info"
        case notice = "notice"
        case error = "error"
    }
    

    // MARK: Logging
    public func log(level: LoggerLevel, message: String) {
        print(message)
    }

    // MARK: Fetch logs
    #warning("Replace Any with an appropriate type")
    public func fetchAllLogs() -> Any {
        fatalError("Not implemented")
    }
    
    #warning("Replace Any with an appropriate type")
    public func fetchAllLogs(completionHandler: (Any)->Void) {
        fatalError("Not implemented")
    }
}
