//
//  SettingsView.swift
//  LearnEnglishWithStories
//
//  Created by İbrahim Aktaş on 7.06.2023.
//

import SwiftUI

struct SettingsView: View {
    @State private var loginSheet: Bool = false
    
    let geometry = UIScreen.main.bounds
    
    var body: some View {
        VStack {
            PageHeader(PageName: "Ayarlar", searchicon: false)

              
            ScrollView {
                Group{
                    Button {
                        loginSheet = true
                    } label: {
                        ZStack{
                            Rectangle()
                            .frame(width: geometry.size.width, height: 65)
                            .foregroundColor(.mainorange.opacity(0.75))
                            HStack{
                                Text("Premium Ol")
                                    .font(.system(size: 17, weight: .light, design: .rounded))
                                Spacer()
                                Image(systemName: "chevron.forward")
                            }
                                .padding(.horizontal, 32)
                        }
                    }
                    Divider()
                    ZStack{
                        Rectangle()
                        .frame(width: geometry.size.width, height: 65)
                        .foregroundColor(.white)
                        HStack{
                            Text("Dili Değiştir")
                                .font(.system(size: 17, weight: .light, design: .rounded))
                            Spacer()
                            Image(systemName: "chevron.forward")
                        }
                            .padding(.horizontal, 32)
                    }
                    Divider()
                    ZStack{
                        Rectangle()
                        .frame(width: geometry.size.width, height: 65)
                        .foregroundColor(.white)
                        HStack{
                            Text("Uygulama Hakkında")
                                .font(.system(size: 17, weight: .light, design: .rounded))
                            Spacer()
                            Image(systemName: "chevron.forward")
                        }
                            .padding(.horizontal, 32)
                    }
                    Divider()
                    ZStack{
                        Rectangle()
                        .frame(width: geometry.size.width, height: 65)
                        .foregroundColor(.white)
                        HStack{
                            Text("Destek")
                                .font(.system(size: 17, weight: .light, design: .rounded))
                            Spacer()
                            Image(systemName: "chevron.forward")
                        }
                            .padding(.horizontal, 32)
                    }
                    Divider()
                    ZStack{
                        Rectangle()
                        .frame(width: geometry.size.width, height: 65)
                        .foregroundColor(.white)
                        HStack{
                            Text("Bizi Değerlendir")
                                .font(.system(size: 17, weight: .light, design: .rounded))
                            Spacer()
                            Image(systemName: "chevron.forward")
                        }
                            .padding(.horizontal, 32)
                    }
                   
                    
                    
                }
                
                Group{
                    Divider()
                    ZStack{
                        Rectangle()
                        .frame(width: geometry.size.width, height: 65)
                        .foregroundColor(.white)
                        HStack{
                            Text("Çıkış Yap")
                                .font(.system(size: 17, weight: .light, design: .rounded))
                            Spacer()
                            Image(systemName: "chevron.forward")
                        }
                            .padding(.horizontal, 32)
                    }
                    Divider()
                    ZStack{
                        Rectangle()
                        .frame(width: geometry.size.width, height: 65)
                        .foregroundColor(.white)
                        HStack{
                            Text("Hesabımı Sil")
                                .font(.system(size: 17, weight: .light, design: .rounded))
                            Spacer()
                            Image(systemName: "chevron.forward")
                        }
                            .padding(.horizontal, 32)
                    }

                }
            
                
        
            }.padding(.bottom, 50)
            
        }
      
        .sheet(isPresented: $loginSheet) {
            AuthenticationWithMail()
                .presentationDetents([.large])
                    .presentationDragIndicator(.visible)    
        }
        .ignoresSafeArea()
       
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
