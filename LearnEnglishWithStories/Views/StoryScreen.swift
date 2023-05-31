//
//  StoryScreen.swift
//  LearnEnglishWithStories
//
//  Created by İbrahim Aktaş on 31.05.2023.
//

import SwiftUI

struct StoryScreen: View {
    @State var DarkTheme: Bool = false

    var body: some View {
        VStack{
            HStack{
                Spacer()
                Image(systemName: DarkTheme ? "moon" : "moon.fill")
                    .onTapGesture {
                        DarkTheme.toggle()
                }
                Image(systemName: "list.bullet")
                Image(systemName: "book")
            }
            .padding(.horizontal, 16)
            .padding(.top, 32)
            .padding(.bottom, 16)
            
            //HStack
            StoryView()
            Spacer()
        }//VStack
    }
}

struct StoryScreen_Previews: PreviewProvider {
    static var previews: some View {
        StoryScreen()
    }
}
