//
//  AuthenticationWithMail.swift
//  LearnEnglishWithStories
//
//  Created by İbrahim Aktaş on 22.06.2023.
//

import SwiftUI

struct AuthenticationWithMail: View {
    @Environment(\.presentationMode) var presentationMode
    
    @EnvironmentObject var AuthVM: AuthViewModel
    
    @State private var email = ""
    @State private var password = ""
    
    let geometry = UIScreen.main.bounds
    
    var body: some View {
        NavigationStack{
            VStack{
 
                TextField("E-Posta", text: $email )
                    .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                    .background(
                        RoundedRectangle(cornerRadius: 5)
                            .strokeBorder(Color.gray, lineWidth: 0.2))
                    .padding(.horizontal, 32)
                
                TextField("Şifre", text: $password )
                    .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                    .background(
                        RoundedRectangle(cornerRadius: 5)
                            .strokeBorder(Color.gray, lineWidth: 0.2))
                    .padding(.horizontal, 32)
                    .padding(.vertical, 16)
               
                Button {
                    //TO DO
                    Task{try await AuthVM.signIn(withEmail: email,  password:password)}
                   
                } label: {
                    ZStack{
                        Rectangle()
                            .frame(width: geometry.size.width * 0.85 ,height: 55)
                            .foregroundColor(Color(hex: "87C2D2"))
                            .cornerRadius(8)
                        Text("Devam Et")
                            .font(.system(size: 17, weight: .semibold, design: .rounded))
                            .foregroundColor(.white)
                    }
                }
                Text("Şifremi Unuttum")
                    .font(.system(size: 15, weight: .medium, design: .rounded))
                    .foregroundColor(Color(hex: "87C2D2"))
                    .alignH(alignment: .center)
                    .padding(.horizontal, 32)
                    .padding(.bottom, 10)
                

                LabelledDivider(label: "VEYA")
                
                HStack{
                    Image(systemName: "apple.logo")
                        .foregroundColor(.black)
                        .padding(.horizontal, 16)
                    Text("Apple ile devam et")
                        .font(.system(size: 16, weight: .medium, design: .rounded))
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
                        .font(.system(size: 16, weight: .medium, design: .rounded))
                        .foregroundColor(.black)
                      Spacer()
                } .padding(EdgeInsets(top: 14, leading: 20, bottom: 14, trailing: 20))
                
              
                .background(
                    RoundedRectangle(cornerRadius: 6)
                        .strokeBorder(Color.gray, lineWidth: 0.3)
                        .padding(.horizontal, 16)
                
                )
                
                
                
            
            }
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
                        
                        Text("TEKRAR MERHABA")
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


struct AuthenticationWithMail_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationWithMail()
    }
}
