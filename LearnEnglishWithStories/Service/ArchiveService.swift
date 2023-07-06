//
//  ArchiveService.swift
//  LearnEnglishWithStories
//
//  Created by İbrahim Aktaş on 28.06.2023.
//

import Foundation
import Firebase

struct ArchiveService {
    
    func newFavWords(MainLanguage: String, LearningLanguage: String ){
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let replyDictionary = ["MainLanguage": MainLanguage, "LearningLanguage":LearningLanguage]
        
        Firestore.firestore().collection("Users")
            .document(uid)
            .updateData(["favWords" : FieldValue.arrayUnion([replyDictionary])])
    }
    
    
    func deleteWord(MainLanguage: String, LearningLanguage: String ){
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let replyDictionary = ["MainLanguage": MainLanguage, "LearningLanguage":LearningLanguage]
        Firestore.firestore().collection("Users")
            .document(uid)
            .updateData(["favWords" : FieldValue.arrayRemove([replyDictionary])])
        
    }
    
    func addFavArticle(ArticleID: String){
        guard let uid = Auth.auth().currentUser?.uid else { return }
        Firestore.firestore().collection("Users")
            .document(uid)
            .updateData(["favStories" : FieldValue.arrayUnion([ArticleID])])
    }
    
    func removeFavArticle(ArticleID: String){
        guard let uid = Auth.auth().currentUser?.uid else { return }
        Firestore.firestore().collection("Users")
            .document(uid)
            .updateData(["favStories" : FieldValue.arrayRemove([ArticleID])])
    }

    
    
}
/*
class FetchWordsArchive: ObservableObject {

    
    @Published var dataArray: [[String: String]] = []
    

    func fetchWords(){
        guard let uid = Auth.auth().currentUser?.uid else { return }
        Firestore.firestore().collection("Users").document(uid).getDocument { snapshot, error in
            if error == nil {
                snapshot.
            }
        }
        
    }
}
*/
