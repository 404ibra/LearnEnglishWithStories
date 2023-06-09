//
//  MainView.swift
//  LearnEnglishWithStories
//
//  Created by İbrahim Aktaş on 31.05.2023.
//

import SwiftUI

struct MainView: View {
    @StateObject private var MainVM = MainVievModel()
    @State var SelectedTab : Int = 0

    
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading, spacing: 0){
                PageHeader(PageName: "Kütüphanem")
                ScrollView{
                    NavigationLink(destination: StoryPreview()) {
                        ContinueSection()
                            .padding(.top,32)
                    }
                    Divider()
                        .background(.gray)
                        .padding(.top,10)
                    FeaturedView(HeadlineText: "Seriler")
                        .padding(.bottom,25)
                        .padding(.top, 12)
                    FeaturedView(HeadlineText: "En Günceller")
                    //FeaturedView.v2 --film dialogları, şarkı sözleri gibi
                    DialogsFeatured(HeadlineText: "Diyaloglar")
                        .padding(.top,10)
                }//ScrollVeiw
                //TabView
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


