//
//  MyVocabuleryView.swift
//  LearnEnglishWithStories
//
//  Created by İbrahim Aktaş on 11.06.2023.
//

import SwiftUI

struct MyVocabuleryView: View {
    @EnvironmentObject private var userData: AuthViewModel
    @ObservedObject private var archiveVM = FavWordViewModel()
    @State private var refresh: Int = 0
    
    init(){
        archiveVM.newFavWord()
    }
    
    
    var body: some View {
        
        if archiveVM.isLoading {
            ProgressView()
        } else {
            if archiveVM.favWords != nil {
                ScrollView {
                    LazyVStack {
                        ForEach(archiveVM.favWords!, id: \.self){ word in
                            VocabuleryBoxes(savingWord: word["MainLanguage"] ?? "")
                                .padding(.top, 16)
                                
                                
                        }
                    }
                }
            }else if userData.currentUser == nil {
                VStack(alignment: .leading){
                    Text("Görünüşe göre bir hesabın yok")
                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                        .foregroundColor(.black)
                    Text("Arşivi ve diğer birçok özelliği kullanabilmen için bir dakika içinde hemen hesap açabilirsin")
                        .font(.system(size: 15, weight: .light, design: .rounded))
                        .foregroundColor(.gray)
                    Image("onboarding3")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300, height: 300)
                    
                }.padding(.horizontal, 16)
                
            }
        }
    }
}
    


struct MyVocabuleryView_Previews: PreviewProvider {
    static var previews: some View {
        MyVocabuleryView()
    }
}

