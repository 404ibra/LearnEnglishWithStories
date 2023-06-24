//
//  SignupView.swift
//  LearnEnglishWithStories
//
//  Created by İbrahim Aktaş on 23.06.2023.
//

import SwiftUI

struct SignupView: View {
    @EnvironmentObject var AuthVM: AuthViewModel
    
    @State private var fullname = ""
    @State private var email = ""
    @State private var password = ""
    @State private var passwordAgain = ""
    
    let geometry = UIScreen.main.bounds
    
    var body: some View {
        VStack{
            //Image("new.logo")
            TextField("İsminiz", text: $fullname )
                .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                .background(
                    RoundedRectangle(cornerRadius: 1)
                        .strokeBorder(Color(hex: "0d4e89"), lineWidth: 1.75))
                .padding(.horizontal, 32)
                
            
            TextField("E-Posta", text: $email )
                .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                .background(
                    RoundedRectangle(cornerRadius: 1)
                        .strokeBorder(Color(hex: "0d4e89"), lineWidth: 1.75))
                .padding(.horizontal, 32)
                .padding(.vertical, 4)
            
            TextField("Şifre", text: $password )
                .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                .background(
                    RoundedRectangle(cornerRadius: 2)
                        .strokeBorder(Color(hex: "0d4e89"), lineWidth: 1.75))
                .padding(.horizontal, 32)
                .padding(.vertical, 4)
                
            
            TextField("Şifreyi Onayla", text: $passwordAgain )
                .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                .background(
                    RoundedRectangle(cornerRadius: 2)
                        .strokeBorder(Color(hex: "0d4e89"), lineWidth: 1.75))
                .padding(.horizontal, 32)
                .padding(.bottom, 16)

            
            Button {
                //TO DO
                Task{try await AuthVM.signUp(email: email, password: password, fullname: fullname)}
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
            
            HStack{
                Text("Zaten bir hesabın var mı")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Text("Giriş Yap")
                    .font(.subheadline)
                    .foregroundColor(.mainorange)
            }
            .alignH(alignment: .leading)
            .padding(.horizontal, 32)
            
            //LabelledDivider(label: "Veya")
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
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
