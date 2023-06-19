//
//  PlaybackControlButtons.swift
//  LearnEnglishWithStories
//
//  Created by İbrahim Aktaş on 13.06.2023.
//

import SwiftUI
import AVFoundation


struct PlayBackControlButtons: View {
    @StateObject private var MainVM = MainVievModel()
    @StateObject private var SoundVM = SoundManager()

    

    
    let backpage: () -> Void
    let nextpage: () -> Void
    
    let audioURL: String
    
    init(backpage: @escaping () -> Void, nextpage: @escaping () -> Void, audioURL: String) {
        self.backpage = backpage
        self.nextpage = nextpage
        self.audioURL = audioURL
    }
   
    var body: some View {
        HStack{
            Image(systemName: "arrow.backward")
                .foregroundColor(Color(hex: "1a659e"))
                .padding(.horizontal, 16)
                .padding(.top, 16)
                .onTapGesture {
                    backpage()
                }
            Go10SecButton(buttonaction: {
           
            }, iconname: "gobackward.10")
            Button {
                MainVM.playbutton.toggle()
                //playSound(status: MainVM.playbutton)
                SoundVM.downloadAndPlay(audio: audioURL, stopButton: MainVM.playbutton)
                 
               
            } label: {
                ZStack{
                    Circle()
                        .frame(height: 55)
                        .foregroundColor(.gray.opacity(0.15))
                    withAnimation {
                        MainVM.playbutton == false
                        ? Image(systemName: "play.fill")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(Color(hex: "fa6b35"))
                        : Image(systemName: "stop.fill")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(Color(hex: "fa6b35"))
                    }
                    
                }
            }//Button finish with label
            .padding(.horizontal,8)
            Go10SecButton(buttonaction: {
                
            }, iconname: "goforward.10")
            Image(systemName: "arrow.forward")
                .foregroundColor(Color(hex: "1a659e"))
                .padding(.horizontal, 16)
                .padding(.top, 16)
                .onTapGesture {
                    nextpage()
                }
        }//HStack
    }
}

struct Go10SecButton: View {
    let buttonaction: () -> Void
    let iconname: String
    var body: some View {
        Button {
            buttonaction()
        } label: {
            Image(systemName: iconname)
                .resizable()
                .frame(width: 24, height: 28)
                .foregroundColor(Color(hex: "0d4e89"))
        }.padding(.top, 6)
    }
}




