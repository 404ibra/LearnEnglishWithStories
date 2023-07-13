//
//  CategoryView.swift
//  LearnEnglishWithStories
//
//  Created by İbrahim Aktaş on 13.07.2023.
//

import SwiftUI

struct CategoryView: View {
    
    let geometry = UIScreen.main.bounds
    
    var body: some View {
        NavigationStack{
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack{
                    ForEach(Category.categories.indices,id: \.self) { index in
                        NavigationLink {
                            CategoryDetails(categorySubject: Category.categories[index].name)
                        } label: {
                            ZStack(alignment: .bottomLeading){
                                Image(Category.categories[index].image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: geometry.size.width * 0.85, height: 300)
                                    .cornerRadius(8)
                                    .padding(.trailing, 6)
                                    
                                Text(Category.categories[index].name)
                                    .font(.system(size: 23, weight: .bold, design: .rounded))
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 24)
                                    .padding(.vertical, 24)
                            }
                        }

                        
                    }
                }.padding(.leading, 16)
            }
        }
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView()
    }
}


struct Category: Identifiable {
    var id = UUID()
    var image: String
    var name: String
    
    static var categories: [Category] = [
        Category(image: "complo", name: "Komplo Teorileri"),
        Category(image: "fun", name: "Eğlence"),
        Category(image: "culture", name: "Kültür"),
        Category(image: "science", name: "Bilim")
    ]
    
}
