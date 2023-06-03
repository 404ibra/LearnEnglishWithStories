//
//  MainView.swift
//  LearnEnglishWithStories
//
//  Created by İbrahim Aktaş on 31.05.2023.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        VStack(alignment: .center){
           //Background Color
        
            HStack {
                Text("Seriler")
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                .foregroundColor(.white)
                Spacer()
                HStack{
                    Text("Tümünü gör")
                        .font(.system(size: 15, weight: .medium, design: .rounded))
                    .foregroundColor(.white)
                    Image(systemName: "arrow.right")
                        .foregroundColor(.white)
                }
                
            }
            .padding(.horizontal, 16)
            
                
            FeatuderImages()
            Spacer()
            NavBar()
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.black)
        //VStack
    }
    
    
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
