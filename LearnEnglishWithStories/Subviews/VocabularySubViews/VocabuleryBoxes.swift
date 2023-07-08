//
//  VocabuleryBoxes.swift
//  LearnEnglishWithStories
//
//  Created by İbrahim Aktaş on 13.06.2023.
//

import SwiftUI
import AVFoundation




struct VocabuleryBoxes: View {
    
    @ObservedObject private var archiveVM = ArchiveViewModel()
    
    let synthesizer = AVSpeechSynthesizer()
    let geometry = UIScreen.main.bounds
    let savingWord: String
    
  
    
    var body: some View {
        ZStack(alignment: .topTrailing){
            ZStack(alignment: .leading){
                Rectangle()
                    .cornerRadius(8)
                    .foregroundColor(.white)
                    .shadow(color: .black.opacity(0.5), radius: 5, x: 0, y: 2)
                VStack(alignment: .leading){
                        HStack(alignment: .center){
                            Button(action: {
                                let uttarance = AVSpeechUtterance(string: savingWord)
                                uttarance.voice = AVSpeechSynthesisVoice(language: "en-US")
                                uttarance.rate = 0.45
                                synthesizer.speak(uttarance)
                            }, label: {
                                Image(systemName: "waveform.circle")
                                    .font(.system(size: 23))
                                    .foregroundColor(.maindarkblue)
                                    .padding(.top, 5)
                                
                            })
                               
                            Text(savingWord)
                                .font(.system(size: 22, weight: .semibold, design: .serif))
                                .foregroundColor(.mainlightblue)
                                .padding(.top, 6)
                        }.padding(.horizontal, 24)
                       
                        Text("Sarnıç")
                        .font(.system(size: 15, weight: .regular))
                            .italic()
                            .padding(.top, 6)
                            .padding(.leading, 60)
                    Rectangle()
                        .frame(width: 110, height: 0.8)
                        .padding(.top,24)
                        .roundedCornerRectangle(radius: 8, corners: [.topRight, .bottomRight])
                    }

            } .frame(width: geometry.width * 0.85, height: geometry.width * 0.38)
            
            Button {
                archiveVM.removeWord(main: savingWord, learn: "MeanTürkçe")

            } label: {
                Image(systemName: "xmark.circle")
                    .padding(.all, 8)
                    .foregroundColor(.red)
                    .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 2)
            }

            
        }
           
        
    }
}

/*
struct VocabuleryBoxes_Previews: PreviewProvider {
    static var previews: some View {
        VocabuleryBoxes(savingWord: "Astronaut")
    }
}*/

/*
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
 
 
 
 */
