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
            List{
                ForEach(books){ book in
                    NavigationLink{
                        DetailView(book: book)
                    } label: {
                        HStack{
                            EmojiRatingView(rating: book.rating)
                                .font(.largeTitle)
                            VStack(alignment: .leading){
                                Text(book.title ?? "Unkown Book")
                                    .font(.headline)
                                Text(book.author ?? "Unkown Author")
                                    .foregroundColor(.secondary )
                            }
                        }
                    }
                    
                }
            }
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
