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
    
    var body: some View {
       
        NavigationStack{
            VStack(alignment: .leading, spacing: 0){
               // PageHeader(PageName: "Kütüphanem", searchicon: true)
               //
          
                   
                if MainVM.isSearchVisible == true {
                    ScrollView{
                        
                    }
                }

                else{
                    ScrollView{
                        ZStack(alignment: .topLeading){
                            ReadNow()
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
                             
                                
                                      
                                   
                            } .padding(.horizontal, 16)
                                .padding(.vertical,48)
                                   
                        }
                        if AuthVM.userSession != nil && ((AuthVM.currentUser?.lastStories) != nil) {
                            /*
                           ForEach((AuthVM.currentUser?.lastStories!)! , id:\.self){documentID in
                                NavigationLink(destination: StoryPreview(lastArticles: documentID)) {
                                    ContinueSection(documentID: documentID)
                                                .padding(.top,16)
                             }
                           }*/
                        }
                            else {
                                ZStack(alignment: .bottomLeading){
                                    Rectangle()
                                        .frame(height: 230)
                                        .frame(width: UIScreen.main.bounds.width * 0.9)
                                        .cornerRadius(12)
                                        .foregroundColor(.mainlightblue.opacity(0.6))
                                        .redacted(reason: .placeholder)
                                    
                                    Rectangle()
                                        .foregroundColor(.red.opacity(0.8))
                                        .frame(height: 30)
                                        .frame(width: UIScreen.main.bounds.width * 0.9)
                                        .roundedCornerRectangle(radius: 12, corners: [.bottomLeft, .bottomRight])
                                    
                                    Text("Brush: Learning")
                                        .font(.system(size: 18, weight: .semibold, design: .rounded))
                                        .foregroundColor(.white)
                                        .padding(.horizontal, 8)
                                        .padding(.bottom, 5)
                                        .redacted(reason: .placeholder)
                                }
                                .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 2)
                            }
                        
    
                      /*  Button {
                            ArchiveVM.addNewWord()
                        } label: {
                            Text("Bana gıykla")
                        }*/


                    FeaturedView(HeadlineText: "Seviyenize Göre")
                        .padding(.bottom,25)
                        .padding(.top, 12)
                        
                    
                     Divider()
                       FeaturedNewsiew(HeadlineText: "Haberler")
                        
                        
                    Divider()
                    LastlyAddedView(HeadlineText: "En Günceller")
                    }
                    .padding(.bottom, 60)
                    
                    //ScrollVeiw
                    //TabView
                }
            }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(hex: "f4f2f7"))
            .padding(.top, 0)
            .ignoresSafeArea()
            //VStack
                
        }
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


