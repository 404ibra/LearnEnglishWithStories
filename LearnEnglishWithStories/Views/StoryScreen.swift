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
                
                
                StoryView()
                StoryView()
            }
            .frame(height: 550)
            .padding(.bottom, 24)
            .background(
                NightShift ?
                Color(hex: "#E0C9A6")
                : .white
            )
            
     
            PlayBackControlButtons()//HStack
            Slider(value: $timing, in: 0...60)
                .accentColor(Color(hex: "0d4e89"))
                .padding(.horizontal, 32)
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
        StoryScreen()
    }
}

