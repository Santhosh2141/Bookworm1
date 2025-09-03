//
//  AddBookView.swift
//  Bookworm1
//
//  Created by Santhosh Srinivas on 02/09/25.
//

import SwiftUI

struct AddBookView: View {
    @Environment(\.managedObjectContext) var moc
    @State private var title = ""
    @State private var author = ""
    @State private var review = ""
    @State private var genre = ""
    @State private var rating = 3
    
    @Environment(\.dismiss) var dismiss
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("Title", text: $title)
                    TextField("Author", text: $author)
                    
                    Picker("Genre", selection: $genre){
                        ForEach(genres, id: \.self){
                            Text($0)
                        }
                    }
                }
                
                Section{
                    TextEditor(text: $review)
//                    Picker("Rating", selection: $rating){
//                        ForEach(0..<6){
//                            Text(String($0))
//                        }
                        RatingView(rating: $rating)
//                    }
                } header: {
                    Text("Write a review")
                }
                
                Section{
                    Button("Save"){
                        let newBook = Book(context: moc)
                        newBook.id = UUID()
                        newBook.author = author
                        newBook.title = title
                        newBook.genre = genre
                        newBook.rating = Int16(rating)
                        newBook.review = review
                        
                        try? moc.save()
                        dismiss()
                    }
                }
            }
            .navigationTitle("Add Book")
        }
    }
}

struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        AddBookView()
    }
}
