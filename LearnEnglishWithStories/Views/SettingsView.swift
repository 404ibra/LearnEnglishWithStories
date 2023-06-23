//
//  SettingsView.swift
//  LearnEnglishWithStories
//
//  Created by İbrahim Aktaş on 7.06.2023.
//

import SwiftUI

struct SettingsView: View {
    
    @State private var loginSheet: Bool = false
    
    var body: some View {
        VStack {
            PageHeader(PageName: "Ayarlar", searchicon: false)
              
            VStack {
                Button {
                    loginSheet = true
                } label: {
                    OptionImage(imagename: "premium", circlecolor: .gray.opacity(0.2), optionname: "Premium ", systemtype1: true)
                }

                OptionImage(imagename: "language", circlecolor: .gray.opacity(0.2), optionname: "Dil Değiştir", systemtype1: true)
                OptionImage(imagename: "trash", circlecolor: .gray.opacity(0.2), optionname: "Dil Değiştir", systemtype1: false)
            }.alignH(alignment: .leading)
                .padding(.horizontal,16)

                Spacer()
                
        }.sheet(isPresented: $loginSheet) {
            AuthenticationWithMail()
                .presentationDetents([.large])
                    .presentationDragIndicator(.visible)    
        }
       
        }
    }

    
    struct SettingsView_Previews: PreviewProvider {
        static var previews: some View {
            SettingsView()
        }
    }


struct OptionImage: View {
    
    let imagename: String
    let circlecolor: Color
    let optionname: String
    let systemtype1: Bool
    var body: some View {
        HStack{
            ZStack{
                if systemtype1 == true {
                    Circle()
                        .frame(height: 40)
                        .foregroundColor(circlecolor)
                    Image(imagename)
                        .resizable()
                        .frame(width: 25, height: 25)
                } else {
                    Circle()
                        .frame(height: 40)
                        .foregroundColor(circlecolor)
                    Image(systemName: imagename)
                        .resizable()
                        .frame(width: 25, height: 25)
                }
            }//ZStack
            Text(optionname)
                .font(.system(size: 17, weight: .medium, design: .rounded))
        }
    }
}
