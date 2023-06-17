//
//  DialogContainer.swift
//  LearnEnglishWithStories
//
//  Created by İbrahim Aktaş on 17.06.2023.
//

import SwiftUI

struct DialogContainer: View {
    @StateObject private var MainVM = MainVievModel()
    @Binding var isActivated: Bool
    
    var body: some View {
        VStack{
            Text("Upss")
                .font(.title2)
                .bold()
                .padding()
            Text("Bu içerik premium kullanıcılar için istersen bir adet reklam izleyerek ilk sayfasını okuyabilirsin. İstersen de bu içerikle birlikte tüm içeriklere sınırsız erişim için premium hesaba geçiş yapabilirsin")
                .font(.body)
            
            Button {
                print("")
            } label: {
                ZStack{
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(.mainlightblue)
                    Text("Reklam İzle")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.white)
                        .padding()
                    
                }
                .padding(.top, 5)
                .padding(.horizontal)
                .padding(.vertical, 0)
            }
            
            Button {
                print("")
            } label: {
                ZStack{
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(.mainorange)
                    Text("Premium Hesaba Yükselt")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.white)
                        .padding()
                    
                }
                .padding(.top, 5)
                .padding(.horizontal)
                .padding(.vertical, 0)
            }

            
        }
        .fixedSize(horizontal: false, vertical: true)
        .padding()
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .overlay{
            VStack{
                HStack{
                    Button {
                        closeDialog(MainVM: MainVM)
                    } label: {
                        Image(systemName: "xmark")
                            .font(.title3)
                            .fontWeight(.medium)
                    }
                    .tint(.black)
                    .padding()
                    Spacer()
                }
                Spacer()
            }
        }
        .shadow(radius: 20)
        .padding()
        .offset(x:0 ,y: MainVM.offset)
        .onAppear{
            withAnimation(.spring()) {
                MainVM.offset = 0
            }
        }
    }
    
    func closeDialog(MainVM: MainVievModel){
        withAnimation {
            MainVM.offset = 1000
            isActivated = false
          // isActivated = false
            
        }
    }
    
}




/*struct DialogContainer_Previews: PreviewProvider {
    static var previews: some View {
        DialogContainer()
    }
}
*/
