//
//  MedalView.swift
//  LearnEnglishWithStories
//
//  Created by İbrahim Aktaş on 12.06.2023.
//

import SwiftUI

struct MedalView: View {
    var body: some View {
        VStack {
            Text("Madalyalar")
                .ProfileOptionButtonTextFont()
                .alignH(alignment: .leading)
                .padding(.vertical, 32)
                .padding(.horizontal, 16)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack{
                    ForEach(MedalModel.medals) { medal in
                        VStack{
                            ZStack{
                                Circle()
                                    .frame(height: 80)
                                    .foregroundColor(medal.CircleOutsideColor)
                                Circle()
                                    .frame(height: 50)
                                    .foregroundColor(medal.CircleInsideColor)
                                Image(medal.icon)
                                    .resizable()
                                    .frame(height: 45)
                                    .frame(width: 45)
                                medal.lockedMedal == false
                                ? nil
                                : Circle()
                                    .frame(height: 80)
                                    .foregroundColor(.gray.opacity(0.7))
                            }
                            Text(medal.name)
                                .font(.system(size: 17, weight: .medium, design: .rounded))
                        }//VStack inside foreach
                        .padding(.leading, 16)
                    }//ForEach
                }
            }//ScrollView
            .padding(.vertical, 12)
            .padding(.horizontal,16)
        }//VStack
    }
}

struct MedalView_Previews: PreviewProvider {
    static var previews: some View {
        MedalView()
    }
}
