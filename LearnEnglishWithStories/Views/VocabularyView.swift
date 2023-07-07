//
//  VocabularyView.swift
//  LearnEnglishWithStories
//
//  Created by İbrahim Aktaş on 7.06.2023.
//

import SwiftUI

struct VocabularyView: View {
    @EnvironmentObject private var AuthVM: AuthViewModel
    
    @State private var currentTab = 0
    
    let geometry = UIScreen.main.bounds
    
    var body: some View {
        NavigationStack{
            ZStack(alignment: .bottom)
            {
                Group{
                    if AuthVM.currentUser?.isPremium ?? false {
                        VStack(alignment: .center, spacing: 0){
                            PageHeader(PageName: "Arşiv", searchicon: false)
                            TabBarView(currentTab: self.$currentTab)
                            ZStack{
                                TabView(selection: self.$currentTab) {
                                    MyVocabuleryView().tag(0)
                                    MyNotesView().tag(1)
                                }
                                
                                .tabViewStyle(.page(indexDisplayMode: .never))
                                .edgesIgnoringSafeArea(.all)
                            }//ZStack
                            .padding(.top, 16)
                          
                    
                            
                        }
                        .padding(.top, 0)
                        .ignoresSafeArea()
                        .refreshable {
                            Task { await AuthVM.fetchUser() }
                        }
                        //VStack
                    } else {
                        Text("Sadece premium kullanıcılar için")
                    }
                    
                    
                }//Group
                
            
         
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
          .background(Color(hex: "f4f2f7"))
            
        }

        }
        
 
        
 }


struct TabBarView: View {
    @Binding var currentTab: Int
    @Namespace var namespace
    
    var tabBarOptions: [String] = ["Kelimelerim", "Kaydettiklerim"]
    
    var body: some View {
       
            HStack{
                ForEach(Array(zip(self.tabBarOptions.indices, self.tabBarOptions)), id: \.0) { index, name in
                    HStack{
                        Spacer()
                        TabBarItem(currentTab: self.$currentTab,
                                   namespace: namespace.self,
                                   tabBarItemName: name,
                                   tab: index)
                        Spacer()
                    }
 
        }
        .padding(.horizontal, 16 )
        .frame(height: 50)
        
                
        .edgesIgnoringSafeArea(.all)
      
    }
          
}


struct TabBarItem: View {
    @Binding var currentTab: Int
    @Environment(\.colorScheme) var colorScheme
    
    let namespace: Namespace.ID
    var tabBarItemName: String
    var tab: Int
    var body: some View {
        Button {
            self.currentTab = tab
        } label: {
            VStack{
                Spacer()
                Text(tabBarItemName)
                    .bold()
                if currentTab == tab {
                        (colorScheme  == .light ? Color.black : .white)
                            .frame(height: 2)
                            .matchedGeometryEffect(id: "underline",
                                                   in: namespace,
                                                   properties: .frame)
                    } else {
                        Color.clear.frame(height: 2)
                    }
            }
            .animation(.spring(), value: self.currentTab)
           
        }
        .buttonStyle(.plain)
        }
    }
}




struct VocabularyView_Previews: PreviewProvider {
    static var previews: some View {
        VocabularyView()
    }
}
