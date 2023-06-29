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
    
    
    var body: some View {

            ScrollView(.vertical) {
                Button {
                    archiveVM.newFavWord()
                    
                } label: {
                    Text("bana bas")
                }
           


               /* ForEach(userData.currentUser?.favWords ?? <#default value#>, id:\.self) { favWord in
                    VocabuleryBoxes(savingWord: favWord)
                }*/

                
            }
    }
}

struct MyVocabuleryView_Previews: PreviewProvider {
    static var previews: some View {
        MyVocabuleryView()
    }
}

