//
//  AuthViewModel.swift
//  LearnEnglishWithStories
//
//  Created by İbrahim Aktaş on 23.06.2023.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

@MainActor


protocol AuthenticationProtocol {
    func signIn(withEmail email: String, password: String) async throws
    func signUp(email: String, password: String, fullname: String) async throws
}

protocol UserFetchProtocol {
    func fetchUser() async throws
}




class AuthViewModel: ObservableObject, AuthenticationProtocol, UserFetchProtocol {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: UserModel?
    

    func signIn(withEmail email: String, password: String) async throws {
        print("sign in")
    }
    
    func signUp(email: String, password: String, fullname: String) async throws {
        let result = try await Auth.auth().createUser(withEmail: email, password: password)
        self.userSession = result.user
        
        let user = UserModel(id: result.user.uid, fullName: fullname, isEmail: email, isPremium: false, lastStories: nil, favWords: nil, favStories: nil, medals: nil, level: nil, history: nil)
        
        let encodedUser = try Firestore.Encoder().encode(user)
        try await Firestore.firestore().collection("Users").document(user.id).setData(encodedUser)
    }
    
    func signAuth() async throws {
        // Burada kullanıcı kimlik doğrulaması yapılabilir.
    }
    
    func fetchUser() async throws {
        
    }
}








/*
class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: UserModel?
    
    init(){
        
    }
    
    func signIn(withEmail email: String, password: String) async throws {
        print("sign in")
    }
    
    func signUp(email: String, password: String, fullname: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            let user = UserModel(id: result.user.uid, fullName: fullname, isEmail: email, isPremium: false, lastStories: nil, favWords: nil, favStories: nil, medals: nil, level: nil, history: nil)
            let encodedUser = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("Users").document(user.id).setData(encodedUser)
            
        } catch {
            print("Occur error when user creating \(error.localizedDescription)")
        }
    }
    
    func signAuth() async throws {
        
    }
    
    func fetchUser() async throws {
        
    }
}
*/
