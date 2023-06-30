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
    @ObservedObject private var x = ArchiveViewModel()
    
    init(){
        archiveVM.newFavWord()
    }
    
    var body: some View {

                if archiveVM.favWords != nil {
                    ScrollView {
                        ForEach(archiveVM.favWords!, id: \.self){ word in
                            VocabuleryBoxes(savingWord: word["MainLanguage"] ?? "")
                        }
                    }
                }else {
                    Text("err")
                }
    }
}


struct MyVocabuleryView_Previews: PreviewProvider {
    static var previews: some View {
        MyVocabuleryView()
    }
}

