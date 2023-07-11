//
//  SelectLanguages.swift
//  LearnEnglishWithStories
//
//  Created by İbrahim Aktaş on 11.07.2023.
//


import SwiftUI

struct SelectLanguages: View {
    @StateObject private var MainVM = MainVievModel()
    @Binding var isActivated: Bool
    
    @State private var eyeSaverMode: Bool = false
    let headline: String
    
    var body: some View {
        
        ZStack{
            Color(.black)
                .opacity(0.05)
                .ignoresSafeArea()
                .onTapGesture {
                    closeDialog(MainVM: MainVievModel())
                }
            VStack{
                Text(headline)
                    .font(.system(size: 20,weight: .semibold, design: .rounded))
                    .padding(.horizontal, 8)
                    .padding(.vertical, 24)
                ScrollView{
                    VStack{
                        ForEach(Languages.allLanguages) { language in
                            Button(action: {
                                //TO DO TELEFONU TİTRET
                            }, label: {
                                VStack{
                                    HStack{
                                        Text(language.language)
                                            .font(.system(size: 18, weight: .light, design: .rounded))
                                            .foregroundColor(.gray)
                                        Spacer()
                                    }
                                    Divider()
                                    
                                }
                            })
                            .padding(.horizontal, 28)
                        }
                    }
                }
            }
            
            
            .fixedSize(horizontal: false, vertical: false)
            .frame(height: UIScreen.main.bounds.size.height / 1.45)
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .shadow(radius: 20)
            .padding()
            .offset(x:0 ,y: MainVM.offset)
            .onAppear{
                withAnimation(.spring()) {
                    MainVM.offset = 0
                }
            }}
        }
        
        
        
        func closeDialog(MainVM: MainVievModel){
            withAnimation {
                MainVM.offset = 1000
                isActivated = false
                // isActivated = false
            }
        }
        
    }
    
    
    
    
    struct SelectLanguages_Previews: PreviewProvider {
        static var previews: some View {
            SelectLanguages(isActivated: .constant(true), headline: "İlgi çekici metinlerle hangi dili öğrenmek istersin?")
        }
    }
    
    struct Languages: Identifiable {
        var id = UUID()
        var language: String
        
        static var allLanguages: [Languages] = [
            Languages(language: "Türkçe"),
            Languages(language: "İngilizce"),
            Languages(language: "Almanca"),
            Languages(language: "Fransızca"),
            Languages(language: "İspanyolca")
        ]
    }

