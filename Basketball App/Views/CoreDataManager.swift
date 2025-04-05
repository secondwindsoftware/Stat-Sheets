//
//  CoreDataManager.swift
//  Basketball App
//
//  Created by Len Springs
//

import Foundation
import CoreData

class CoreDataManager {
    
    static let sharedManager = CoreDataManager()
    private init() {}
    
    lazy var persistentContainer: NSPersistentContainer = {
      
      let container = NSPersistentContainer(name: "Model")
      container.loadPersistentStores(completionHandler: { (storeDescription, error) in
        if let error = error as NSError? {
          fatalError("Unresolved error \(error), \(error.userInfo)")
        }
      })
      return container
    }()
    
    func saveContext () {
      let context = CoreDataManager.sharedManager.persistentContainer.viewContext
      if context.hasChanges {
        do {
          try context.save()
        } catch {
          let nserror = error as NSError
          fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
      }
    }
    
    func fetchData( ) -> [[PlayerModelClass]] {
        var arrGetTest = [[PlayerModelClass]]()
        let context = CoreDataManager.sharedManager.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Player")
        fetchRequest.returnsObjectsAsFaults = false
        do {
            let results = try context.fetch(fetchRequest)
            let  dateCreated = results as! [Player]
            for _datecreated in dateCreated {
                var newSets = [PlayerModelClass]()
                if _datecreated.data != nil {
                    do{
                        if let valSet = NSKeyedUnarchiver.unarchiveObject(with: _datecreated.data!) as? [PlayerModelClass] {
                            print(valSet)
                            newSets.append(contentsOf: valSet)
                        }
                    }
                    arrGetTest.append(newSets)
                }
            }
        }catch let err as NSError {
            print(err.debugDescription)
        }
        return arrGetTest
    }
    
    func insertPlayer(data : Any) -> GetPlayer? {
        let managedContext = CoreDataManager.sharedManager.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Player",in: managedContext)!
        let test = NSManagedObject(entity: entity,insertInto: managedContext)
        
        test.setValue(data, forKey: "data")
        
        do {
          try managedContext.save()
          return test as? GetPlayer
        } catch let error as NSError {
          print("Could not save. \(error), \(error.userInfo)")
          return nil
        }
    }
    
    func deleteAllTest() -> Bool {
        let managedContext = CoreDataManager.sharedManager.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Player")
        do {
            let item = try managedContext.fetch(fetchRequest)
            for i in item {
                managedContext.delete(i)
                try managedContext.save()
            }
            return true
            
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
            return false
        }
    }
}
