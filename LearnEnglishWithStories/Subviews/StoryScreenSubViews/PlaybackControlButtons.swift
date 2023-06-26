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
    
    let audioURL: URL?
    let contentCount: Int
    let currentPageIndex: Int

    
    let geometry = UIScreen.main.bounds
    
    init(backpage: @escaping () -> Void, nextpage: @escaping () -> Void, contentCount: Int, currentPageIndex: Int, audioURL: URL?) {
        self.backpage = backpage
        self.nextpage = nextpage
        self.contentCount = contentCount
        self.audioURL = audioURL
        self.currentPageIndex = currentPageIndex


    }
    
    var body: some View {
        ZStack{
            HStack{
                Button {
                    MainVM.playbutton.toggle()
                  if audioURL != nil {
                        print("localden geliyor artık")
                     SoundVM.playAfterDownload(localurl: audioURL!, isStop: MainVM.playbutton)
                 } else { print("ne oluyi") }
                } label: {
                    ZStack{
                        Circle()
                            .frame(height: 50)
                            .foregroundColor(.gray.opacity(0.15))
                        withAnimation {
                            MainVM.playbutton == false
                            ? Image(systemName: "play.fill")
                                .resizable()
                                .frame(width: 13, height: 13)
                                .foregroundColor(Color(hex: "fa6b35"))
                            : Image(systemName: "stop.fill")
                                .resizable()
                                .frame(width: 13, height: 13)
                                .foregroundColor(Color(hex: "fa6b35"))
                        }
                        .padding(.all, 8)
                        
                    }
                }//Button finish with label
                .padding(.horizontal,8)
                

                HStack{
                    ForEach(0...contentCount-1, id:\.self){i in
                        Rectangle()
                            .frame(width: geometry.size.width * 0.45/CGFloat(contentCount), height: 4)
                            .foregroundColor(
                                currentPageIndex == i
                                ? .mainorange.opacity(0.7)
                                : .gray.opacity(0.5)
                            )
                            .padding(.trailing, 4)
                            .animation(.spring(), value: currentPageIndex)
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



