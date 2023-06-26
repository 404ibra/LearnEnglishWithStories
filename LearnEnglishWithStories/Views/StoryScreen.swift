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
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.colorScheme) var colorScheme
    
    @ObservedObject private var ArticleMan = ArticleManager()
    @ObservedObject private var TranslateMan = TranslateManager()
    @ObservedObject private var SoundVM: SoundManager
    
    @StateObject private var MainVM = MainVievModel()
 
    
    @State private var pageSettings = false
    @State private var currentPageIndex = 0
    @State private var localURL: URL?

    let article: Article
    let geometry = UIScreen.main.bounds
    
    var articleIndex: Int

    var audioURL: String

    var downloadingProcess: Bool
    
    init(articleIndex: Int, audioURL: String, downloadingProcess: Bool, article: Article) {
        self.articleIndex = articleIndex

        self.audioURL = audioURL
        self.article = article

        
        //SONRADAN EKLEMNDİ
        self.SoundVM = SoundManager()
        /*if !audioURL.isEmpty {
               SoundVM.downloadAndPlay(from: audioURL)
           }*/
        self.downloadingProcess = downloadingProcess

    }
    
    
    
    
    var body: some View {
        
        ZStack{
            VStack{
                ZStack(alignment: .topLeading){
                    Rectangle()
                        .frame(height: 100)
                        .foregroundColor(colorScheme == .dark
                                         ? .maindarkblue
                                         : .white
                        )
                        .ignoresSafeArea()
                    VStack{
                        HStack{
                            Image(systemName: "arrow.backward.circle")
                                .resizable()
                                .frame(height: 30)
                                .frame(width: 30)
                                .foregroundColor(Color(hex: "fa6c38"))
                                .onTapGesture {
                                    presentationMode.wrappedValue.dismiss()
                                }
                            
                            Spacer()
                            
                            
                            Button {
                                //TO DO
                            } label: {
                                Text("Sayfa Ayarları")
                                    .font(.system(size: 18, weight: .semibold, design: .rounded))
                                    .foregroundColor(Color(hex: "fa6c38"))
                                    .onTapGesture {
                                        self.pageSettings = true
                                    }
                            }
                        }
                        
                        HStack{
                            Text(article.name)
                                .font(.system(size: 20, weight: .medium, design: .rounded))
                                .foregroundColor(.mainorange)
                            Text("(Ortalama 15 dakika)")
                                .font(.system(size: 14.5, weight: .light, design: .rounded))
                                .foregroundColor(.gray.opacity(0.8))
                                .padding(.leading,15)
                        }
                        .alignH(alignment: .leading)
                        .padding(.top, 25)
                        
                    }
                    .padding(.horizontal, 24)
                    .padding(.top, 30)
                }

                //Learning Language
                ScrollView {
                    StoryView(words: ArticleMan.getContent(for: currentPageIndex, storyIndex: articleIndex), isTranslate: false)
                }
                .frame(height: geometry.size.height/4)
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
                    if currentPageIndex > 0 {
                        currentPageIndex -= 1
                    } else {
                        print("önceki sayfa mevcut deil")
                    }
                }, nextpage: {
                    if currentPageIndex >= 0 && currentPageIndex < Story.stories[0].content.count {
                        currentPageIndex += 1
                        print()
                    }else {
                        //   return
                    }
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
            }
            
            
        
            
            
        }//Page big zstack
        .navigationBarBackButtonHidden(true)
        .onAppear{
            SoundVM.downloadAndPlay(from: article.sounds[currentPageIndex]) {
                print("local url onappearda \(SoundVM.localURL)")
            }
              
            
        }
        .onChange(of: currentPageIndex) { newValue in
            print("\(newValue) sayfa indexi")
            SoundVM.downloadAndPlay(from: article.sounds[newValue]){
                
            }
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
