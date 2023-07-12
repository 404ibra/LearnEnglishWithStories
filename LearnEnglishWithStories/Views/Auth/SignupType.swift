
//
//  SignupView.swift
//  LearnEnglishWithStories
//
//  Created by İbrahim Aktaş on 11.07.2023.
//

 
import SwiftUI

struct SignupType: View {
    @Environment(\.presentationMode) var presentationMode
    
    let geometry = UIScreen.main.bounds.size
    var body: some View {
        NavigationStack{
            VStack(alignment: .center){
                Image("signup")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: geometry.width * 0.6, height: geometry.height * 0.25)
                    .padding(.top, 40)
                 
                
                HStack{
                    Image(systemName: "apple.logo")
                        .foregroundColor(.black)
                        .padding(.horizontal, 16)
                    Text("Apple ile devam et")
                        .font(.system(size: 16, weight: .regular, design: .rounded))
                        .foregroundColor(.black)
                      Spacer()
                } .padding(EdgeInsets(top: 14, leading: 20, bottom: 14, trailing: 20))
                
              
                .background(
                    RoundedRectangle(cornerRadius: 6)
                        .strokeBorder(Color.gray, lineWidth: 0.3)
                        .padding(.horizontal, 16)
                
                )
                
                HStack{
                    Image("google")
                        .resizable()
                        .frame(width: 15, height: 15)
                        .padding(.horizontal, 16)
                    Text("Google ile oturum aç")
                        .font(.system(size: 16, weight: .regular, design: .rounded))
                        .foregroundColor(.black)
                      Spacer()
                } .padding(EdgeInsets(top: 14, leading: 20, bottom: 14, trailing: 20))
                
              
                .background(
                    RoundedRectangle(cornerRadius: 6)
                        .strokeBorder(Color.gray, lineWidth: 0.3)
                        .padding(.horizontal, 16)
                
                )
                LabelledDivider(label: "VEYA")
                NavigationLink {
                  SignupView()
                } label: {
                    HStack{
                        Image(systemName: "envelope")
                            .foregroundColor(.black)
                            .padding(.horizontal, 16)
                        Text("E-posta ile devam et")
                            .font(.system(size: 16, weight: .regular, design: .rounded))
                            .foregroundColor(.black)
                          Spacer()
                    } .padding(EdgeInsets(top: 14, leading: 20, bottom: 14, trailing: 20))
                    
                  
                    .background(
                        RoundedRectangle(cornerRadius: 6)
                            .strokeBorder(Color.gray, lineWidth: 0.3)
                            .padding(.horizontal, 16)
                    
                    )
                }

                Text("Hesap oluşturarak Brush'un Kullanıcı Sözleşmesi koşullarını kabul etmiş olursunuz")
                    .font(.system(size: 12, weight: .light, design: .rounded))
                    .padding(.horizontal, 16)
                Spacer()
            }.navigationBarBackButtonHidden(true)
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
                            
                            Text("ARAMIZA KATIL")
                                .font(.system(size: 15, weight: .medium, design:.rounded))
                                .tracking(1.2)
                                .foregroundColor(.gray)
                        }
                        
                    }
                }.frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color(hex: "f4f2f7"))
        }
    }
}

struct SignupType_Previews: PreviewProvider {
    static var previews: some View {
        SignupType()
    }
}


