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
                            Text("İngilizce")
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
                            Text("İngilizce")
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
                        NameView()
                    } label: {
                        ZStack{
                            Rectangle()
                                .frame(width: geometry.size.width * 0.85 ,height: 55)
                                .foregroundColor(Color(hex: "87C2D2"))
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
                ToolbarItem(placement: .principal) {
                 
                    HStack {
                        Image("xx")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 28)
                        
                        Text("BAZI AYARLAR")
                            .font(.system(size: 15, weight: .medium, design:.rounded))
                            .tracking(1.2)
                            .foregroundColor(.gray)
                    }
                    
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color(hex: "f4f2f7"))
        }
    }
}

struct SelectLanguageView_Previews: PreviewProvider {
    static var previews: some View {
        SelectLanguageView()
    }
}
