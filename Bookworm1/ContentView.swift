//
//  ContentView.swift
//  Bookworm1
//
//  Created by Santhosh Srinivas on 02/09/25.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    // storing it here so that it can be used later
    @FetchRequest(sortDescriptors: []) var books: FetchedResults<Book>
    
    @State private var showingAddScreen = false
    var body: some View {
        NavigationView{
            Text("Count: \(books.count)")
                .navigationTitle("BookWorm")
                .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing){
                        Button{
                            showingAddScreen.toggle()
                        } label: {
                            Label("Add Book", systemImage: "plus")
                        }
                    }
                }
                .sheet(isPresented: $showingAddScreen){
                    AddBookView()
                }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
