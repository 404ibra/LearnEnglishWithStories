//
//  MyVocabuleryView.swift
//  LearnEnglishWithStories
//
//  Created by İbrahim Aktaş on 11.06.2023.
//

import SwiftUI

struct MyVocabuleryView: View {
    var body: some View {

            ScrollView(.vertical) {
                VocabuleryBoxes()
                VocabuleryBoxes()
                VocabuleryBoxes()
                VocabuleryBoxes()
                VocabuleryBoxes()
                
            }
    }
}

struct MyVocabuleryView_Previews: PreviewProvider {
    static var previews: some View {
        MyVocabuleryView()
    }
}

