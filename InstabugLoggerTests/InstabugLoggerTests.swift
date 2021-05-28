//
//  InstabugLoggerTests.swift
//  InstabugLoggerTests
//
//  Created by Yosef Hamza on 19/04/2021.
//

import XCTest
import CoreData
@testable import InstabugLogger


class InstabugLoggerTests: XCTestCase {

    var instabugLogger: InstabugLogger?

    
    override func setUpWithError() throws {
        
        try super.setUpWithError()
        instabugLogger = InstabugLogger()
        
    }

    override func tearDownWithError() throws {
        
        instabugLogger = nil
        super.tearDown()
        
    }
    
    
    func testGetLogTimestamp() {
        
        let timestamp = instabugLogger?.getLogTimestamp()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        XCTAssertEqual(timestamp, formatter.string(from: Date()))
        
    }
    
    func testMessageLengthLessThanOrEqual1000() {
        
        let messageAfterCondition = instabugLogger?.getLogMessage(message: "message")
        
        XCTAssertLessThanOrEqual((messageAfterCondition?.count)!, 1000)
        
    }
    
    
    func testClearAllLogsFromCoreData() {
        
        instabugLogger?.clearLogs()
        let logger = instabugLogger?.fetchAllLogs()
                
        XCTAssertEqual((logger?.count)!, 0)
        
    }

    
    func testFetchAllLogs() {
        
        let logger = instabugLogger?.fetchAllLogs()
        XCTAssertGreaterThan((logger?.count)!, 0)
        
    }
    
    
    func testFetchAllLogsWithCompletion() {
        
        instabugLogger?.fetchAllLogs(completionHandler: { (loggers) in
            XCTAssertGreaterThan(loggers.count, 0)
        })
        
    }
    
    
    func testLog() {
        
        let loggerModel = LoggerModel(message: "New Element", level: .debug, timestamp: (instabugLogger?.getLogTimestamp())!)
        
        instabugLogger?.log(level: loggerModel.level, message: loggerModel.message)
        let loggers = instabugLogger?.fetchAllLogs()
        
//        XCTAssertTrue(loggers?.contains(// logger model))
        
    }
    

}
