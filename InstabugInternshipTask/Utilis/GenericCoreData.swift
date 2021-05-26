//
//  GenericCoreData.swift
//  InstabugInternshipTask
//
//  Created by Hala on 26/05/2021.
//


import Foundation
import UIKit
import CoreData


class CoreDataBuilder {
    
    
    class func saveToCoreData(entityName: String, dataArray: [Any], KeysArray: [String]){

        let delegate = UIApplication.shared.delegate as! AppDelegate
        let context = delegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: entityName, in: context)
        let entityRow = NSManagedObject(entity: entity!, insertInto: context)
        
        for i in 0..<dataArray.count{
            entityRow.setValue(dataArray[i], forKey: KeysArray[i])
        }
                
        do{
            try context.save()
            print("Data added successfully")
        }catch let error as NSError{
            print(error)
        }
        
        delegate.saveContext()
    }
    
    
    class func fetchFromCoreData(view: SuperView, fetchedDataArray : inout [NSManagedObject], entityName: String) {
        
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let context = delegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: entityName)
        
        do{
            fetchedDataArray = try context.fetch(fetchRequest)
            view.reloadData()
            
        }catch let error as NSError{
            print(error)
        }

        
    }
    

    class func deleteCoreData(view: SuperView, dataDeletedArray : inout [NSManagedObject]){
        
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let context = delegate.persistentContainer.viewContext
        
        for object in dataDeletedArray{
            context.delete(object)
        }
        
        dataDeletedArray.removeAll()
                
        do{
            try context.save()
            view.reloadData()
            
            print("Data deleted successfully")
        }catch let error as NSError{
            print(error)
        }
        delegate.saveContext()
    }
    
    
    class func deletefromCoreData(index: Int, view: SuperView, dataDeletedArray : inout [NSManagedObject]){
        
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let context = delegate.persistentContainer.viewContext
        context.delete(dataDeletedArray[index])
        dataDeletedArray.remove(at: index)
        
        do{
            try context.save()
            view.reloadData()
            
            print("Data deleted successfully")
        }catch let error as NSError{
            print(error)
        }
        delegate.saveContext()
    }
    
}


