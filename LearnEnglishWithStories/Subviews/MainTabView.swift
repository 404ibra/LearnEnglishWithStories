//
//  MainTabView.swift
//  LearnEnglishWithStories
//
//  Created by İbrahim Aktaş on 7.06.2023.
//

import SwiftUI

struct MainTabView: View {
    @State var playerFrame = CGRect.zero
    /*init() {
        UITabBar.appearance().barTintColor = .black // custom color.
    }*/
    var body: some View {
            TabView{
                            ForEach(HomeTabItem.tabItems) { item in
                                item.page.tabItem {
                                        VStack{
                                            Image(systemName: item.model.icon.rawValue)
                                            Text(item.model.title.rawValue)
                                    }
                                }
                              
                            }
        }
            .onAppear {
                let tabBarAppearance = UITabBarAppearance()
                tabBarAppearance.configureWithDefaultBackground()
                UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
            }
         
      
        
            .accentColor(.mainorange)
       
       

            
            
            }
        
    }


struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}


