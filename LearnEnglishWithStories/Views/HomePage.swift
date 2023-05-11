//
//  HomePage.swift
//  LearnEnglishWithStories
//
//  Created by İbrahim Aktaş on 11.05.2023.
//

import SwiftUI

struct HomePage: View {
    @State var FeaturedList: Int = 0
    let sliderTimer = Timer.publish(every: 2, on: .main, in: .common).autoconnect()
    var body: some View {
        TabView(selection: $FeaturedList) {
            ForEach(0...3, id: \.self){i in
                Image("featured_img_\(i)")
                    .resizable()
                    .tag(i)
            }
        }//TabView
        
        
        .tabViewStyle(PageTabViewStyle())
        .frame(height: UIScreen.main.bounds.height/3)
        .foregroundColor(.red)
        .onReceive(sliderTimer) { input in
            if FeaturedList < 3 {
                FeaturedList += 1
            }else{
                FeaturedList = 0
            }
        }
        .onTapGesture(count: 1 , perform: {
            sliderTimer.upstream.connect().cancel()

        })
        }
        
    }


struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}
