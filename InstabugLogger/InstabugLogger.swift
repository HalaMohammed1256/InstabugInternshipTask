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
        let timestramp = getLogTimestramp()
        
        
        
        print("your project send a\\an \(level) with message \(logMessage) and that log has occurred at \(timestramp)")
        
        
        let loggerModel = LoggerModel(message: logMessage, level: .error, timeStamp: timestramp)
        
        // save log to core data
        CoreDataManager.instance.saveToCoreData(entityName: "Logger", loggerData: loggerModel)

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
    
    
    public func clearLogs(){
        // remove all from core data
    }
    
    
    
    private func getLogMessage(message: String) -> String{
        
        var logMessage = message
        if message.count > 1000{
            logMessage.removeLast(message.count - 1000)
            logMessage.append("...")
        }
        
        return logMessage
    }
    
    private func getLogTimestramp() -> String{
        
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let timestramp = formatter.string(from: date)
        
        return timestramp
    }
    
   
}
