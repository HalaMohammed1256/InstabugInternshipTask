//
//  InstabugLogger.swift
//  InstabugLogger
//
//  Created by Yosef Hamza on 19/04/2021.
//

import Foundation
import UIKit

public class InstabugLogger {
    
    public static var shared = InstabugLogger()
 
    
    // MARK: Logging
    public func log(level: LoggerLevel, message: String) {
        
        let logMessage = getLogMessage(message: message)
        let timestramp = getLogTimestamp()
        
        
        let loggerModel = LoggerModel(message: logMessage, level: .error, timestamp: timestramp)
        
        // save log to core data
        CoreDataManager.instance.saveNewLogToLogger(entityName: Constants.loggerEntity, loggerData: loggerModel)
        
        let loggers = fetchAllLogs() as? [LoggerModel]
//        print(loggers?.contains(where: <#T##(LoggerModel) throws -> Bool#>))

    }

    
    
    
    // MARK: Fetch logs
    public func fetchAllLogs() -> [Logger] {
        
        let loggers = CoreDataManager.instance.fetchAllLogsFromLogger(entityName: Constants.loggerEntity)
        return loggers
        
    }
    
    public func fetchAllLogs(completionHandler: ([Logger])->Void) {
        
        let loggers = CoreDataManager.instance.fetchAllLogsFromLogger(entityName: Constants.loggerEntity)
        completionHandler(loggers)
        
    }
    
    
    public func clearLogs(){
        // remove all from core data
        CoreDataManager.instance.clearLogs(entityName: Constants.loggerEntity)
    }
    
    
    
    func getLogMessage(message: String) -> String{
        
        var logMessage = message
        if message.count > 1000{
            logMessage.removeLast(message.count - 1000)
            logMessage.append("...")
        }
        
        return logMessage
    }
    
    func getLogTimestamp() -> String{
        
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let timestramp = formatter.string(from: date)
        
        return timestramp
    }
    
   
}
