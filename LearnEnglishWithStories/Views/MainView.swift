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
         
            ScrollView(showsIndicators: false){
                    VStack(spacing: 0){
                        ReadNow()
                            
                            
                                              /*
                        if AuthVM.userSession != nil && ((AuthVM.currentUser?.lastStories) != nil) {

                        }*/

                    FeaturedView(HeadlineText: "Seviyenize Göre")
                        .padding(.bottom,12)
                        
                    Divider()
                    LastlyAddedView(HeadlineText: "En Günceller")
                    }
                    .padding(.top,12)
                     
       
                     Divider()
                       FeaturedNewsiew(HeadlineText: "Haberler")
                            .padding(.bottom,12)
                        
                  
                    
                    //ScrollVeiw
                    //TabView
              
                }
            
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(hex: "f4f2f7"))
    
            .ignoresSafeArea()
            //VStack
           // .navigationTitle("Şimdi Oku")
          //  .navigationBarTitleDisplayMode(.inline)
            .toolbar  {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("Şimdi Oku")
                        .font(.system(.title))
                        .bold()
                        .foregroundColor(.white)

                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        //
                    } label: {
                        HStack{
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
                        }.padding(.horizontal, 16)
                    }

                }
            }
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
