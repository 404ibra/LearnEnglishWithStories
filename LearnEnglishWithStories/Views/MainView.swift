//
//  MainView.swift
//  LearnEnglishWithStories
//
//  Created by İbrahim Aktaş on 31.05.2023.
//

import SwiftUI

struct MainView: View {
    @State var SelectedTab : Int = 0
    var body: some View {
   
            VStack(alignment: .center, spacing: 0){
                ScrollView{
                    PageHeader(PageName: "Kütüphanem")
                    FeaturedView(HeadlineText: "Seriler")
                        .padding(.bottom,25)
                    FeaturedView(HeadlineText: "En Günceller")
                    //FeaturedView.v2 --film dialogları, şarkı sözleri gibi
                    DialogsFeatured(HeadlineText: "Diyaloglar")
                        .padding(.top,10)
                  
                }//ScrollVeiw
          
              
                //TabView
            }
        
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.black)
            .padding(.top, 0)
            .ignoresSafeArea()
        
            //VStack
  
        
        }
    
    
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}


