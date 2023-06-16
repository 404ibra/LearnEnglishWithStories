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
    
    @State var DarkTheme: Bool = false
    @State var NightShift: Bool = false
    @State private var timing: Double = 0.0
    @State private var currentPageIndex = 0
    
    let storiesIndex: Int
    
     var StoryScreenVM = StoryScreenViewModel.self
    
    init(storiesIndex: Int) {
            self.storiesIndex = storiesIndex
        }

    var body: some View {
        VStack{
            ScrollView(showsIndicators: false) {
                HStack{
                  
                    Spacer()
                    Image(systemName: DarkTheme ? "moon" : "moon.fill")
                        .onTapGesture {
                            DarkTheme.toggle()
                            NightShift.toggle()
                    }
                    Image(systemName: "list.bullet")
                    Image(systemName: "book")
                }
                .padding(.horizontal, 16)
                .padding(.top, 65)
                .padding(.bottom, 16)
                //HStack
                
                
                StoryView(words: StoryScreenVM.getWords(for: currentPageIndex, storiesIndex: 1))
                Divider()
                StoryView(words: StoryScreenVM.getTranslateWords(for: currentPageIndex, storiesIndex: 1))
             //   Story.stories[0].translate[1].components(separatedBy: " ")
            }
            .frame(height: 600)
            .padding(.bottom, 24)
            .background(
                NightShift ?
                Color(hex: "#E0C9A6")
                : .white
            )
            
            Spacer()
            PlayBackControlButtons {
                if currentPageIndex > 0 {
                    currentPageIndex -= 1
                } else {
                    print("önceki sayfa mevcut deil")
                }
            } nextpage: {
                if currentPageIndex >= 0 && currentPageIndex < Story.stories[0].content.count {
                    currentPageIndex += 1
                }else {
                    print("ileri sayfa yok ki")
                }
            }

//HStack
            VStack{
                Slider(value: $timing, in: 0...60)
                    .accentColor(Color(hex: "0d4e89"))
                    .padding(.horizontal, 32)
                HStack{
                    Text("0:00")
                        .font(.system(size: 14, design: .rounded))
                        .foregroundColor(.gray)
                    Spacer()
                    Text("1:13")
                        .font(.system(size: 14, design: .rounded))
                        .foregroundColor(.gray)
                }//HStack
                .padding(.horizontal, 40)
            }
            Spacer()
            
            
        }//VStack
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            NightShift ?
            Color(hex: "#E0C9A6") : .white)
        .padding(.top, 0)
        .ignoresSafeArea()
 
    }
}


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





struct StoryScreen_Previews: PreviewProvider {
    static var previews: some View {
        StoryScreen(storiesIndex: 0)
    }
}

