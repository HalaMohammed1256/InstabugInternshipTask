//
//  CoreDataManagerTest.swift
//  InstabugLoggerTests
//
//  Created by Hala on 28/05/2021.
//

import XCTest
import CoreData

@testable import InstabugLogger


class CoreDataManagerTest: XCTestCase {

    var coreDataManager: CoreDataManager?
    
    override func setUpWithError() throws {
        
        try super.setUpWithError()
        coreDataManager = CoreDataManager()
        
    }

    override func tearDownWithError() throws {

        coreDataManager = nil
        super.tearDown()

    }
    
    func testModelURl() {
        let modelURl = coreDataManager?.modelURl
        XCTAssertNotNil(modelURl)
        
    }

    func testSaveNewLogToLogger() {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let loggerModel = LoggerModel(message: "New Element", level: .debug, timestamp: formatter.string(from: Date()))
        
        coreDataManager?.saveNewLogToLogger(entityName: Constants.loggerEntity, loggerData: loggerModel)
        
        let loggers = coreDataManager?.fetchAllLogsFromLogger(entityName: Constants.loggerEntity)
        

        XCTAssertNotNil(loggers)
    }
    
    
    func testFetchAllLogsFromLogger() {
        
        let loggers = coreDataManager?.fetchAllLogsFromLogger(entityName: Constants.loggerEntity)
        
        XCTAssertNotNil(loggers)
        
    }
    
    
    func testClearLogs() {
        
        coreDataManager?.clearLogs(entityName: Constants.loggerEntity)
        let logger = coreDataManager?.fetchAllLogsFromLogger(entityName: Constants.loggerEntity)
                
        XCTAssertEqual((logger?.count)!, 0)
    }
    
    
    func testDeleteLogAtIndex() {
        
        let loggers = coreDataManager?.fetchAllLogsFromLogger(entityName: Constants.loggerEntity)
        XCTAssertNotNil(loggers)
        
        let loggersCountBeforeDelete = loggers?.count
        
        coreDataManager?.deleteLogAt(index: 0, dataDeletedArray: loggers!)
        XCTAssertEqual(loggers?.count, loggersCountBeforeDelete! - 1)
        
    }


}
