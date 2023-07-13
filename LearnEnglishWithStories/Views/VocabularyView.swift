//
//  VocabularyView.swift
//  LearnEnglishWithStories
//
//  Created by İbrahim Aktaş on 7.06.2023.
//

import SwiftUI

struct VocabularyView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject private var AuthVM: AuthViewModel
    
    @State private var currentTab = 0
    @State private var curretUser: Bool = true
    
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
                    }
                    
                    
                }//Group
                
            
         
            }
            
            .fullScreenCover(isPresented: $curretUser , content: {
                NavigationStack{
                    VStack(alignment: .leading){
                        HStack{
                            Spacer()
                            Button {
                                presentationMode.wrappedValue.dismiss()
                            } label: {
                                Image(systemName: "xmark")
                                    .font(.headline)
                            }

                            
                        }.padding(.horizontal, 16)
                            .padding(.top, 16)
                            .foregroundColor(.gray)
                        Spacer()
                         Image("onboarding3")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 300, height: 300)
                        Text("Görünüşe göre bir hesabın yok")
                            .font(.system(size: 20, weight: .semibold, design: .rounded))
                            .foregroundColor(.black)
                        Text("Arşivi ve diğer birçok özelliği kullanabilmen için bir dakika içinde hemen hesap açabilirsin")
                            .font(.system(size: 15, weight: .light, design: .rounded))
                            .foregroundColor(.gray)
                        Spacer()
                        NavigationLink {
                            SignupType()
                        } label: {
                            HStack{
                                Spacer()
                                Text("Kaydol")
                                    .font(.system(size: 16, weight: .medium, design: .rounded))
                                    .foregroundColor(.white)
                                Spacer()
                            } .padding(EdgeInsets(top: 14, leading: 20, bottom: 14, trailing: 20))
                            
                            
                                .background(
                                    RoundedRectangle(cornerRadius: 6)
                                    
                                        .foregroundColor(Color(hex: "6a95a3"))
                                        .padding(.horizontal, 16)
                                    
                                ).padding(.top, 5)
                        }
                        
                        NavigationLink {
                            AuthenticationWithMail()
                        } label: {
                            HStack{
                                Spacer()
                                Text("Giriş Yap")
                                    .font(.system(size: 16, weight: .medium, design: .rounded))
                                    .foregroundColor(Color(hex: "6a95a3"))
                                Spacer()
                            } .padding(EdgeInsets(top: 14, leading: 20, bottom: 14, trailing: 20))
                            
                            
                                .background(
                                    RoundedRectangle(cornerRadius: 6)
                                        .strokeBorder(Color(hex: "6a95a3"), lineWidth: 0.3)
                                        .padding(.horizontal, 16)
                                    
                                )
                         
                        }
                        
                        
                    }.padding(.horizontal, 16)
                }
            })
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
