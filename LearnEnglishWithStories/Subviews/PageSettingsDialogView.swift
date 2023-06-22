//
//  PageSettingsDialogView.swift
//  LearnEnglishWithStories
//
//  Created by İbrahim Aktaş on 22.06.2023.
//

import SwiftUI

struct PageSettingsDialogView: View {
    @StateObject private var MainVM = MainVievModel()
    @Binding var isActivated: Bool
    
    @State private var eyeSaverMode: Bool = false
    
    var body: some View {
        VStack{
            Text("Hikaye Ayarları")
                .font(.title2)
                .bold()
                .padding()
            
            Toggle("Göz Koruma Modu", isOn: $eyeSaverMode)
                .font(.system(size: 16, weight: .medium, design: .rounded))
                .toggleStyle(SwitchToggleStyle(tint: .maindarkblue))
                .padding()
            
            Button {
                print("")
            } label: {
                ZStack{
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(.mainorange)
                    Text("Hesabımı Yükselt")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.white)
                        .padding()
                }
                .padding(.top, 5)
                .padding(.horizontal)
                .padding(.vertical, 0)
            }
            Text("Reklam izleyerek devam et")
                .font(.system(size: 13))
                .padding(.vertical, 8)
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




struct PageSettingsDialogView_Previews: PreviewProvider {
    static var previews: some View {
        PageSettingsDialogView(isActivated: .constant(true))
    }
}

