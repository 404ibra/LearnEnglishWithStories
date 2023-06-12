//
//  LevelBar.swift
//  LearnEnglishWithStories
//
//  Created by İbrahim Aktaş on 12.06.2023.
//

import SwiftUI

struct LevelBar: View {
    var body: some View {
        VStack{
            Text("Seviyeniz")
                .ProfileOptionButtonTextFont()
                .alignH(alignment: .leading)
                .padding(.horizontal, 16)
            //TO DO:  hikaye okundukça ve sorular çözüldükçe seviye artacak
            GeometryReader { geometry in
                Rectangle()
                    .frame(height: 15)
                    .frame(width: geometry.size.width * 0.8)
                    .foregroundColor(.gray.opacity(0.2))
                    .cornerRadius(7.5)
                    .shadow(color: .black.opacity(0.2), radius: 3, x: 0, y: 5)
                    .alignH(alignment: .center) // View'a yazdığım extension ile yaptım bu extension sayesinde scrollview içinde align yapabiliyorum horziontal için
            }//Geoemtry Reader
        }//VStack
    }
}

struct LevelBar_Previews: PreviewProvider {
    static var previews: some View {
        LevelBar()
    }
}
