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
    @ObservedObject private var ArticleVM = ArticleViewModel()
    @ObservedObject private var ArticleMan = ArticleManager()
    @ObservedObject private var TranslateMan = TranslateManager()
    @ObservedObject private var SoundVM: SoundManager
   
    @StateObject private var MainVM = MainVievModel()
 
    @State private var pageSettings = false
    @State private var currentPageIndex = 0

    var article: Article
    let geometry = UIScreen.main.bounds
     var articleIndex: Int

    init(articleIndex: Int, article: Article) {
        self.articleIndex = articleIndex
        self.article = article
        self.SoundVM = SoundManager()
        SoundVM.downloadAndPlay(from: article.sounds[currentPageIndex])
       
    }
    

    var body: some View {
        
        ZStack{
            VStack(spacing: 0){
               // ArticleHeadline(articleName: article.name)
                /*VStack{
                    HStack {
                        Button {
                            
                        } label: {
                            Image(systemName: "chevron.left")
                                .foregroundColor(.black)
                    }
                        
                        Spacer()
                        Button {
                            //TO DO
                        } label: {
                            Text("Sayfa Ayarları")
                                .font(.system(size: 18, weight: .semibold, design: .rounded))
                                .foregroundColor(Color(hex: "fa6c38"))
                                .onTapGesture {
                                    //self.pageSettings = true
                                }
                        }

                    }.padding(.horizontal, 16)

                }
                 */
                //Learning Language
           
                ScrollView {
                    
                    StoryView(words: ArticleMan.getContent(for: currentPageIndex, storyIndex: articleIndex), isTranslate: false)
                        
                       
                }.frame(width:geometry.width, height: MainVM.learningLanguageExpand ?  geometry.height
                        / 1.3 : geometry.height / 2.4 )
                Button {
                    MainVM.learningLanguageExpand.toggle()
                } label: {
                    if MainVM.learningLanguageExpand {
                        IconLaballedDivider(iconName: "chevron.up.square")
                       
                    } else {
                        IconLaballedDivider(iconName: "chevron.down.square")
                    }
                }.padding(.vertical, 0)
       
               
                if MainVM.learningLanguageExpand {
                    
                } else {
                    ScrollView {
                        StoryView(words: TranslateMan.getTranslate(for: currentPageIndex, storyIndex: articleIndex), isTranslate: true)
                           
                           
                    } .frame(width:geometry.width, height: 230)
                }
       
                Divider()
                    .padding(.top,12)
                
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
                .padding(.bottom, 6)
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
        .toolbar(.hidden, for: .tabBar)
        .navigationBarBackButtonHidden(true)
        .toolbar() {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    
                 presentationMode.wrappedValue.dismiss()
                } label: {
                   
                        Image(systemName: "chevron.left")
                            .foregroundColor(.black)
                    
                }

            }
            ToolbarItem(placement: .navigationBarTrailing) {
               
                Button {
                    //TO DO
                } label: {
                    Text("Sayfa Ayarları")
                        .font(.system(size: 18, weight: .semibold, design: .rounded))
                        .foregroundColor(.gray.opacity(0.6))
                        .onTapGesture {
                            //self.pageSettings = true
                        }
                }

            }
        }
       
       
     /*   .onAppear{
          
            SoundVM.downloadAndPlay(from: article.sounds[currentPageIndex])

        }*/
        
        
        
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

