//
//  DataController.swift
//  BookWorm
//
//  Created by Santhosh Srinivas on 02/09/25.
//

import Foundation
import CoreData

class DataController: ObservableObject{
    let container = NSPersistentContainer(name: "Bookworm")
    
    init() {
        container.loadPersistentStores{ description, error in
            if let error = error{
                print("There was an error in CoreData \(error.localizedDescription)")
            }
        }
    }
}
