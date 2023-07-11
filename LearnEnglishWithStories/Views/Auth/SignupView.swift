//
//  SignupView.swift
//  LearnEnglishWithStories
//
//  Created by İbrahim Aktaş on 23.06.2023.
//

import SwiftUI

struct SignupView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var AuthVM: AuthViewModel
    
    @State private var fullname = ""
    @State private var email = ""
    @State private var password = ""

    
    let geometry = UIScreen.main.bounds
    
    var body: some View {
        NavigationStack{
            VStack{
                TextField("ornek@ornek", text: $email )
                    .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                    .background(
                        RoundedRectangle(cornerRadius: 5)
                            .strokeBorder(Color.gray, lineWidth: 0.2))
                    .padding(.horizontal, 32)
                    .padding(.top, 60)
                
                TextField("en az 6 karakterli şifre", text: $password )
                    .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                    .background(
                        RoundedRectangle(cornerRadius: 5)
                            .strokeBorder(Color.gray, lineWidth: 0.2))
                    .padding(.horizontal, 32)
                    .padding(.vertical, 16)
                
                
                
                NavigationLink {
                    SelectLanguageView()
                } label: {
                    ZStack{
                        Rectangle()
                            .frame(width: geometry.size.width * 0.85 ,height: 55)
                            .foregroundColor(Color(hex: "2a5efd"))
                            .cornerRadius(8)
                        Text("Devam Et")
                            .font(.system(size: 17, weight: .medium, design: .rounded))
                            .foregroundColor(.white)
                    }
                }
                
                
                /*
                 Button {
                 Task{try await AuthVM.signUp(email: email, password: password, fullname: fullname)}
                 } label: {
                 ZStack{
                 Rectangle()
                 .frame(width: geometry.size.width * 0.85 ,height: 55)
                 .foregroundColor(Color(hex: "2a5efd"))
                 .cornerRadius(8)
                 Text("Devam Et")
                 .font(.system(size: 17, weight: .medium, design: .rounded))
                 .foregroundColor(.white)
                 }*/
                
                Text("Hesap oluşturarak Brush'un Kullanıcı Sözleşmesi koşullarını kabul etmiş olursunuz")
                    .font(.system(size: 12, weight: .light, design: .rounded))
                    .padding(.horizontal, 16)
                Spacer()
            }  .navigationBarBackButtonHidden(true)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            //  presentationMode.wrappedValue.dismiss()
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
                            
                            Text("BAŞLIYORUZ")
                                .font(.system(size: 15, weight: .medium, design:.rounded))
                                .tracking(1.2)
                                .foregroundColor(.gray)
                        }
                        
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color(hex: "f4f2f7"))
        }}
    
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
