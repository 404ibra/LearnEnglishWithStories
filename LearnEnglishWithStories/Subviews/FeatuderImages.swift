//
//  HomePage.swift
//  LearnEnglishWithStories
//
//  Created by İbrahim Aktaş on 11.05.2023.
//

import SwiftUI

struct FeatuderImages: View {
    
  
    var body: some View {
        var size = UIScreen.main.bounds
        ScrollView(.horizontal, showsIndicators:  false) {
            HStack{
                ForEach(0..<3) { index in
                    Image("featured_img_\(index)")
                        .resizable()
                        .frame(height: size.height/3.4)
                         .frame(width: size.width/2.25)
                        .cornerRadius(15)
                        .padding(.leading, 16)
                }
            }//Hstack
        }//scrollview
        }//View
    }


struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        FeatuderImages()
    }
}
