//
//  PageHeader.swift
//  LearnEnglishWithStories
//
//  Created by İbrahim Aktaş on 8.06.2023.
//

import SwiftUI

struct PageHeader: View {
    @StateObject private var MainVM = MainVievModel()
   
    @Environment(\.colorScheme) var colorScheme
    var PageName: String
    var searchicon: Bool
    
    var body: some View {
        ZStack(alignment: .bottomLeading){
            Rectangle()
                .frame(height: 140)
                .foregroundColor(colorScheme == .dark
                                 ? .maindarkblue
                                 : .white
                )
            HStack{
                MainVM.isSearchVisible ? nil :  Text(PageName)
                    .font(.system(size: 28, weight: .bold ,design: .rounded))
                    .transition(.slide)
                    .modifier(TextFieldAnimation.ViewAnimationModifier(value: MainVM.isSearchVisible))
                Spacer()
               searchicon == true
                ? Button {
                    MainVM.isSearchVisible.toggle()
                } label: {
                    MainVM.isSearchVisible ?  Image(systemName: "chevron.backward.circle")
                         .font(.system(size: 24, weight: .light))
                         .foregroundColor(Color(hex: "fa6c38"))
                    : Image(systemName: "magnifyingglass.circle")
                        .font(.system(size: 24, weight: .light))
                        .foregroundColor(Color(hex: "fa6c38"))
                }
                : nil
                if MainVM.isSearchVisible {
                
                    HStack{
                        Image(systemName: "magnifyingglass")
                        TextField("Ne okumak istersiniz", text: $MainVM.searchText)
                            .foregroundColor(.red)
                                .font(.system(size: 16, weight: .semibold, design: .rounded))
                                .padding(.leading, 6)
                        
                                
                    }//HStack
                    .padding(.leading, 4)
                    .padding(.trailing, 24)
                    .padding(.vertical, 8)
                    .background(.gray.opacity(0.10))
                    .cornerRadius(10)
                    .transition(.move(edge: .trailing))
                    .modifier(TextFieldAnimation.ViewAnimationModifier(value: MainVM.isSearchVisible))
                }
            }//HStack
            .padding(.leading, 16)
            .padding(.trailing,16)
            .padding(.bottom, 32)
        }
    }
}

struct PageHeader_Preview: PreviewProvider {
    static var previews: some View {
        PageHeader(PageName: "Kütüphanem", searchicon: false)
    }
}

/*
 
 Text("Keşfet")
     .font(.system(size: 20, weight: .semibold ,design: .rounded))
     .foregroundColor(.orange)
     .padding(.horizontal, 13)
     .padding(.vertical, 6.5)
     .overlay(
         RoundedRectangle(cornerRadius: 10)
             .stroke(.blue, lineWidth: 2)
     )
     .background(
         RoundedRectangle(cornerRadius: 10)
             .fill(Color.clear)
     )
 
 */
