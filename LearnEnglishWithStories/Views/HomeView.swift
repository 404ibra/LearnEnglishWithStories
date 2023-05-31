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
        
        VStack {
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
                    
                        
                 Spacer()
                    
                    
                        Divider()
                            .frame(height: 1.5)
                  
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
   
  

struct TabItem: View {
    let tab: Tabs
    var body: some View {
        Image(systemName: tab.rawValue)
            .imageScale(.large)
          
    }
}
