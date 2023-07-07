//
//  VocabuleryBoxes.swift
//  LearnEnglishWithStories
//
//  Created by İbrahim Aktaş on 13.06.2023.
//

import SwiftUI

struct VocabuleryBoxes: View {
    
    @ObservedObject private var archiveVM = ArchiveViewModel()
    
    let geometry = UIScreen.main.bounds
    let savingWord: String
    
  
    
    var body: some View {
      
        ZStack(alignment: .center){
                ZStack(alignment: .topLeading){
                    Rectangle()
                        .foregroundColor(.white)
                        .cornerRadius(15)
                        .shadow(color: .black.opacity(0.3), radius: 2, x: 0, y: 3)
                        .shadow(color: .black.opacity(0.1), radius: 2, x: 0, y: -2)
                     
                 Button {
                        archiveVM.removeWord(main: savingWord, learn: "MeanTürkçe")
                    } label: {
                        Image(systemName: "xmark.circle")
                            .resizable()
                            .frame(width: 18, height: 18)
                            .foregroundColor(.red)
                            .padding(.leading, -6)
                            .padding(.top, -4 )
                    }

                }
                .frame(width: geometry.size.width * 0.9, height: 180)
            VStack(alignment: .leading){
                    HStack(alignment: .center){
                        Image(systemName: "waveform.circle")
                            .font(.system(size: 23))
                            .foregroundColor(.maindarkblue)
                            .padding(.top, 5)
                        Text(savingWord)
                            .font(.system(size: 22, weight: .semibold, design: .rounded))
                            .foregroundColor(.mainlightblue)
                            .padding(.top, 6)
                    }
                   
                    Text("Sarnıç")
                        .font(.system(size: 15, weight: .medium, design: .rounded))
                        .padding(.top, 6)
                        .padding(.leading, 32)
                
                       Divider()
                    
                        
                
                    
                }
            .padding(.horizontal, 16)
            .frame(width: geometry.size.width * 0.9, height: 180)
            }
            .padding(.vertical, 16)
           
        
    }
}


struct VocabuleryBoxes_Previews: PreviewProvider {
    static var previews: some View {
        VocabuleryBoxes(savingWord: "Astronaut")
    }
}

