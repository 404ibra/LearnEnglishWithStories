//
//  StoryScreen.swift
//  LearnEnglishWithStories
//
//  Created by İbrahim Aktaş on 31.05.2023.
//

import SwiftUI
import AVFoundation

var player: AVAudioPlayer!

struct StoryScreen: View {
    @StateObject private var MainVM = MainVievModel()
    @ObservedObject private var ArticleMan = ArticleManager()
    @ObservedObject private var TranslateMan = TranslateManager()
    @Environment(\.presentationMode) var presentationMode
    
    @State var DarkTheme: Bool = false
    @State var NightShift: Bool = false
    @State private var currentPageIndex = 0

    
    var articleIndex: Int
    var articleData: String
    var audioURL: String
    var contentCount: Int
    
    init(articleIndex: Int, articleData: String, contentCount: Int, audioURL: String) {
            self.articleIndex = articleIndex
            self.articleData = articleData
            self.contentCount = contentCount
            self.audioURL = audioURL
        }

    
    var body: some View {
        VStack{
            //Learning Language
            ZStack(alignment: .topLeading){
                Rectangle()
                    .frame(height: 140)
                    .foregroundColor(.mainlightblue)
                    .ignoresSafeArea()
                HStack{
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "chevron.backward")
                    }//Button
                    .padding(.horizontal, 16)

                }
            }
            
            HStack{
                Text(articleData)
                    .font(.system(size: 17.5, weight: .semibold, design: .rounded))
                    .foregroundColor(.mainorange)
                Spacer()
                Image(systemName: "gear")
                    .font(.system(size: 15, weight: .light, design: .rounded))
                    .foregroundColor(.gray)
                    .clipShape(Circle())
            }
            .padding(.horizontal, 16)
            
                ScrollView {
                        StoryView(words: ArticleMan.getContent(for: currentPageIndex, storyIndex: articleIndex))
                }
                .frame(height: 240)
            
            Divider()
                .padding(.vertical,15)
        
            
            //Main Language
            ScrollView {
                StoryView(words: TranslateMan.getTranslate(for: currentPageIndex, storyIndex: articleIndex))
            }
            .frame(height: 240)
            
            Spacer()
            
            PlayBackControlButtons(backpage: {
                if currentPageIndex > 0 {
                    currentPageIndex -= 1
                } else {
                    print("önceki sayfa mevcut deil")
                }
            }, nextpage: {
                if currentPageIndex >= 0 && currentPageIndex < Story.stories[0].content.count {
                    currentPageIndex += 1
                }else {
                 //   return
                }
            },
               contentCount: contentCount,
               audioURL: audioURL)
            .padding(.vertical, 16)
            .padding(.horizontal, 16)
                

            
        }//VStack
        .navigationBarBackButtonHidden(true)
 
    }
}








/*    StoryView(words: ArticleMan.getContent(for: currentPageIndex, storyIndex: storiesIndex))
    Divider()
    StoryView(words: TranslateMan.getTranslate(for: currentPageIndex, storyIndex: storiesIndex))*/




/*Ωstruct StoryScreen_Previews: PreviewProvider {
    static var previews: some View {
        StoryScreen(storiesIndex: 1)
    }
}*/

/*
 
 func playSound(status: Bool) {
     let url = Bundle.main.url(forResource: "1_1", withExtension: "mp3")
     //DO neveer if url is empty
     guard url != nil else {
         return
     }
     do{
         player = try AVAudioPlayer(contentsOf: url!)
         if status {
             player?.play()
         } else {
             player?.stop()
         }
     } catch {
         print("err")
     }
 }


 
 
 
 */
