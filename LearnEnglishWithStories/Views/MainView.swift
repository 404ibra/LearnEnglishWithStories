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
    
    @State var SelectedTab : Int = 0
    
    var body: some View {
       
        NavigationStack{
            VStack(alignment: .leading, spacing: 0){
                PageHeader(PageName: "Kütüphanem", searchicon: true)
                if MainVM.isSearchVisible == true {
                    ScrollView{
                        
                    }
                }

                else{
                    ScrollView{
                        if AuthVM.userSession != nil && ((AuthVM.currentUser?.lastStories) != nil) {
                            ForEach((AuthVM.currentUser?.lastStories!)! , id:\.self){documentID in
                                NavigationLink(destination: StoryPreview(lastArticles: documentID)) {
                                    ContinueSection(documentID: documentID)
                                                .padding(.top,16)
                             }
                           }
                        } else {
                            ZStack(alignment: .bottomLeading){
                                Rectangle()
                                    .frame(height: 230)
                                    .frame(width: UIScreen.main.bounds.width * 0.9)
                                    .cornerRadius(12)
                                    .foregroundColor(.mainlightblue.opacity(0.6))
                                    .redacted(reason: .placeholder)
                                
                                Rectangle()
                                    .foregroundColor(.red.opacity(0.8))
                                    .frame(height: 60)
                                    .frame(width: UIScreen.main.bounds.width * 0.9)
                                    .roundedCornerRectangle(radius: 12, corners: [.bottomLeft, .bottomRight])
                                
                                Text("Brush: Learning")
                                    .font(.system(size: 18, weight: .semibold, design: .rounded))
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 8)
                                    .padding(.vertical, 16)
                                    .redacted(reason: .placeholder)
                            }
                            .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 2)
                        }
                        
           
                    Divider()
                        .background(.gray)
                        .padding(.top,10)
                    FeaturedView(HeadlineText: "Seriler")
                        .padding(.bottom,25)
                        .padding(.top, 12)
                        
                       
                    LastlyAddedView(HeadlineText: "En Günceller")
                    }
                    .padding(.bottom, 60)
                    
                    //ScrollVeiw
                    //TabView
                }
            }
           // .frame(maxWidth: .infinity, maxHeight: .infinity)
            //.background(.black)
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


