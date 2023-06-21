//
//  StoryView.swift
//  LearnEnglishWithStories
//
//  Created by İbrahim Aktaş on 30.05.2023.
//

import SwiftUI
import AVFoundation

let synthesizer = AVSpeechSynthesizer()

struct StoryView: View {
    @StateObject private var MainVM = MainVievModel()
    
    
    @State private var selectedWord: String?
    
    
    let geometry = UIScreen.main.bounds
    let maxCharactersPerLine = 35
    var words: [String]

 
    init(words: [String]) {
            self.words = words
        }


    
    var body: some View {
        var lines: [[String]] = []
        var currentLine: [String] = []
        var lineLength = 0
        
        
 
            
      
            for word in words {
                let wordLength = word.count
                if lineLength + wordLength > maxCharactersPerLine {
                    lines.append(currentLine)
                    currentLine = [word]
                    lineLength = wordLength + 1 // +1 for space
                } else {
                    currentLine.append(word)
                    lineLength += wordLength + 1 // +1 for space
                }
            }
        
        
        
        if !currentLine.isEmpty {
            lines.append(currentLine)
        }
        
        return ZStack{
            VStack(alignment: .leading, spacing: 10) {
                ForEach(lines.indices, id: \.self) { lineIndex in
                    HStack(spacing: 5) {
                        ForEach(lines[lineIndex], id: \.self) { word in
                            Text(word)
                                .font(.system(size: 19, weight: .medium, design: .rounded))
                                .onLongPressGesture(minimumDuration: 0.6) {
                                    
                                    // telefonu titretmesi için yazdığım kod
                                    let impactMed = UIImpactFeedbackGenerator(style: .heavy)
                                    impactMed.impactOccurred()
                                    // check true
                                    MainVM.isLongPressWord = true
                                    selectedWord = word
                                    
                                }
                                
                        }
                    }
                }
            }
            .padding()
            if MainVM.isLongPressWord && selectedWord != nil {
              //  GeometryReader { geometry in
                    ZStack{
                        ZStack(alignment: .topLeading) {
                            Rectangle()
                                .frame(width: geometry.size.width * 0.8, height: 150)
                                .foregroundColor(.white)
                                .cornerRadius(15)
                                .shadow(color: .black.opacity(0.3), radius: 2, x: 0, y: 3)
                                .shadow(color: .black.opacity(0.1), radius: 2, x: 0, y: -2)
                                .alignH(alignment: .center)
                                .alignV(alignment: .center)
                            Image(systemName: "xmark.circle")
                                .resizable()
                                .frame(width: 18, height: 18)
                                .foregroundColor(.red)
                                .padding(.leading, 4)
                                .padding(.top, 2 )
                                .onTapGesture {
                                    MainVM.isLongPressWord = false
                                }
                        }
                        .frame(width: geometry.size.width * 0.8, height: 120)
                        VStack{
                            Text(selectedWord!)
                            Divider()
                                .frame(width:geometry.size.width * 0.8 )
                            Text("Anlam")
                            Divider()
                                .frame(width:geometry.size.width * 0.8 )
                            HStack{
                                HStack{
                                    Image(systemName: "waveform")
                                    Text("Dinle")
                                }.onTapGesture {
                                    
                                    let uttarance = AVSpeechUtterance(string: selectedWord ?? "")
                                    uttarance.voice = AVSpeechSynthesisVoice(language: "en-US")
                                    uttarance.rate = 0.45
                                    synthesizer.speak(uttarance)
                                }
                                Spacer()
                                HStack{
                                    Image(systemName: "bookmark")
                                    Text("Kaydet")
                                }
                            }
                                .padding(.horizontal, 32)
                                .padding(.vertical, 8)
                                .frame(width: geometry.size.width * 0.8)
                        }//VStack
                    }//ZStack
             //   }//GeoReader
            
              } else {
                  //Bir sorun oluştu snackbarı eklenebilir
              }
        }
    }
}


/*struct StoryView_Previews: PreviewProvider {
   
    static var previews: some View {
        StoryView(words: ArticleVM.getContent(for: 0, storyIndex: 1))
    }
}*/


