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
            }else {
                Text("err")
            }
        }
    }
}
    


struct MyVocabuleryView_Previews: PreviewProvider {
    static var previews: some View {
        MyVocabuleryView()
    }
}

