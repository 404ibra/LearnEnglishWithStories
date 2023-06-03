//
//  HomePage.swift
//  LearnEnglishWithStories
//
//  Created by İbrahim Aktaş on 11.05.2023.
//

import SwiftUI

struct FeatuderImages: View {
    
  
    var body: some View {
        let size = UIScreen.main.bounds
        ScrollView(.horizontal, showsIndicators:  false) {
            HStack{
                ForEach(0..<3) { index in
                    ZStack(alignment: .bottom){
                        Image("featured_img_\(index)")
                            .resizable()
                            .frame(height: size.height/4.2)
                            .frame(width: size.width/1.8)
                            .cornerRadius(12)
                            .padding(.trailing, 6)
                        ZStack(alignment: .center){
                            Rectangle()
                                .frame(height: size.height / 12)
                                .frame(width: size.width/1.8)
                                .padding(.trailing, 6)
                            .foregroundColor(.indigo.opacity(0.5))
                            Text("ABD'yi keşfedin")
                                .font(.system(size: 18, weight: .bold, design: .rounded))
                                .foregroundColor(.white)
                        }
                        
                            
                    }
                }
            }.padding(.leading, 16)
                
            //Hstack
        }//scrollview
      
        }//View
    }


struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        FeatuderImages()
    }
}
