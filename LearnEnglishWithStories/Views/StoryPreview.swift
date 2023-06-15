//
//  StoryPreview.swift
//  LearnEnglishWithStories
//
//  Created by İbrahim Aktaş on 8.06.2023.
//

import SwiftUI

struct StoryPreview: View {
    @State var isLocked: Bool = true
    @StateObject private var MainVM = MainVievModel()
    var body: some View {
        NavigationStack {
            VStack(){
                StoryPreviewHeader(PageName: "İstanbul'u Keşfediyoruz")
                ZStack{
                    Image("istanbul_img")
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
                    .padding(.horizontal, 16)
        
                Spacer()
              
               
                    ReadButton(isLocked: isLocked)
                    
                
            
                Spacer()

            }
            .navigationBarBackButtonHidden(true)
          // .frame(maxWidth: .infinity, maxHeight:  .infinity)
           // .background(.black)
        .ignoresSafeArea()
        }//NavigationStack
        
    }
}

struct StoryPreview_Previews: PreviewProvider {
    static var previews: some View {
        StoryPreview()
    }
}

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
}
