//
//  MainView.swift
//  LearnEnglishWithStories
//
//  Created by İbrahim Aktaş on 31.05.2023.
//

import SwiftUI

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject private var AuthVM: AuthViewModel
    @StateObject private var MainVM = MainVievModel()
    @ObservedObject private var ArchiveVM = ArchiveViewModel()

    @State var SelectedTab : Int = 0
    let geometry = UIScreen.main.bounds
    var body: some View {
       
        NavigationStack{
         
                ScrollView{
                    VStack(spacing: 0){
                        ReadNow()
                                              /*
                        if AuthVM.userSession != nil && ((AuthVM.currentUser?.lastStories) != nil) {

                        }*/

                    FeaturedView(HeadlineText: "Seviyenize Göre")
                        .padding(.bottom,12)
                     
       
                     Divider()
                       FeaturedNewsiew(HeadlineText: "Haberler")
                            .padding(.bottom,12)
                        
                        
                    Divider()
                    LastlyAddedView(HeadlineText: "En Günceller")
                    }
                    .padding(.top,12)
                    .padding(.bottom, 60)
                    
                    //ScrollVeiw
                    //TabView
              
                }
            
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(hex: "f4f2f7"))
    
            .ignoresSafeArea()
            //VStack
            .navigationBarTitle("Şimdi Oku", displayMode: .inline)
         
                
        }//NavigationStack
      
        .modifier(ViewStatusHiddenModifier())

    }

}


struct ViewStatusHiddenModifier: ViewModifier {
    @ViewBuilder //return etkisi yaratıyor
    func body(content: Content) -> some View {
        if #available(iOS 16.0, *){
            content.toolbar(.hidden, for: .automatic)
        }else {
            content.navigationBarHidden(true)
        }
    }
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}



