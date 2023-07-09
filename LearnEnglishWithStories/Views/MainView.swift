//
//  MainView.swift
//  LearnEnglishWithStories
//
//  Created by İbrahim Aktaş on 31.05.2023.
//

import SwiftUI



struct MainView: View {
    
    @EnvironmentObject private var AuthVM: AuthViewModel
    @StateObject private var MainVM = MainVievModel()
 //   @ObservedObject private var ArchiveVM = ArchiveViewModel()
    @State private var isShow: Bool = true
  

    @State var SelectedTab : Int = 0

  
    
    let geometry = UIScreen.main.bounds
  
    var body: some View { 
       
        NavigationStack{
            
      
            ZStack(alignment: .bottom){
                ScrollView(showsIndicators: false){
                    VStack(spacing: 0){
                        
                      
                     ReadNow()

                      
                        
                        FeaturedView(HeadlineText: "Seviyenize Göre")
                           
                            .padding(.bottom,12)
                        Divider()
                        LastlyAddedView(HeadlineText: "En Günceller")
                            .padding(.bottom,20)
                        Divider()
                        FeaturedPopularView(HeadlineText: "Son Zamanlarda Popüler")
                            .padding(.bottom,12)
                        Divider()
                        FeaturedNewsiew(HeadlineText: "Haberler")
                            .padding(.bottom,12)
                        Spacer()
                    }
                    .padding(.top,12)
                    
                 
                    
                }
                if AuthVM.currentUser?.isPremium == false {
                    ZStack{
                        Rectangle()
                            .frame(width: geometry.width, height: 25)
                            .foregroundColor(.maindarkblue)
                        Text("Kesintisiz Okumak İçin Şimdi Premium Ol")
                            .font(.system(size: 16, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                    }
                }
                
            }
         
            .fullScreenCover(isPresented: $isShow) {
                        PaywallView()
 }
            
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(hex: "f4f2f7"))

       
            
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




struct Title: View {
    var body: some View {
        HStack{
            Text("Şimdi Oku")
                .font(.system(.title))
                .bold()
                .foregroundColor(.white)
            Spacer()
            Image(systemName: "plus")
                .font(.system(size: 12))
                .foregroundColor(.white)
                .frame(width: 24, height: 24)
                .background(
                    Circle()
                        .foregroundColor(.gray.opacity(0.6))
                )
            Image(systemName: "magnifyingglass.circle")
                .font(.system(size: 24, weight: .light))
                .foregroundColor(.white)
            
        }   .padding(.horizontal, 16)
            .padding(.vertical,48)
    }
}



struct BackTitle: View {
    var body: some View {
        HStack{
           Image(systemName: "chevron.left")
                .font(.system(.title))
                .bold()
                .foregroundColor(.white)
            Spacer()
            Image(systemName: "plus")
                .font(.system(size: 12))
                .foregroundColor(.white)
                .frame(width: 24, height: 24)
                .background(
                    Circle()
                        .foregroundColor(.gray.opacity(0.6))
                )
         
            
        }  
       
    }
}
