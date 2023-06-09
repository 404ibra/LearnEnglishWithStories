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
    @State var DarkTheme: Bool = false
    @State var NightShift: Bool = false

    var body: some View {
        VStack{
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
            .padding(.top, 32)
            .padding(.bottom, 16)
            //HStack
            StoryView()
            HStack{
                Button {
                        playSound()
                } label: {
                    Image(systemName: "play")
                        .resizable()
                        .frame(height: 35)
                        .frame(width: 35)
                        .foregroundColor(.blue)
                }

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


func playSound() {
    let url = Bundle.main.url(forResource: "1_1", withExtension: "mp3")
    
    //DO neveer if url is empty
    
    guard url != nil else {
        return
    }
    
    do{
        player = try AVAudioPlayer(contentsOf: url!)
        player?.play()
    } catch {
        print("err")
    }
}


struct StoryScreen_Previews: PreviewProvider {
    static var previews: some View {
        StoryScreen()
    }
}
