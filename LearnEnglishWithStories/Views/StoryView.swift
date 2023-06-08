//
//  StoryView.swift
//  LearnEnglishWithStories
//
//  Created by İbrahim Aktaş on 30.05.2023.
//

import SwiftUI

struct StoryView: View {
    
    let maxCharactersPerLine = 35
    
    var body: some View {
        let words = Story.stories[0].content.components(separatedBy: " ")
        
        var lines: [[String]] = []
        var currentLine: [String] = []
        var lineLength = 0
        
        for word in words {
            let wordLength = word.count
            
            if lineLength + wordLength > maxCharactersPerLine {
                lines.append(currentLine)
                currentLine = [word]
                lineLength = wordLength + 1 // +1 for space
            } else {
                currentLine.append(word)
                lineLength += wordLength + 1 // +1 for space
            }
        }
        
        if !currentLine.isEmpty {
            lines.append(currentLine)
        }
        
        return VStack(alignment: .leading, spacing: 10) {
            ForEach(lines.indices, id: \.self) { lineIndex in
                HStack(spacing: 5) {
                    ForEach(lines[lineIndex], id: \.self) { word in
                        Text(word)
                            .font(.system(size: 19, weight: .medium, design: .rounded))
                            .onTapGesture {
                                print("Tıklanan kelime: \(word)")
                            }
                    }
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


