//
//  StoryPreview.swift
//  LearnEnglishWithStories
//
//  Created by İbrahim Aktaş on 8.06.2023.
//

import SwiftUI

struct StoryPreview: View {
    @State var isLocked: Bool = true
    @StateObject  var MainVM = MainVievModel()
    @State var isActivate: Bool = false
    
    var StoryModel = Story.stories
    let index: Int
    init(index: Int) {
        self.index = index
    }
    
    var body: some View {
        ZStack{
            NavigationStack {
                    VStack{
                        StoryPreviewHeader(PageName: StoryModel[index].name, isActiveted: $isActivate)
                       
                        ScrollView {
                            HStack{
                                Text(StoryModel[index].level)
                                    .font(.system(size: 18, weight: .light, design: .rounded))
                                    .alignH(alignment: .leading)
                                Spacer()
                                Image(systemName: "bookmark")
                            }
                            .padding(.horizontal, 16)


                            ZStack{
                                Image(StoryModel[index].images)
                                    .resizable()
                                    .frame(height: 240)
                                    .frame(width: UIScreen.main.bounds.width *  0.95)
                                    .cornerRadius(10)
                                    .padding(.top, 16)
                                //When use buy premium account this locked open
                                isLocked ? nil : ZStack{
                                    Rectangle()
                                        .frame(height: 240)
                                        .frame(width: UIScreen.main.bounds.width *  0.95)
                                        .foregroundColor(.gray.opacity(0.75))
                                        .cornerRadius(10)
                                        .padding(.top, 16)
                                     Image(systemName: "lock.fill")
                                        .resizable()
                                        .frame(width: 40)
                                        .frame(height: 50)
                                        .foregroundColor(Color(hex: "#184b74").opacity(0.85))
                                }
                              

                            }
                            Text("Bu serimizle birlikte üç imparatorluğun başkentliğni yapmış avrupanın en büyük metropolü olan İstanbul'un geçmişine ve geleceğine ışık tutuyoruz")
                                .DescriptionFont()
                                .padding(.horizontal, 10)
                                .padding(.vertical, 5)
                                
                           
                            Text("İçerik:")
                                .alignH(alignment: .leading)
                                .padding(.horizontal, 16)
                                .font(.system(size: 17, weight: .medium, design: .rounded))
                           
                            ForEach(StoryModel[index].contentnames, id: \.self) { contentnames in
                                Text("-\(contentnames)")
                            }
                            .alignH(alignment: .leading)
                            .padding(.horizontal, 16)
                            //ReadButton(isLocked: isLocked)
                    }
                }
                .navigationBarBackButtonHidden(true)
                .ignoresSafeArea()
            }//NavigationStack
            if isActivate {
                      DialogContainer(isActivated: $isActivate)
          }
        }
        
    }
}


struct StoryPreview_Previews: PreviewProvider {
    static var previews: some View {
        StoryPreview(index: 0)
    }
}



/*
struct ReadButton: View {
    @StateObject private var MainVM = MainVievModel()
    var isLocked: Bool
    var body: some View {
        Button {
            MainVM.readButton = true
        } label: {
            ZStack{
                Rectangle()
                    .frame(width: UIScreen.main.bounds.width * 0.8)
                    .frame(height: UIScreen.main.bounds.width * 0.17)
                    .foregroundColor(.mainorange)
                    .cornerRadius(15)
                Text(isLocked ? "Oku" : "Premium Hesaba Yükselt")
                    .LargeButtonFont()
            }
            
        }
        .padding()
            .navigationDestination(isPresented: $MainVM.readButton) {
                StoryScreen(storiesIndex: 0)
            }
            
    }
}*/
