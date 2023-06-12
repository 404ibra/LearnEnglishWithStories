//
//  View+Extension.swift
//  LearnEnglishWithStories
//
//  Created by İbrahim Aktaş on 9.06.2023.
//

import Foundation
import SwiftUI


struct RoundedCornerRectangle: Shape {
    var radius: CGFloat
    var corners: UIRectCorner
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}


extension View {
    func roundedCornerRectangle(radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCornerRectangle(radius: radius, corners: corners ))
    }
    
    func alignH(alignment: Alignment) -> some View {
        self
            .frame(maxWidth: .infinity, alignment: alignment)
    }
}
