//
//  OnboardingTabView.swift
//  LearnEnglishWithStories
//
//  Created by İbrahim Aktaş on 11.07.2023.
//

import SwiftUI

struct OnboardingTabView: View {
    var tabIndex: Int
    @Binding var offset: CGFloat
    var images : [String] = ["onboarding1", "onboarding2","onboarding3"]
    var body: some View {
        VStack{
            TabView {
                ForEach(OnboardingModel.onboards.indices, id: \.self) { index in
                    if index == tabIndex {
                        VStack(alignment: .leading){
                          
                            Image(OnboardingModel.onboards[tabIndex].name)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: UIScreen.main.bounds.width / 1.3)
                                .overlay(
                                    GeometryReader{proxy -> Image in
                                        let minX = proxy.frame(in: .global).minX
                                        
                                        DispatchQueue.main.async {
                                            for i in OnboardingModel.onboards.indices {
                                                if tabIndex == i {
                                                   
                                                    withAnimation(.default){
                                                        offset = -minX
                                                        
                                                    }
                                                }
                                            }
                                        }
                                        return Image("")
                                            .resizable()
                                             
                                    }
                                )
                               
                                .padding(.horizontal, 16)
                                .padding(.bottom, 10)
                            Text(OnboardingModel.onboards[tabIndex].headline)
                                .font(.system(size: 22, weight: .semibold, design: .rounded))
                                .padding(.bottom, 4)
                                .padding(.horizontal, 16)
                             
                            Text(OnboardingModel.onboards[tabIndex].desc)
                                .font(.system(size: 16, weight: .light, design: .rounded))
                                .foregroundColor(.gray)
                                .padding(.horizontal, 16)
                        }
                    } else {
                        VStack(alignment: .leading){
                          
                            HStack{
                                Spacer()
                                Image(images[tabIndex])
                                      .resizable()
                                      .aspectRatio(contentMode: .fit)
                                      .frame(width: UIScreen.main.bounds.width / 1.3)
                                       Spacer()
                            }
                            Text(OnboardingModel.onboards[tabIndex].headline)
                                .font(.system(size: 22, weight: .semibold, design: .rounded))
                                .padding(.bottom, 4)
                            
                            Text(OnboardingModel.onboards[tabIndex].desc)
                                .font(.system(size: 16, weight: .light, design: .rounded))
                                .foregroundColor(.gray)
                              
                        }.padding(.horizontal, 16)
                    }
                }
             

            }
            
            
            
            

        }
        .frame(height: UIScreen.main.bounds.size.height / 2)
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        .overlay(
            HStack(spacing: 15){
                ForEach(images.indices, id: \.self) { index in
                    Capsule()
                        .fill(.gray.opacity(0.6))
                        .frame(width: getIndex() == index ? 20 : 7, height: 7)
                         
                }
            }
                .overlay(
                    Capsule()
                        .fill(Color(hex: "6a95a3"))
                        .frame(width: 20 , height: 7)
                        .offset(x:getOffset())
                   , alignment: .leading
                
                )
                .alignV(alignment: .bottom)
                .padding(.bottom, -25)
                
                
        )

    }
    func getIndex()-> Int {
        let index = Int(round(Double(offset / getWidth())))
        return index
    }
    
    func getOffset()-> CGFloat {
        let progress = offset / getWidth()
        
        return 22 * progress
    }
    
}


/*
struct OnboardingTabView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingTabView(tabIndex: 0, offset: .)
    }
} */

struct OnboardingModel {
    var id = UUID()
    var name: String
    var headline: String
    var desc: String
    
    static var onboards: [OnboardingModel] = [
        OnboardingModel(name: "onboarding1", headline: "Dilediğin dilde kendini geliştir", desc: "İlgini çeken dili birçok farklı yazı türü okuyarak geliştir, bilmediğin kelimeleri öğren ve düzenli tekrar et"),
        OnboardingModel(name: "onboarding2", headline: "Hiç sıkılmadan oku", desc: "Sürekli güncellenen haberler, ilgi çekici yazılar ve birçok konsept ile hergün yeni şeyler keşfederek hiç sıkılmadan öğren"),
        OnboardingModel(name: "onboarding3", headline: "Telaffuz olmazsa olmaz", desc: "Kelimenin sadece anlamını bilmek yetmez nasıl okunduğunu bilmek şart"),
    ]
}
