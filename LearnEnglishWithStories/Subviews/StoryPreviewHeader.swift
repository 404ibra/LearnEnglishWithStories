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
    var body: some View {

        ZStack(alignment: .topLeading){
            ZStack(alignment: .bottomLeading){
                Rectangle()
                    .frame(height: 160)
                    .foregroundColor(Color(hex: "#184b74"))
                HStack{
                    Text(PageName)
                        .font(.system(size: 28, weight: .bold ,design: .rounded))
                        .foregroundColor(.white)
                    Spacer()

                }//HStack
                .padding(.leading, 16)
                .padding(.trailing,16)
                .padding(.bottom, 32)
            }//ZStack
            HStack{
                Image(systemName: "arrow.backward.circle")
                    .resizable()
                    .frame(height: 30)
                    .frame(width: 30)
                    .foregroundColor(.orange)
                    .onTapGesture {
                        print("sad")
                        presentationMode.wrappedValue.dismiss()
                    }
                
                Spacer()
                Text("Favorilerime Ekle")
                    .font(.system(size: 18, weight: .semibold, design: .rounded))
                    .foregroundColor(.orange)
            }//HStack
            .padding(.horizontal, 24)
            .padding(.top, 56)
            .padding(.bottom, 12)
               
        }//ZStack
        
    }
}

 

struct StoryPreviewHeader_Previews: PreviewProvider {
    static var previews: some View {
        StoryPreviewHeader(PageName: "İstanbul'u Keşfediyoruz")
    }
}
