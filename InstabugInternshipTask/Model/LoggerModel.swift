//
//  LoggerModel.swift
//  InstabugInternshipTask
//
//  Created by Hala on 26/05/2021.
//

import Foundation


struct LoggerModel {
        
    enum LoggerLevel: String {
        case trace = "trace"
        case debug = "debug"
        case info = "info"
        case notice = "notice"
        case error = "error"
    }
    
    var message: String
    var level: LoggerLevel
    var timeStamp: Date
    
}


//struct ll {
//    let x = LoggerModel(message: <#T##String#>, level: , timeStamp: <#T##Date#>)
//}
