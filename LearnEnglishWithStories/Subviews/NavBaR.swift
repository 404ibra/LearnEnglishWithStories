//
//  NavBaR.swift
//  LearnEnglishWithStories
//
//  Created by İbrahim Aktaş on 31.05.2023.
//

import SwiftUI

struct NavBaR: View {
    var body: some View {
        VStack{
            Divider()
                .frame(height: 0.2)
        ZStack {
            Rectangle()
                .fill(.white)
                .shadow(color: .black.opacity(0.2), radius: 10, x: 0.0, y: -2)
            HStack{
                    ForEach(Tabs.allCases, id: \.self){tab in
                        Spacer()
                        TabItem(tab: tab)
                        Spacer()
                    }//ForEach
            }//HStack
            .padding(.horizontal,5)
        }//ZStack
        .frame(height: 70)
        .ignoresSafeArea(edges: .bottom)
        }
    }
}

struct NavBaR_Previews: PreviewProvider {
    static var previews: some View {
        NavBaR()
    }
}
