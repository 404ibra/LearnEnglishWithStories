//
//  VocabularyView.swift
//  LearnEnglishWithStories
//
//  Created by İbrahim Aktaş on 7.06.2023.
//

import SwiftUI

struct VocabularyView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 0){
            ScrollView{
                PageHeader(PageName: "Kelimelerim")
            }
            Spacer()
        }//VStack
           // .frame(maxWidth: .infinity, maxHeight: .infinity)
           // .background(.black)
            .padding(.top, 0)
            .ignoresSafeArea()
        
    }
}

struct VocabularyView_Previews: PreviewProvider {
    static var previews: some View {
        VocabularyView()
    }
}
