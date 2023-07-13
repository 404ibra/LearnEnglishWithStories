
//
//  SignupView.swift
//  LearnEnglishWithStories
//
//  Created by İbrahim Aktaş on 11.07.2023.
//

 
import SwiftUI

struct SignupType: View {
    @Environment(\.presentationMode) var presentationMode
    let geometry = UIScreen.main.bounds
    @State  var email: String = ""
    @State  var password : String = ""
    @State var fullname : String = ""
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .center){
                
                
                
                
                
                
                VStack(alignment: .leading){
                    Text("Merhaba!")
                        .font(.system(size: 26, weight: .bold, design: .rounded))
                        .padding(.horizontal, 16)
                        .padding(.top, 30)
                    Text("Hemen yeni bir hesap oluşturabilirsin")
                        .font(.system(size: 16, weight: .medium, design: .rounded))
                        .foregroundColor(Color(hex: "6a95a3"))
                        .padding(.horizontal, 16	)
                    TextField("ben brush", text: $fullname )
                        .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                    
                        .background(
                            RoundedRectangle(cornerRadius: 5)
                                .strokeBorder(Color.gray, lineWidth: 0.2))
                        .padding(.horizontal, 32)
                        .padding(.vertical, 30)
                    TextField("ornek@ornek.", text: $email)
                    
                        .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                        .background(
                            RoundedRectangle(cornerRadius: 5)
                                .strokeBorder(Color.gray, lineWidth: 0.2))
                        .padding(.horizontal, 32)
                        .padding(.bottom, 30)
                    
                    
                    SecureField("en az 6 karakterli şifre", text: $password )
                        .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                        .background(
                            RoundedRectangle(cornerRadius: 5)
                                .strokeBorder(Color.gray, lineWidth: 0.2))
                        .padding(.horizontal, 32)
                        .padding(.bottom, 30)
                    
                    
                    
                    
                    NavigationLink {
                        SelectLanguageView()
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
                    }.alignH(alignment: .center)
                    
                    
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
                    
                    
                    
                }
                LabelledDivider(label: "VEYA")
                Text("Apple veya Google hesabın ile kaydol")
                    .font(.system(size: 16, weight: .medium, design: .rounded))
                    .foregroundColor(.gray)
                    .padding(.horizontal, 16    )
                HStack(spacing: 0){
                    Image(systemName: "apple.logo")
                        .foregroundColor(.black)
                        .padding(.horizontal, 16)
                    
                        .padding(EdgeInsets(top: 14, leading: 20, bottom: 14, trailing: 20))
                        .background(
                            Circle()
                                .strokeBorder(Color.gray, lineWidth: 0.3)
                                .padding(.horizontal, 16)
                            
                        )
                    
                    
                    Image("google")
                        .resizable()
                        .frame(width: 15, height: 15)
                        .padding(.horizontal, 16)
                    
                        .padding(EdgeInsets(top: 14, leading: 20, bottom: 14, trailing: 20))
                    
                    
                        .background(
                            Circle()
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
                        
                    }
                }.frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color(hex: "f4f2f7"))
        }
    }
    
    func progressIndicator() -> CGFloat {
        var progress: CGFloat = 0
        
        withAnimation(.default) {
            progress += (fullname.count >= 2) ? 0.16 : -0.16
            progress += (email.count >= 2) ? 0.16 : -0.16
            progress += (password.count >= 2) ? 0.16 : -0.16
           }
        return progress
    }}

struct SignupType_Previews: PreviewProvider {
    static var previews: some View {
        SignupType()
    }
}


//Text("Apple ile devam et")
//    .font(.system(size: 16, weight: .regular, design: .rounded))
//    .foregroundColor(.black)
//  Spacer()
