//
//  MyNotesView.swift
//  LearnEnglishWithStories
//
//  Created by İbrahim Aktaş on 11.06.2023.
//

import SwiftUI

struct MyNotesView: View {
    let geometry = UIScreen.main.bounds.size
    var body: some View {
        
        ScrollView {
            Rectangle()
                .frame(width: geometry.width * 0.9, height: 300)
        }
        
    }
}

struct MyNotesView_Previews: PreviewProvider {
    static var previews: some View {
        MyNotesView()
    }
}
