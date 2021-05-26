//
//  BugLogger.swift
//  InstabugInternshipTask
//
//  Created by Hala on 26/05/2021.
//

import Foundation


struct LoggerModel {
    
    enum LogLevel: String {
        case trace = "trace"
        case debug = "debug"
        case info = "info"
        case notice = "notice"
        case error = "error"
    }
    
    var message: String
    var level: LogLevel
    var timeStamp: Date
    
}



