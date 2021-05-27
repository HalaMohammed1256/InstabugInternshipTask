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

        let modelURL: URL?

        let messageKitBundle = Bundle(identifier: self.identifier)
        do{
            modelURL = messageKitBundle!.url(forResource: self.model, withExtension: "momd")
        }catch let error as NSError{
            print(error.localizedDescription)
        }

        let managedObjectModel =  NSManagedObjectModel(contentsOf: modelURL!)


        let container = NSPersistentContainer(name: self.model, managedObjectModel: managedObjectModel!)
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
     
    
//    lazy var persistentContainer: NSPersistentContainer = {
//
//        let container = NSPersistentContainer(name: "InstabugInternshipTask")
//        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
//            if let error = error as NSError? {
//
//                fatalError("Unresolved error \(error), \(error.userInfo)")
//            }
//        })
//        return container
//    }()
//
//    // MARK: - Core Data Saving support
//
//    mutating func saveContext () {
//        let context = persistentContainer.viewContext
//        if context.hasChanges {
//            do {
//                try context.save()
//            } catch {
//
//                let nserror = error as NSError
//                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
//            }
//        }
//    }
    
    
    
    mutating func saveToCoreData(entityName: String, loggerData: LoggerModel){

        let context = persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Logger", in: context)
        let entityRow = NSManagedObject(entity: entity!, insertInto: context)
        
        
        entityRow.setValue(loggerData.message, forKey: Constants.message)
        entityRow.setValue(loggerData.message, forKey: Constants.level)
        entityRow.setValue(loggerData.message, forKey: Constants.timestamp)
        
                
        do{
            try context.save()
            print("Data added successfully")
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

