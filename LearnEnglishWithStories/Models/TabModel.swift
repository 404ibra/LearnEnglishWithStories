//
//  TabModel.swift
//  LearnEnglishWithStories
//
//  Created by İbrahim Aktaş on 7.06.2023.
//

import Foundation
import SwiftUI


struct HomeTabItem: Identifiable{
    let id = UUID()
    let page: AnyView
    let model: TabModel
    
    static let tabItems: [HomeTabItem] = [
        HomeTabItem(page: AnyView(MainView()), model: TabModel(title: .search, icon: .search)),
        HomeTabItem(page: AnyView(VocabularyView()), model: TabModel(title: .vocabulary, icon: .vocabulary)),
        HomeTabItem(page: AnyView(ProfileView()), model: TabModel(title: .profile, icon: .profile)),
        HomeTabItem(page: AnyView(SettingsView()), model: TabModel(title: .other, icon: .other))
    ]
    
}

struct TabModel {
    let title: StringItems.TabNames
    let icon: IconItems.Tabs
}
