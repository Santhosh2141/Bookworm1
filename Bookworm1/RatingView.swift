//
//  RatingView.swift
//  Bookworm1
//
//  Created by Santhosh Srinivas on 03/09/25.
//

import SwiftUI

struct RatingView: View {
    
    @Binding var rating: Int
    var label = ""
    var maxRating = 5
    var offImage: Image?
    var onImage = Image(systemName: "star.fill")
    var offColor = Color.gray
    var onColor = Color.yellow
    
    var body: some View {
        HStack{
            if label.isEmpty == false{
                Text(label)
            }
            
//            were assigning the number we tap to the rating that is given. if this number tapped is 4
            // for 1<=4, on color and we give image
            // same for 2,3,4. for 5, it goes to offcolor
            ForEach(1..<maxRating+1, id: \.self){ number in
                image(for: number)
                    .foregroundColor(number <= rating ? onColor : offColor)
                    .onTapGesture {
                        rating = number
                    }
            }
        }
    }
    func image(for number: Int) -> Image{
        if number > rating {
            return offImage ?? onImage
        } else{
            return onImage
        }
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: .constant(4))
    }
}
