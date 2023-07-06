//
//  AuthViewModel.swift
//  LearnEnglishWithStories
//
//  Created by İbrahim Aktaş on 23.06.2023.
//

import FirebaseFirestoreSwift
import Firebase
import Foundation




protocol AuthenticationProtocol {
    func signIn(withEmail email: String, password: String) async throws
    func signUp(email: String, password: String, fullname: String) async throws
    func signOut() async throws
}

protocol UserFetchProtocol {
    func fetchUser() async throws
}

@MainActor
class AuthViewModel: ObservableObject, AuthenticationProtocol, UserFetchProtocol {
  

    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: UserModel?
    
    init() {
        self.userSession = Auth.auth().currentUser
        Task { await fetchUser() }
    }

    func signIn(withEmail email: String, password: String) async throws {
        do{
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            print("login yapıldı \(result.user.uid)")
        } catch {
            print("Debug : While login \(error.localizedDescription)")
        }
    }
    
    func signUp(email: String, password: String, fullname: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            let user = UserModel(
                id: result.user.uid,
                fullName: fullname,
                isEmail: email,
                isPremium: false,
                lastStories: nil,
                favWords: nil,
                favStories: nil,
                medals: nil,
                level: nil,
                history: nil)
            let encodedUser = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("Users").document(user.id).setData(encodedUser)
            await fetchUser()
        } catch {
            
        }
    }
    
    func signOut() async throws {
        do {
            try Auth.auth().signOut()
            self.userSession = nil
            self.currentUser = nil
        } catch {
            print("Debug: Failed to sign out with error : \(error.localizedDescription)")
        }
    }
    
    func fetchUser() async {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        do {
            guard let snapshot = try? await Firestore.firestore().collection("Users").document(uid).getDocument() else { return }
            self.currentUser = try snapshot.data(as: UserModel.self)
        } catch {
            print("Fetch user data error: \(error.localizedDescription)")
        }
    }
}

protocol FavWordViewModelInterface {
    func newFavWord()
}

class FavWordViewModel: ObservableObject, FavWordViewModelInterface {
    
    
    @Published var favWords:  [[String: String]]?
    func newFavWord(){
        Firestore.firestore().collection("Users").document(Auth.auth().currentUser!.uid).getDocument { snapshot, error in
            guard let snapshot = snapshot?.data() else {
                return
            }
            let favWords = snapshot["favWords"]  as? [[String: String]]
            DispatchQueue.main.async {
             self.favWords = favWords
         }
        }
    }
}

class FavArticlesViewModel: ObservableObject {
    @Published var favArticlesID: [String]?
    @Published var favArticles: [Article]?
    
    
    func fetchFavArticles(){
        Firestore.firestore().collection("Users").document(Auth.auth().currentUser!.uid).getDocument { snapshot, error in
            guard let snapshot = snapshot?.data() else { return }
            let favArticlesID = snapshot["favStories"] as? [String]
            DispatchQueue.main.async {
                self.favArticlesID = favArticlesID
            }
        }
        
    }
   
    
    
    //TO DO append articles in favArticles
    func showFavArticles(){
        fetchFavArticles()
        guard let favArticlesID = favArticlesID else { return }
        for documentID in favArticlesID {
            Firestore.firestore().collection("Articles").document(documentID).getDocument { snapshot, error in
                guard let snapshot = snapshot?.data() else { return }
                
                
            }
        }
        
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
