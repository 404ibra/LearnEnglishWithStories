//
//  StoryView.swift
//  LearnEnglishWithStories
//
//  Created by İbrahim Aktaş on 27.05.2023.
//

import SwiftUI

struct StoryView: View {
    let sentence = "One nice morning the eggs hatched and out popped six chirply duckling."
    let maxCharacterCountPerLine = 40 // Her satırda gösterilecek maksimum harf sayısı
    
    var body: some View {
        let characters = Array(sentence)
        var lines: [[Character]] = []
        var currentLine: [Character] = []
        var currentCharacterCount = 0
        
        for character in characters {
            if currentCharacterCount + 1 > maxCharacterCountPerLine {
                lines.append(currentLine)
                currentLine = []
                currentCharacterCount = 0
            }
            
            currentLine.append(character)
            currentCharacterCount += 1
        }
        
        if !currentLine.isEmpty {
            lines.append(currentLine)
        }
        
        return VStack(alignment: .leading, spacing: 10) {
            ForEach(lines, id: \.self) { line in
                Text(String(line))
                    .font(.system(size: 19, weight: .medium, design: .rounded))
                    .onTapGesture {
                        print("Tıklanan satır: \(String(line))")
                    }
            }
        }
        .padding()
    }
}

struct StoryView_Previews: PreviewProvider {
    static var previews: some View {
        StoryView()
    }
}
