//
//  StoryPreviewHeader.swift
//  LearnEnglishWithStories
//
//  Created by İbrahim Aktaş on 8.06.2023.
//

import SwiftUI

struct StoryPreviewHeader: View {
    var PageName: String
    
    @StateObject private var MainVM = MainVievModel()
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.colorScheme) var colorScheme
    
    @Binding var isActiveted: Bool
    
    var body: some View {

        ZStack(alignment: .topLeading){
            ZStack(alignment: .bottomLeading){
                Rectangle()
                    .frame(height: 160)
                    .foregroundColor(colorScheme == .dark
                                        ? Color(hex: "#184b74")
                                        : .white)
                HStack{
                    Text(PageName)
                        .font(.system(size: 28, weight: .bold ,design: .rounded))
                        
                    Spacer()

                }//HStack
                .padding(.leading, 16)
                .padding(.trailing,16)
                
            }//ZStack
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
                    isActiveted = true
           //         rectangleIsShown = false
                    
                    //MainVM.readButton = true
                } label: {
                    Text("Okumaya Başla")
                        .font(.system(size: 18, weight: .semibold, design: .rounded))
                        .foregroundColor(Color(hex: "fa6c38"))
                        
                }

              
                 //   .navigationDestination(isPresented: $MainVM.readButton) {
                   //     StoryScreen(storiesIndex: 0)
                    }
            .padding(.horizontal, 24)
            .padding(.top, 60)
           
            }//HStack
         
      
               
        }//ZStack
        
    }
//}

 

struct StoryPreviewHeader_Previews: PreviewProvider {
    static var previews: some View {
        StoryPreviewHeader(PageName: "İstanbul'u Keşfediyoruz", isActiveted:.constant(true))
    }
}
