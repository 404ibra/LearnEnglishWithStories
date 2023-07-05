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
    @ObservedObject private var ArchiveVM = ArchiveViewModel()
    
    @State private var translateDialog: Bool = false
    @State private var selectedWord: String?
    
     var mean = "MeanTürkçe"
    
    var isTranslate: Bool
    var words: [String]
    
    let geometry = UIScreen.main.bounds
    let maxCharactersPerLine = 38

    init(words: [String], isTranslate: Bool) {
        
            self.words = words
            self.isTranslate = isTranslate
       
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
            ZStack(alignment: .topTrailing) {
                VStack(alignment: .leading, spacing: 10) {
                    
                    ForEach(lines.indices, id: \.self) { lineIndex in
                        HStack(spacing: 5) {
                            ForEach(lines[lineIndex], id: \.self) { word in
                                if !isTranslate{
                                    Text(word)
                                        .font(.system(size: 19, weight: .medium, design: .rounded))
                                        .onLongPressGesture(minimumDuration: 0.6) {
                                            
                                            translateDialog = true
                                            // telefonu titretmesi için yazdığım kod
                                            let impactMed = UIImpactFeedbackGenerator(style: .heavy)
                                            impactMed.impactOccurred()
                                            // check true
                                            MainVM.isLongPressWord = true
                                            selectedWord = word
                                        }
                                        .sheet(isPresented: $translateDialog) {
                                            VStack{
                                                Text(selectedWord!)
                                                Divider()
                                                    
                                                Text("Anlam")
                                                Divider()
                                                    
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
                                                    Button {
                                                        //TO DO
                                                        ArchiveVM.addNewWord(main: selectedWord ?? "", learn: mean )
                                                    } label: {
                                                        HStack{
                                                            Image(systemName: "bookmark")
                                                            Text("Kaydet")
                                                        }.foregroundColor(.black)
                                                    }

                                                }
                                                .padding(.horizontal, 32)
                                                .padding(.vertical, 8)
                                                .frame(width: geometry.size.width * 0.8)
                                            }
                                            .presentationDetents([.fraction(0.23)])
                                            .presentationDragIndicator(.visible)
                                        }
                                }
                                else {
                                    Text(word)
                                        .font(.system(size: 19, weight: .medium, design: .rounded))
                                }
                            }
                        }
                    }
                }
                .padding()
              

            }
        }       }
}


/*struct StoryView_Previews: PreviewProvider {
   
    static var previews: some View {
        StoryView(words: ArticleVM.getContent(for: 0, storyIndex: 1))
    }
}*/


/*
 
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
 
 
 
 */
