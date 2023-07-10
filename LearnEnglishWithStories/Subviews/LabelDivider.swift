//
//  LabelDivider.swift
//  LearnEnglishWithStories
//
//  Created by İbrahim Aktaş on 23.06.2023.
//

import SwiftUI

struct LabelledDivider: View {

    let label: String
    let horizontalPadding: CGFloat
    let color: Color

    init(label: String, horizontalPadding: CGFloat = 20, color: Color = .gray) {
        self.label = label
        self.horizontalPadding = horizontalPadding
        self.color = color
    }

    var body: some View {
        HStack {
            line
            Text(label).foregroundColor(color)
                .font(.system(size: 15, weight: .medium, design: .rounded))
            line
        }
    }

    var line: some View {
        VStack { Divider().background(color) }.padding(horizontalPadding)
    }
}


struct IconLaballedDivider: View {


    let horizontalPadding: CGFloat
    let color: Color
    let iconName: String

    init(iconName: String, horizontalPadding: CGFloat = 16, color: Color = .gray) {
        self.iconName = iconName
        self.horizontalPadding = horizontalPadding
        self.color = color
    }

    var body: some View {
        HStack {
            line
                Image(systemName: iconName).foregroundColor(color)
                .padding(.horizontal, 0)
            line
        }.frame(height: 16)
    }

    var line: some View {
        VStack { Divider().background(color) }.padding(horizontalPadding)
    }
}


