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
                        Text("Konular")
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
