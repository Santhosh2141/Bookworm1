//
//  DetailView.swift
//  Bookworm1
//
//  Created by Santhosh Srinivas on 03/09/25.
//

import SwiftUI

struct DetailView: View {
    
    let book: Book
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
                    .offset(x: 5,y: 5)
                
            }
            Text(book.author ?? "Unkown Author")
                .font(.title)
                .foregroundColor(.secondary)
            Text(book.review ?? "No Review")
                .padding()
            RatingView(rating: .constant(Int(book.rating)))
                .font(.largeTitle)
        }
        .navigationTitle(book.title ?? "Unkown Title")
        .navigationBarTitleDisplayMode(.inline)
    }
}

//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView()
//    }
//}
