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
    
    var watchAdFunc: () -> Void
    
    var body: some View {
        VStack{
            Text("Reklamsız İçerik Deneyimi")
                .font(.title2)
                .bold()
                .padding()
            Text("Kesintisiz deneyim ve birçok özellik için premium olabilir veya reklam izleyerek devam edebilirsiniz")
                .font(.system(size: 17, design: .rounded))
            
            Button {
                print("")
            } label: {
                HStack{
                    Spacer()
                    Text("Premium ol")
                        .font(.system(size: 16, weight: .medium, design: .rounded))
                        .foregroundColor(.white)
                    Spacer()
                } .padding(EdgeInsets(top: 14, leading: 20, bottom: 14, trailing: 20))
                
                
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                        
                            .foregroundColor(Color(hex: "fa6b35"))
                            .padding(.horizontal, 16)
                        
                    ).padding(.top, 5)
                 
            }
      
            Button {
                watchAdFunc()
              
            } label: {
                HStack{
                    Spacer()
                    Text("Reklam izleyerek devam et")
                        .font(.system(size: 16, weight: .medium, design: .rounded))
                        .foregroundColor(.mainorange)
                    Spacer()
                } .padding(EdgeInsets(top: 14, leading: 20, bottom: 14, trailing: 20))
                
                
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .strokeBorder(Color(hex: "fa6b35"), lineWidth: 0.3)
                            .padding(.horizontal, 16)
                        
                    )
            }

        }
        .fixedSize(horizontal: false, vertical: true)
        .padding()
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .overlay{
            VStack{
                HStack{
                    Spacer()
                    Button {
                        closeDialog(MainVM: MainVM)
                    } label: {
                        Image(systemName: "xmark")
                            .font(.title3)
                            .fontWeight(.light)
                            .foregroundColor(.gray)
                    }
                    .tint(.black)
                    .padding()
                  
                }.padding(.bottom, 16)
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


/*

struct DialogContainer_Previews: PreviewProvider {
    static var previews: some View {
        DialogContainer(isActivated: .constant(true))
    }
}

*/
