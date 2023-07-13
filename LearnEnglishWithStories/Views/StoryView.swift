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
                            //BURADA  .indicies koyma sebebim id'de yaşanan problem bu sekilde cozuldu ogren
                            ForEach(lines[lineIndex].indices, id: \.self) { wordIndex in
                                let word = lines[lineIndex][wordIndex]
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
                                            VStack(alignment: .leading){
                                                HStack{
                                                    Image(systemName: "rectangle.portrait.on.rectangle.portrait")
                                                        .foregroundColor(.mainorange)
                                                        .padding(.horizontal, 16)
                                                        .padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8))
                                                        .background(
                                                            Circle()
                                                                .strokeBorder(Color.gray, lineWidth: 0.2)
                                                              
                                                            
                                                        )
                                                        .padding(.trailing, 8 )
                                                    Image(systemName: "rectangle.stack")
                                                        .foregroundColor(.mainorange)
                                                        .padding(.horizontal, 16)
                                                        .padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8))
                                                        .background(
                                                            Circle()
                                                                .strokeBorder(Color.gray, lineWidth: 0.2)
                                                                 
                                                            
                                                        )
                                                }.padding(.horizontal, 16)
                                                Text(selectedWord!)
                                                    .font(.system(size: 23, weight: .semibold, design: .rounded))
                                                    .foregroundColor(Color(hex: "6a95a3"))
                                                    .padding(.horizontal, 16)
                                                    
                                              
                                                    
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
                                                     
                                                        let impactMed = UIImpactFeedbackGenerator(style: .heavy)
                                                        impactMed.impactOccurred()
                                                        ArchiveVM.addNewWord(main: selectedWord ?? "", learn: mean )
                                                        translateDialog = false
                                               
                                                        
                                                    } label: {
                                                        HStack{
                                                            Image(systemName: "bookmark")
                                                            Text("Kaydet")
                                                        }.foregroundColor(.black)
                                                    }

                                                }
                                              
                                                 Spacer()
                                            }
                                            .presentationDetents([.fraction(0.4)])
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
