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
    let identifier: String = "com.Instabug.InstabugInternshipTask"
    
    // core data name
    let model: String = "InstabugLoggerCoreData"
    
    // MARK : persistentContainer
    lazy var persistentContainer: NSPersistentContainer = {
        
        let messageKitBundle = Bundle(identifier: self.identifier)
        let modelURL = messageKitBundle!.url(forResource: self.model, withExtension: "momd")
        
        
        let managedObjectModel =  NSManagedObjectModel(contentsOf: modelURL!)
        
        
        let container = NSPersistentContainer(name: self.model, managedObjectModel: managedObjectModel!)
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    
    
    mutating func saveToCoreData(entityName: String, loggerData: LoggerModel){
        
        let context = persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Logger", in: context)
        let entityRow = NSManagedObject(entity: entity!, insertInto: context)
        
        
        let fetchedLoggerData = fetchFromCoreData(entityName: Constants.loggerEntity)
        
        if fetchedLoggerData.count > 5{
            deletefromCoreData(index: 0, dataDeletedArray: fetchedLoggerData)
        }
        
        entityRow.setValue(loggerData.message, forKey: Constants.message)
        entityRow.setValue(loggerData.level.rawValue, forKey: Constants.level)
        entityRow.setValue(loggerData.timeStamp, forKey: Constants.timestamp)
        
        
        
        
        do{
            try context.save()
            print("Data added successfully")
        }catch let error as NSError{
            print(error)
        }
        
    }
    
    
    mutating func fetchFromCoreData(entityName: String) -> [Logger]{
        
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
    
    
    mutating func deleteCoreData(entityName: String){
        
        let context = persistentContainer.viewContext
        
        var dataDeletedArray = fetchFromCoreData(entityName: entityName)
                
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
    
    
    mutating func deletefromCoreData(index: Int, dataDeletedArray : [Logger]){

            let context = persistentContainer.viewContext
            context.delete(dataDeletedArray[index])
//            dataDeletedArray.remove(at: index)

            do{
                try context.save()

                print("Data deleted successfully")
            }catch let error as NSError{
                print(error)
            }
        }
    
    
    //    mutating func saveContext () {
    //        let context = persistentContainer.viewContext
    //        if context.hasChanges {
    //            do {
    //                try context.save()
    //            } catch {
    //                // Replace this implementation with code to handle the error appropriately.
    //                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
    //                let nserror = error as NSError
    //                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
    //            }
    //        }
    //    }
    
}

