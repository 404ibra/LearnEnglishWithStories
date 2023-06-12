//
//  MedalModel.swift
//  LearnEnglishWithStories
//
//  Created by İbrahim Aktaş on 12.06.2023.
//

import Foundation
import SwiftUI

struct MedalModel: Identifiable{
    var id =  UUID()
    var name: String
    var icon: String
    var CircleOutsideColor: Color
    var CircleInsideColor: Color
    var lockedMedal: Bool
    
    
    static var medals: [MedalModel] = [
        MedalModel(name: "İstanbulun Fatih'i", icon: "galata-tower", CircleOutsideColor: .red.opacity(0.5), CircleInsideColor: .white, lockedMedal: true),
        MedalModel(name: "Antik Mısır Keşifçisi", icon: "sphinx", CircleOutsideColor: Color(hex: "ffc739"), CircleInsideColor: Color(hex: "b93d31"), lockedMedal: false),
        MedalModel(name: "Elma Neden Düştü", icon: "isaac-newton", CircleOutsideColor: Color(hex: "7dd9ff"), CircleInsideColor: Color(hex: "cf301c"), lockedMedal: true)
    ]
    
}
