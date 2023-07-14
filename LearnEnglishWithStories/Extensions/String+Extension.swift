//
//  String+Extension.swift
//  LearnEnglishWithStories
//
//  Created by İbrahim Aktaş on 14.07.2023.
//

import Foundation

extension String {
    func editSelectedWord() -> String {
        let localizedString = NSLocalizedString(self, comment: "")
        var capatilzedString = localizedString.capitalized
        
        if let lastCharacter = capatilzedString.last, lastCharacter.isPunctuation {
            capatilzedString.removeLast()
        }
         return capatilzedString
    }
}
