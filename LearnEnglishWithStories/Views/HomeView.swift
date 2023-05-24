//
//  HomeView.swift
//  LearnEnglishWithStories
//
//  Created by İbrahim Aktaş on 14.05.2023.
//

import SwiftUI

struct HomeView: View {
    @State var SelectedTab : Int = 0
   
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false){
            VStack(alignment: .leading, spacing: 0) {
                HStack{
                    Text("Uzay ve Bilim")
                        .font(.system(size: 24, weight: .bold))
                    
                    Spacer()
                    Text("4 tane daha")
                        .font(.system(size: 13, weight: .regular))
                    Image(systemName: "arrow.right")
                        .foregroundColor(.blue)
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                //HStack
                
                    
                FeatuderImages()
               Text("Öne Çıkarılan Konular")
                    .font(.system(size: 24, weight: .semibold, design: .rounded))
                    .padding(.horizontal,16)
                    .padding(.vertical, 14)
                    
                ZStack(alignment: .bottom){
                    Image("space_img")
                        .resizable()
                        .cornerRadius(10)
                        .frame(height: UIScreen.main.bounds.height/2)
                        .scaledToFit()
                        .padding(.horizontal, 8)
                    Text("SPACE")
                        .tracking(5)
                        .font(.system(size:60, weight: .semibold, design: .rounded))
                        .foregroundColor(.white)
                        .padding(.bottom, 5)
                }//ZStack
                
                  
            }//VStack
            .ignoresSafeArea(edges: .top)
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
   
  
