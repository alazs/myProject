//
//  favoritesCoreData.swift
//  test
//
//  Created by Hackeru_Student on 7/13/18.
//  Copyright © 2018 Hackeru_Student. All rights reserved.
//

import Foundation
import CoreData
import UIKit
//saving the favorites bessnises by core data

class favoritesCoreData
{
    
    
    
    //referance to appdelegate in order to work with core data cuse in app delegate there iss method of coreData
     //NSMangerObjectContext :- give all the view into the database delet,update... all hapen thrwa NSManger
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    //saving the business in core data
    public func saveFavorites(busiFavName : String , busiFavLink : String)
    {
         //create new entitiy
        let newFavorite = NSEntityDescription.insertNewObject(forEntityName: "Favorites", into: managedObjectContext)
        
        //assigning the link as value
        newFavorite.setValue(busiFavLink, forKey: "business")
        
        
        do
        {
            //saving the data thrw  manger object context
            try managedObjectContext.save()
            print("fav save ")
            
        }
        catch let error
        {
            print("favoritesCoreData :  \(error.localizedDescription)")
        }
    
    }
    
    //retrive data
    public func retriveData() -> Array<String>
    {
        var favoritesBui = [String]()
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Favorites")
        print("retrive data")
        fetchRequest.returnsObjectsAsFaults = false
        
        
        do
        {
            //
            let record = try managedObjectContext.fetch(fetchRequest)
            
                for myRecords in record as! [NSManagedObject]
                {

                    let mybi = myRecords.value(forKey: "business") as? String
                    favoritesBui.append( mybi!)
                    print(mybi!)
                }
            
            print("my fav array : \(favoritesBui)")
        
    }
        catch let error
        {
            print(error)
        }
       
    
    return favoritesBui
}
    
    
    //delet all the data in the entitiy
    public func deletAllEntity()
    {
        let deletFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Favorites")
        
        deletFetch.returnsObjectsAsFaults = false
        
        let deletRequest = NSBatchDeleteRequest(fetchRequest: deletFetch)
        
        
        do{
        
            try managedObjectContext.execute(deletRequest)
            try managedObjectContext.save()
            print("the data in the entitiy is deleted")
        }
        
        catch let error
        {
            print("core data : \(error.localizedDescription)")
        }
        
        
        
    }
    
    //
    public func deletSpcficBi(myDelet : String)
    {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Favorites")
        print("retrive data")
        fetchRequest.returnsObjectsAsFaults = false
        
        do {
            let record  = try managedObjectContext.fetch(fetchRequest)
            
            for myRecords in record as! [NSManagedObject]
            {
                
                let mybi = myRecords.value(forKey: "business") as? String
                print("mydelet coreData = \(myDelet)")
                if mybi! == myDelet
                {
                     print(mybi!)
                    managedObjectContext.delete(myRecords)
                }
                
               
            }
            
            try managedObjectContext.save()
        }
        catch let error {
            print(error)
        }
        
        
        
        
    }
}
