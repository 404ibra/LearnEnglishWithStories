//
//  SettingsView.swift
//  LearnEnglishWithStories
//
//  Created by İbrahim Aktaş on 7.06.2023.
//

import SwiftUI

struct SettingsView: View {
    
    var body: some View {
        VStack {
            PageHeader(PageName: "Ayarlar", searchicon: false)
            GeometryReader { geometry in
                ScrollView(.vertical, showsIndicators: false) {
                        SettingsOptionContainers(buttontext: "Premium Ol", imagename: "premium", systemIcon: false, iconcolor: .orange)
                        SettingsOptionContainers(buttontext: "Dil Ayarları", imagename: "language", systemIcon: false, iconcolor: .orange)
                        SettingsOptionContainers(buttontext: "Bildirim Ayarları", imagename: "bell", systemIcon: true, iconcolor: .orange)
                        SettingsOptionContainers(buttontext: "İletişime Geç", imagename: "envelope", systemIcon: true, iconcolor: .orange)
                        SettingsOptionContainers(buttontext: "Hesabımı Sil", imagename: "trash", systemIcon: true, iconcolor: .red)
                        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                }.frame(width: geometry.size.width)
            }
            
 
                
                
            
      
        }
        .ignoresSafeArea()
    }
}
    
    struct SettingsView_Previews: PreviewProvider {
        static var previews: some View {
            SettingsView()
        }
    }

