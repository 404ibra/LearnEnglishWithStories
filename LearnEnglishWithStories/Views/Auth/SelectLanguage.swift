//
//  SelectLanguage.swift
//  LearnEnglishWithStories
//
//  Created by İbrahim Aktaş on 11.07.2023.
//

import SwiftUI

struct SelectLanguageView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State private var learningLanguage: Bool = false
    @State private var mainLanguage: Bool = false
    
    @State private var learningLangaugeisChange: String = ""
    @State private var mainLanguageisChange: String = ""
    
    let geometry = UIScreen.main.bounds
    
    var body: some View {
        NavigationStack{
            ZStack{
                VStack(alignment: .leading){
                    Text("Dil seçin")
                        .font(.system(size: 19, weight: .medium, design: .rounded ))
                        .padding(.bottom, 16)
                        .padding(.top, 60)
                    Text("Hangi dili öğrenmek istiyorsun?")
                        .font(.system(size: 15, weight: .light, design: .rounded ))
                    
                    Button {
                        learningLanguage = true
                    } label: {
                        HStack{
                            Text("Brushca")
                                .font(.system(size: 16, weight: .regular, design: .rounded))
                                .foregroundColor(.black)
                              Spacer()
                            Image(systemName: "chevron.forward")
                                .foregroundColor(.mainorange)
                        } .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                            .padding(.horizontal, 16)
                        .background(
                            RoundedRectangle(cornerRadius: 6)
                                .strokeBorder(Color.gray, lineWidth: 0.3)
                                .padding(.horizontal, 16)
                        
                        )
                    }
                    
                    
                    
                    Text("Hangi dili konuşuyorsun?")
                        .font(.system(size: 15, weight: .light, design: .rounded ))
                        .padding(.top, 32)
                    Button {
                        mainLanguage = true
                    } label: {
                        HStack{
                            Text("Brushca")
                                .font(.system(size: 16, weight: .regular, design: .rounded))
                                .foregroundColor(.black)
                              Spacer()
                            Image(systemName: "chevron.forward")
                                .foregroundColor(.mainorange)
                        } .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                            .padding(.horizontal, 16)
                        .background(
                            RoundedRectangle(cornerRadius: 6)
                                .strokeBorder(Color.gray, lineWidth: 0.3)
                                .padding(.horizontal, 16)
                        
                        )
                    }
                    NavigationLink {
                        
                    } label: {
                        ZStack{
                            Rectangle()
                                .frame(width: geometry.size.width * 0.85 ,height: 55)
                                .foregroundColor(Color(hex: "6a95a3"))
                                .cornerRadius(8)
                            Text("Devam Et")
                                .font(.system(size: 17, weight: .medium, design: .rounded))
                                .foregroundColor(.white)
                        }
                    }
                    .padding(.top, 32)
                    
                    
                    Spacer()
                }
                
                if  learningLanguage {
                    SelectLanguages(isActivated: $learningLanguage, headline: "İlgi çekici metinlerle hangi dili öğrenmek istersin?")
                       
                } else if mainLanguage {
                    SelectLanguages(isActivated: $mainLanguage, headline: "Gündelik hayatında hangi dili kullanıyorsun?")
                }
                
            }
          
            .padding(.horizontal, 16)
            .navigationBarBackButtonHidden(true)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "chevron.backward")
                            .foregroundColor(.gray)
                    }
                    
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    ZStack {
                        Circle()
                            .stroke(
                                Color(hex: "fa6b35").opacity(0.5),
                                lineWidth:4
                            )
                        Circle()
                        
                            .trim(from: 0, to: progressIndicator() )
                            .stroke(
                                Color(hex: "fa6b35"),
                                lineWidth: 4
                            )
                            .rotationEffect(.degrees(-90))
                            .animation(.easeOut, value: progressIndicator())
                    }.frame(width: 22, height: 22)
                }}
             .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color(hex: "f4f2f7"))
        }
    }
    
    func progressIndicator() -> CGFloat {
        var progress: CGFloat = 0.49
        
        
        
        
        withAnimation(.default) {
          progress += learningLanguage == true ? 0.25 : 0
            progress += mainLanguage == true ? 0.25 : 0
           }
        return progress
    }
    
      }
 
 

struct SelectLanguageView_Previews: PreviewProvider {
    static var previews: some View {
        SelectLanguageView()
    }
}
