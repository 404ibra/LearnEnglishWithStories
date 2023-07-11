//
//  OnboardView.swift
//  LearnEnglishWithStories
//
//  Created by İbrahim Aktaş on 11.07.2023.
//

import SwiftUI

struct OnboardView: View {
    var body: some View {
        NavigationStack{
            VStack{
                NavigationLink {
                    AuthenticationWithMail()
                } label: {
                    Text("Giriş Yap")
                }
                NavigationLink {
                    SignuupOpinion()
                } label: {
                    Text("Kayıt Ol")
                }


            }
        }
    }
}

struct OnboardView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardView()
    }
}
