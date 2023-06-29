//
//  ReadNow.swift
//  LearnEnglishWithStories
//
//  Created by İbrahim Aktaş on 28.06.2023.
//

import SwiftUI

struct ReadNow: View {
    @StateObject private var MainVM = MainVievModel()
    let geometry = UIScreen.main.bounds
    @State var slidingImages: Int = 1
       
    var body: some View {
       
        
            TabView() {
                ForEach(Read.data) { data in
                    ZStack(alignment: .bottom){
                        DataImage(image: data.image)
                        ArticleInfo(name: data.name, level: data.level
                                    ,time: data.time, desc: data.desc)
                        }
                    } 
            }

            .tabViewStyle(PageTabViewStyle())
            .frame(width: geometry.size.width ,height: UIScreen.main.bounds.size.height * 0.68)
           
            
         
            
        
            
         
                
        
             
        
    }
}

struct ReadNow_Previews: PreviewProvider {
    static var previews: some View {
        ReadNow()
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
        Read(image: "hercules", time: "16 dk.", desc: "Mısırın korkunç ölüm tanrısının bazı gizemleri", name: "Hercul'un Omzu", level: "İleri Seviye"),
        Read(image: "vangogh", time: "7 dk.", desc: "Mısırın korkunç ölüm tanrısının bazı gizemleri", name: "Van Gogh'un Kulağı", level: "Başlangıç ")
    ]
}

struct ArticleInfo: View {
    
    var name: String
    var level: String
    var time: String
    var desc: String
    
    var body: some View {
        ZStack(alignment: .bottom){
            LinearGradient(
                gradient: Gradient(colors: [Color.black.opacity(0.6), Color.clear]),
                startPoint: .bottom,
                endPoint: .center
            )
            
            VStack{
                Text(name)
                    .font(.system(size: 23, weight: .semibold, design: .rounded))
                    .foregroundColor(.white)
                    .padding(.bottom, 1)
                HStack{
                    Text(level)
                    Text(time)
                }
                .font(.system(size: 15, weight: .light, design: .rounded))
                .foregroundColor(.white)
                .padding(.bottom, 0.1)
                Text(desc)
                    .font(.system(size: 16, weight: .medium, design: .rounded))
                    .padding(.horizontal, 60)
                    .foregroundColor(.white)
                    .padding(.bottom, 0)
                    .multilineTextAlignment(.center)
            }.padding(.vertical, 35)
            
        }
    }
}

struct DataImage: View {
    @State var offset: CGFloat = 0
    let geometry = UIScreen.main.bounds
    var image: String
    var body: some View {
        ZStack{
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: geometry.size.width ,height: UIScreen.main.bounds.size.height * 0.68)
            LinearGradient(
                gradient: Gradient(colors: [Color.black.opacity(0.6), Color.clear]),
                startPoint: .top,
                endPoint: .center
            )
        }.modifier(OffsetModifier(offset: $offset))
    }
}
