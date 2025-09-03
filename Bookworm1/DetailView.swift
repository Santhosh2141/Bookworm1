//
//  DetailView.swift
//  Bookworm1
//
//  Created by Santhosh Srinivas on 03/09/25.
//

import SwiftUI

struct DetailView: View {
    let book: Book
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    @State private var showDeleteAlert = false
//    var completedDate = ""
    var body: some View {
        ScrollView{
            ZStack(alignment: .bottomTrailing){
                Image(book.genre ?? "Fantasy")
                    .resizable()
                    .scaledToFit()
                Text(book.genre?.uppercased() ?? "FANTASY")
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(8)
                    .foregroundColor(.white)
                    .background(.black)
                    .opacity(0.5)
                    .clipShape(Capsule())
                    .offset(x: -5,y: -5)
            }
            Text(book.author ?? "Unkown Author")
                .font(.title)
                .foregroundColor(.secondary)
            // doing this because its and optional
            if let date = book.dateAdded {
                Text("Date Read: \(date.formatted(date: .abbreviated, time: .shortened))")
                    .padding()
                    .font(.caption)
            } else {
                Text("Date Read: Unknown")
                    .padding()
                    .font(.caption)
            }
            Text(book.review ?? "No Review")
                .padding()
            RatingView(rating: .constant(Int(book.rating)))
                .font(.largeTitle)
        }
        .navigationTitle(book.title ?? "Unkown Title")
        .navigationBarTitleDisplayMode(.inline)
        .alert("Delete the Book?", isPresented: $showDeleteAlert){
            Button("Delete", role: .destructive, action: deleteBook)
            Button("Cancel", role: .cancel){ }
        } message: {
            Text("Are you sure you want to delete this book")
        }
        .toolbar{
            Button{
                showDeleteAlert = true
            } label: {
                Label("Delete this book", systemImage: "trash")
            }
        }
    }
    
    func deleteBook(){
        moc.delete(book)
        try? moc.save()
        dismiss()
    }
}

//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView()
//    }
//}
