//
//  VocabuleryBoxes.swift
//  LearnEnglishWithStories
//
//  Created by İbrahim Aktaş on 13.06.2023.
//

import SwiftUI

struct VocabuleryBoxes: View {
    let geometry = UIScreen.main.bounds
    let savingWord: String
    
  
    
    var body: some View {
      
            ZStack(alignment: .top){
                ZStack(alignment: .topLeading){
                    Rectangle()
                        .foregroundColor(.white)
                        .cornerRadius(15)
                        .shadow(color: .black.opacity(0.3), radius: 2, x: 0, y: 3)
                        .shadow(color: .black.opacity(0.1), radius: 2, x: 0, y: -2)
                        .alignH(alignment: .center)
                    Image(systemName: "xmark.circle")
                        .resizable()
                        .frame(width: 18, height: 18)
                        .foregroundColor(.red)
                        .padding(.leading, -6)
                        .padding(.top, -4 )
                }
                .frame(width: geometry.size.width * 0.8, height: 120)
                VStack{
                    Text(savingWord)
                        .padding(.top, 6)
                    Divider()
                        .frame(width: geometry.size.width * 0.8)
                        .alignH(alignment: .center)
                    Text("Sarnıç")
                    Divider()
                        .frame(width: geometry.size.width * 0.8)
                    HStack{
                        HStack{
                            Image(systemName: "waveform")
                            Text("Dinle")
                        }
                        Spacer()
                        HStack{
                            Image(systemName: "flag")
                            Text("Diğerleri")
                        }
                    }
                    
                    .padding(.horizontal, 32)
                    .frame(width: geometry.size.width * 0.8)
                    
                }
            }
            .padding(.vertical, 16)
        
    }
}

/*
struct VocabuleryBoxes_Previews: PreviewProvider {
    static var previews: some View {
        VocabuleryBoxes()
    }
}
*/
