//
//  Bookworm1App.swift
//  Bookworm1
//
//  Created by Santhosh Srinivas on 02/09/25.
//

import SwiftUI

@main
struct Bookworm1App: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
