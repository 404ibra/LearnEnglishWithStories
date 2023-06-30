//
//  ReadNow.swift
//  LearnEnglishWithStories
//
//  Created by İbrahim Aktaş on 28.06.2023.
//

import SwiftUI

struct ReadNow: View {
    @State var selectedIndex = 0
    let geometry = UIScreen.main.bounds
    var body: some View {
        GeometryReader{ g in
            TabView(selection: $selectedIndex){
                
                ForEach(Read.data){ data in
                    ZStack(alignment: .top){
                        ZStack(alignment: .bottom){
                            ZStack{
                                
                                Image(data.image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                
                                LinearGradient(
                                    gradient: Gradient(colors: [Color.black.opacity(0.6), Color.clear]),
                                    startPoint: .top,
                                    endPoint: .center
                                )
                                LinearGradient(
                                    gradient: Gradient(colors: [Color.black.opacity(0.6), Color.clear]),
                                    startPoint: .bottom,
                                    endPoint: .center
                                )
                            }
                            VStack{
                                Text(data.name)
                                    .font(.system(size: 23, weight: .semibold, design: .rounded))
                                    .foregroundColor(.white)
                                    .padding(.bottom, 1)
                                HStack{
                                    Text(data.level)
                                    Text(data.time)
                                }
                                .font(.system(size: 15, weight: .light, design: .rounded))
                                .foregroundColor(.white)
                                .padding(.bottom, 0.1)
                                Text(data.desc)
                                    .font(.system(size: 16, weight: .medium, design: .rounded))
                                    .padding(.horizontal, 60)
                                    .foregroundColor(.white)
                                    .padding(.bottom, 0)
                                    .multilineTextAlignment(.center)
                            }.padding(.vertical, 35)
                        }// bottom zstack for descriptions
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
                            
                        } .padding(.horizontal, 48)
                            .padding(.vertical,48)
                    }.tag(data.id)
                    
                }
                
                
                
            }.offset(y: g.frame(in: .global).minY > 0 ? -g.frame(in: .global).minY : 0)
                .frame(width: geometry.size.width,height: g.frame(in: .global).minY > 0 ? UIScreen.main.bounds.height * 0.68 + g.frame(in: .global).minY : UIScreen.main.bounds.height * 0.68)
            
        }       .tabViewStyle(PageTabViewStyle())
        //Geometry Reader
        .frame(width: geometry.size.width ,height: UIScreen.main.bounds.size.height * 0.68)
        
        //Şimdi Oku kısmı
        
        
        
        
        
 
    }
}


struct Read: Identifiable {
    var id = UUID()
    var image: String
    var time: String
    var desc: String
    var name: String
    var level: String
    
    static var data : [Read] = [
        Read(image: "anubis", time: "12 dk.", desc: "Mısırın korkunç ölüm tanrısının bazı gizemleri", name: "Anubis ve Korku", level: "İleri Seviye"),
        Read(image: "anubis", time: "16 dk.", desc: "Mısırın korkunç ölüm tanrısının bazı gizemleri", name: "Hercul'un Omzu", level: "İleri Seviye"),
        Read(image: "anubis", time: "7 dk.", desc: "Mısırın korkunç ölüm tanrısının bazı gizemleri", name: "Van Gogh'un Kulağı", level: "Başlangıç ")
    ]
}
