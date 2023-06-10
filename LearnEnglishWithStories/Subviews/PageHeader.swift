//
//  PageHeader.swift
//  LearnEnglishWithStories
//
//  Created by İbrahim Aktaş on 8.06.2023.
//

import SwiftUI

struct PageHeader: View {
    @State private var isSearchVisible = false
    @State private var searchText = ""
    @Environment(\.colorScheme) var colorScheme
    var PageName: String
    
    var body: some View {
        ZStack(alignment: .bottomLeading){
            Rectangle()
                .frame(height: 140)
                .foregroundColor(colorScheme == .dark
                                 ? Color(hex: "#184b74")
                                 : .white
                )
            HStack{
                isSearchVisible ? nil :  Text(PageName)
                    .font(.system(size: 28, weight: .bold ,design: .rounded))
                    .transition(.slide)
                    .modifier(TextFieldAnimation.ViewAnimationModifier(value: isSearchVisible))
                Spacer()
                Button {
                    isSearchVisible.toggle()
                } label: {
             isSearchVisible ?  Image(systemName:       "chevron.backward.circle")
                         .font(.system(size: 36, weight: .light))
                         .foregroundColor(Color(hex: "fa6c38"))
                    : Image(systemName: "magnifyingglass.circle")
                        .font(.system(size: 36, weight: .light))
                        .foregroundColor(Color(hex: "fa6c38"))
                }
                if isSearchVisible {
                    TextField("Ne okumak istersiniz", text: $searchText)
                        .font(.system(size: 16, weight: .semibold, design: .rounded))
                        .foregroundColor(.red)
                        .padding()
                        .transition(.move(edge: .trailing))
                        .modifier(TextFieldAnimation.ViewAnimationModifier(value: isSearchVisible))
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
        PageHeader(PageName: "Kütüphanem")
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
