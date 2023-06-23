//
//  AuthHeader.swift
//  LearnEnglishWithStories
//
//  Created by İbrahim Aktaş on 22.06.2023.
//

import SwiftUI




struct AuthHeader: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.colorScheme) var colorScheme
    
    @StateObject private var MainVM = MainVievModel()
    
    @Binding var isActiveted: Bool
    
    var PageName: String
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
                    Image(systemName: "questionmark")
                        .foregroundColor(.mainorange)
                        
                }

              
                 //   .navigationDestination(isPresented: $MainVM.readButton) {
                   //     StoryScreen(storiesIndex: 0)
                    }
            .padding(.horizontal, 24)
            .padding(.top, 60)
           
            }//HStack
         
      
               
        }//ZStack
        
    }

struct AuthHeader_Previews: PreviewProvider {
    static var previews: some View {
        AuthHeader(isActiveted: .constant(false), PageName: "Hoş Geldin")
    }
}
