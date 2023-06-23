//
//  AuthenticationWithMail.swift
//  LearnEnglishWithStories
//
//  Created by İbrahim Aktaş on 22.06.2023.
//

import SwiftUI

struct AuthenticationWithMail: View {
    @EnvironmentObject var AuthVM: AuthViewModel
    
    @State private var email = ""
    @State private var password = ""
    
    let geometry = UIScreen.main.bounds
    
    var body: some View {
        NavigationStack{
            VStack{
                Image("new.logo")
                    .resizable()
                    .frame(width: 110, height: 55)
                
                Text("Hoş Geldin")
                    .font(.title3)
                    .foregroundColor(.mainorange)

                
                TextField("E-Posta", text: $email )
                    .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                    .background(
                        RoundedRectangle(cornerRadius: 1)
                            .strokeBorder(Color(hex: "0d4e89"), lineWidth: 1.75))
                    .padding(.horizontal, 32)
                
                TextField("Şifre", text: $password )
                    .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                    .background(
                        RoundedRectangle(cornerRadius: 2)
                            .strokeBorder(Color(hex: "0d4e89"), lineWidth: 1.75))
                    .padding(.horizontal, 32)
                    .padding(.vertical, 16)
                Text("Şifremi Unuttum")
                    .font(.system(size: 15, weight: .medium, design: .rounded))
                    .foregroundColor(.mainorange)
                    .alignH(alignment: .leading)
                    .padding(.horizontal, 32)
                    .padding(.bottom, 10)
                
                Button {
                    //TO DO
                    Task{try await AuthVM.signIn(withEmail: email,  password:password)}
                } label: {
                    ZStack{
                        Rectangle()
                            .frame(width: geometry.size.width * 0.85 ,height: 55)
                            .foregroundColor(.mainorange)
                        Text("Devam Et")
                            .font(.system(size: 17, weight: .medium, design: .rounded))
                            .foregroundColor(.white)
                    }
                }
                
                NavigationLink {
                    SignupView()
                } label: {
                    HStack{
                        Text("Bir hesabın yok mu?")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        Text("Kayıt Ol")
                            .font(.subheadline)
                            .foregroundColor(.mainorange)
                    }
                    .alignH(alignment: .leading)
                    .padding(.horizontal, 32)
                }

                
              
                
                LabelledDivider(label: "Veya")
                
                ZStack{
                    Rectangle()
                        .frame(width: geometry.size.width * 0.85, height: 55)
                    HStack{
                        Image(systemName: "apple.logo")
                            .foregroundColor(.white)
                        Text("Apple ile Devam Et")
                            .font(.system(size: 16, weight: .semibold, design: .rounded))
                            .foregroundColor(.white)
                    }
                }//Apple zstack
     
                ZStack{
                    Rectangle()
                        .frame(width: geometry.size.width * 0.85, height: 55)
                        .foregroundColor(Color(hex: "4285f4"))
                    HStack{
                        Text("Google ile Devam Et")
                            .font(.system(size: 16, weight: .semibold, design: .rounded))
                            .foregroundColor(.white)
                    }
                }
                
                
                
                
            
            }
        }
    }}

struct AuthenticationWithMail_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationWithMail()
    }
}
