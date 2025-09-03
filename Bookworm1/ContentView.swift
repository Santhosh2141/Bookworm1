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
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\.title),
//        SortDescriptor(\.title, order: .reverse)
        SortDescriptor(\.author)
    ]) var books: FetchedResults<Book>
    
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
                    .listRowBackground(Int(book.rating) == 1 ? Color.red : .white)
                    .foregroundColor(Int(book.rating) == 1 ? Color.white : .secondary)
                }
                .onDelete(perform: deleteBook)
                .listStyle(.plain)
            }
            .navigationTitle("BookWorm")
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading){
                    EditButton()
                }
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
    
    func deleteBook(for offsets: IndexSet){
        for offset in offsets{
            let book = books[offset]
            moc.delete(book)
        }
        try? moc.save()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
