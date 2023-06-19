//
//  MainView.swift
//  LearnEnglishWithStories
//
//  Created by İbrahim Aktaş on 31.05.2023.
//

import SwiftUI

import SwiftUI

struct MainView: View {
    
    @StateObject private var MainVM = MainVievModel()
    @ObservedObject private var ArticleVM = ArticleViewModel()
    @State var SelectedTab : Int = 0
    
    init(){
        ArticleVM.getData()
    }

    

    var body: some View {
       
        NavigationStack{
            VStack(alignment: .leading, spacing: 0){
                PageHeader(PageName: "Kütüphanem", searchicon: true)
                
               

                // TO DO eğer alt taraf yazılan texte göre değişebilirse yap yoksa yeni sayfaya yönlendir
                if MainVM.isSearchVisible == true {
                    
                    ScrollView{
                        
                    }
                }
                //Arama kısmına bir şey yazılmadıysa
                else{
                    ScrollView{
                        NavigationLink(destination: StoryPreview(index: 0)) {
                            ContinueSection()
                                .padding(.top,16)
                        }
                    Divider()
                        .background(.gray)
                        .padding(.top,10)
                    FeaturedView(HeadlineText: "Seriler")
                            .onTapGesture {
                                print("sdadas")
                                print(MainVM.searchText.count)
                             
                            }
                        .padding(.bottom,25)
                        .padding(.top, 12)
                        
                       
                    LastlyAddedView(HeadlineText: "En Günceller")
                    //FeaturedView.v2 --film dialogları, şarkı sözleri gibi
                    DialogsFeatured(HeadlineText: "Diyaloglar")
                        .padding(.top,10)
                }//ScrollVeiw
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
        .refreshable {
            //TO DO
        }
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


