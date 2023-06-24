//
//  MyVocabuleryView.swift
//  LearnEnglishWithStories
//
//  Created by İbrahim Aktaş on 11.06.2023.
//

import SwiftUI

struct MyVocabuleryView: View {
    @EnvironmentObject private var userData: AuthViewModel
    
    var body: some View {

            ScrollView(.vertical) {
                ForEach(userData.currentUser?.favWords ?? [""], id:\.self) { favWord in
                    VocabuleryBoxes(savingWord: favWord)
                }

                
            }
    }
}

struct MyVocabuleryView_Previews: PreviewProvider {
    static var previews: some View {
        MyVocabuleryView()
    }
}

