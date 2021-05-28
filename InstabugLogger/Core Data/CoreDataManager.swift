//
//  CoreDataManager.swift
//  InstabugLogger
//
//  Created by Hala on 26/05/2021.
//

import Foundation
import UIKit
import CoreData
 

struct CoreDataManager {
    
    // singletone
    static var instance = CoreDataManager()
    
    // framework bundle identifier
    let identifier: String = Constants.identifier
    // core data name
    let moduleName: String = Constants.moduleName
    
    
    lazy var modelURl: URL? = {
        
        let instabugLoggerBundle = Bundle(identifier: self.identifier)
        let modelUrl = instabugLoggerBundle!.url(forResource: self.moduleName, withExtension: "momd")
        return modelUrl
        
    }()
        
    
    // MARK : persistentContainer
    lazy var persistentContainer: NSPersistentContainer = {
        
        let managedObjectModel = NSManagedObjectModel(contentsOf: modelURl!)!
        
        let container = NSPersistentContainer(name: self.moduleName, managedObjectModel: managedObjectModel)
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        
        return container
    }()
    
    
    
    mutating func saveNewLogToLogger(entityName: String, loggerData: LoggerModel){
        
        let context = persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Logger", in: context)
        let entityRow = NSManagedObject(entity: entity!, insertInto: context)
        
        
        let fetchedLoggerData = fetchAllLogsFromLogger(entityName: Constants.loggerEntity)
        
        if fetchedLoggerData.count > 5{
            deleteLogAt(index: 0, dataDeletedArray: fetchedLoggerData)
        }
        
        entityRow.setValue(loggerData.message, forKey: Constants.message)
        entityRow.setValue(loggerData.level.rawValue, forKey: Constants.level)
        entityRow.setValue(loggerData.timestamp, forKey: Constants.timestamp)
        
        
        do{
            try context.save()
            print("Data added successfully")
        }catch let error as NSError{
            print(error)
        }
        
    }
    
    
    mutating func fetchAllLogsFromLogger(entityName: String) -> [Logger]{
        
        let context = persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: entityName)
        
        var fetchedDataArray = [Logger]()
        
        do{
            fetchedDataArray = try context.fetch(fetchRequest) as! [Logger]
            
        }catch let error as NSError{
            print(error)
        }
        
        return fetchedDataArray
    }
    
    
    mutating func clearLogs(entityName: String){
        
        let context = persistentContainer.viewContext
        
        var dataDeletedArray = fetchAllLogsFromLogger(entityName: entityName)
                
        for object in dataDeletedArray{
            context.delete(object)
        }
        
        
        dataDeletedArray.removeAll()
        
        do{
            try context.save()
            print("Data deleted successfully")
        }catch let error as NSError{
            print(error)
        }
        
    }
    
    
    mutating func deleteLogAt(index: Int, dataDeletedArray : [Logger]){

            let context = persistentContainer.viewContext
            context.delete(dataDeletedArray[index])

            do{
                try context.save()

                print("Data deleted successfully")
            }catch let error as NSError{
                print(error)
            }
        }
  
}

