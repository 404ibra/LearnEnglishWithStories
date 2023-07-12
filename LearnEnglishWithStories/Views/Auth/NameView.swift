//
//  NameView.swift
//  LearnEnglishWithStories
//
//  Created by İbrahim Aktaş on 11.07.2023.
//

import SwiftUI

struct NameView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State private var fullname = ""
    
    let geometry = UIScreen.main.bounds
    
    var body: some View {
        NavigationStack{
            VStack{
                Text("Sana nasıl seslenilmesinden mutlu olursun?")
                    .font(.system(size: 14.5, weight: .semibold, design: .rounded))
                    .padding(.top, 60)
                TextField("ben brush", text: $fullname )
                    .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                    .background(
                        RoundedRectangle(cornerRadius: 5)
                            .strokeBorder(Color.gray, lineWidth: 0.2))
                    .padding(.horizontal, 32)
                Spacer()
                NavigationLink {
                    MainTabView()
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
                            
                            Text("SON BİR ADIM")
                                .font(.system(size: 15, weight: .medium, design:.rounded))
                                .tracking(1.2)
                                .foregroundColor(.gray)
                        }
                        
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color(hex: "f4f2f7"))
              
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct NameView_Previews: PreviewProvider {
    static var previews: some View {
        NameView()
    }
}
