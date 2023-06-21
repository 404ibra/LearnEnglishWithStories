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
    
    @State private var timing: Double = 0.0
    
    
    let backpage: () -> Void
    let nextpage: () -> Void
    
    let audioURL: String
    let contentCount: Int
    
    let geometry = UIScreen.main.bounds
    
    init(backpage: @escaping () -> Void, nextpage: @escaping () -> Void, contentCount: Int, audioURL: String) {
        self.backpage = backpage
        self.nextpage = nextpage
        self.contentCount = contentCount
        self.audioURL = audioURL
    }
    
    var body: some View {
    
            HStack{
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
                
                
                HStack{
                    ForEach(0...contentCount-1, id:\.self){_ in
                        Rectangle()
                            .frame(width: geometry.size.width * 0.5/CGFloat(contentCount), height: 4)
                            .foregroundColor(.gray)
                            .padding(.trailing, 4)
                    }
                    
                }
                
                HStack{
                    Image(systemName: "arrow.backward")
                        .foregroundColor(Color(hex: "1a659e"))
                        .padding(.horizontal, 16)
                        .padding(.top, 16)
                        .onTapGesture {
                            backpage()
                        }
                    
                    
                    Image(systemName: "arrow.forward")
                        .foregroundColor(Color(hex: "1a659e"))
                        .padding(.horizontal, 16)
                        .padding(.top, 16)
                        .onTapGesture {
                            nextpage()
                        }
                }
                .padding(.bottom, 16)
                
                
              
            }//HStack
        }
    
}

/*

//Slider
VStack{
    Slider(value: $timing, in: 0...60)
        .accentColor(Color(hex: "0d4e89"))
        .padding(.horizontal, 32)
    HStack{
        Text("0:00")
            .font(.system(size: 14, design: .rounded))
            .foregroundColor(.gray)
        Spacer()
        Text("-1:13")
            .font(.system(size: 14, design: .rounded))
            .foregroundColor(.gray)
    }//HStack
    .padding(.horizontal, 40)
}



*/



