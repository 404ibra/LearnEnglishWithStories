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
    
    @ObservedObject private var ArticleMan = ArticleManager()
    @ObservedObject private var TranslateMan = TranslateManager()
    @ObservedObject private var SoundVM: SoundManager
    
    @StateObject private var MainVM = MainVievModel()
 
    @State private var pageSettings = false
    @State private var currentPageIndex = 0

    let article: Article
    let geometry = UIScreen.main.bounds
    var articleIndex: Int

    init(articleIndex: Int, article: Article) {
        self.articleIndex = articleIndex
        self.article = article
        self.SoundVM = SoundManager()
    }
    

    var body: some View {
        
        ZStack{
            VStack{
                ArticleHeadline(articleName: article.name)

                //Learning Language
                ScrollView {
                    StoryView(words: ArticleMan.getContent(for: currentPageIndex, storyIndex: articleIndex), isTranslate: false)
                }
                .frame(height: MainVM.learningLanguageExpand  ? geometry.size.height/2 : geometry.size.height/4)
               Divider()
                    .padding(.vertical,15)
                
                //Main Language
                ScrollView {
                    StoryView(words: TranslateMan.getTranslate(for: currentPageIndex, storyIndex: articleIndex), isTranslate: true)
                }
                .frame(height: geometry.size.height/4)
                Divider()
                    .padding(.top,20)
                
                Spacer()
                
                PlayBackControlButtons(backpage: {
                    if currentPageIndex > 0  {
                        currentPageIndex -= 1
                    } else {
                        print("önceki sayfa mevcut deil")
                    }
                }, nextpage: {
                    if currentPageIndex >= 0 && currentPageIndex < article.content.count - 1 {
                        currentPageIndex += 1
                    }else { return }
                    //TO DO ARTİCLE BİTTİ TEBRİKLERSSS DİALOGU
                },
                  contentCount: article.content.count,
                  currentPageIndex: currentPageIndex,
                  audioURL: SoundVM.localURL
                )
                .padding(.vertical, 16)
                .padding(.horizontal, 16)
            }//Page big VStack
            .blur(radius: SoundVM.isDownloading ? 3.2 : 0)
            
            //PageConditions
            if pageSettings {
                PageSettingsDialogView(isActivated: $pageSettings)
                    .padding(.horizontal, 16)
            }
            if SoundVM.isDownloading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .mainorange))
            }
            
            
        
            
            
        }//Page big zstack
        .navigationBarBackButtonHidden(true)
        .onAppear{
            SoundVM.downloadAndPlay(from: article.sounds[currentPageIndex])
                
            
              
            
        }
        .onChange(of: currentPageIndex) { newValue in
            print("\(newValue) sayfa indexi")
            print(currentPageIndex)
            SoundVM.downloadAndPlay(from: article.sounds[newValue])
                
            
        }
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

