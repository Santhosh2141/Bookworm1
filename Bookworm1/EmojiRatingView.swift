//
//  EmojiRatingView.swift
//  Bookworm1
//
//  Created by Santhosh Srinivas on 03/09/25.
//

import SwiftUI

struct EmojiRatingView: View {
    
    let rating: Int16
    
    var body: some View {
        switch rating{
        case 1:
            return Text("😞")
        case 2:
            return Text("🙂")
        case 3:
            return Text("☺️")
        case 4:
            return Text("😍")
        case 5:
            return Text("🤩")
        default:
            return Text("No rating")
        }
    }
}

struct EmojiRatingView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiRatingView(rating: 3)
    }
}
