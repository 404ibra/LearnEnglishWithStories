//
//  TextFieldAnimation.swift
//  LearnEnglishWithStories
//
//  Created by İbrahim Aktaş on 10.06.2023.
//


import SwiftUI

class TextFieldAnimation {
    struct ViewAnimationModifier: ViewModifier {
        var value: Bool
        @ViewBuilder
        func body(content: Content) -> some View {
            if #available(iOS 15.0, *){
                content.animation(.easeIn(duration: 2), value: value)
            }else {  //iOS < 15.0
                content.animation(.easeIn(duration: 2))
            }
        }
    }
}
