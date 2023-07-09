//
//  ArticlesViewModel.swift
//  LearnEnglishWithStories
//
//  Created by İbrahim Aktaş on 18.06.2023.
//

import Foundation
import Firebase
import FirebaseStorage

class ArticleViewModel: ObservableObject {
    @Published var article = [Article]()
    @Published var isLoading: Bool = true

    private let db = Firestore.firestore()
    
    init(){
       getData()
    }
    
    func getData() {
        db.collection("Articles").getDocuments { snapshot, error in
            if error == nil {
                if let snapshot = snapshot {
                    DispatchQueue.main.async {
                        self.article = snapshot.documents.map { article in
                            return Article(id: article.documentID,
                                           articleid: article["ArticleID"] as? String ?? "",
                                           storynumber: article["ArticleNumber"] as? Int ?? 0,
                                           name: article["ArticleName"] as? [String : String] ?? ["" : ""],
                                           readnow: article["ReadNow"] as? Bool ?? false,
                                           subject: article["ArticleSubject"] as? [String : String] ?? ["" : ""],
                                           free: article["ArticleFree"] as? Bool ?? false,
                                           duration: article["ArticleDuration"] as? String ?? "",
                                           summary: article["ArticleSummary"] as? [String : String] ?? ["" : ""],
                                           images: article["ArticleImage"] as? String ?? "",
                                           level: article["Level"] as? [String : String] ?? ["" : ""],
                                           sounds: article["ArticleSounds"] as? [String] ?? [""],
                                           content: article["Content"] as? [String: [String]] ?? ["" : [""]])
                                         
                        }//map
                        self.isLoading = false
                        print(self.article)
                    }//DispatchQueue.main.async
                }//if
            }else {
                //handle error
            }//else
        }// getdocuments
    }//getData func end
}
    
    



    


/*
 
 func sameArticles(articleSubject: String) {
     db.collection("Articles").whereField("ArticleSubject", isEqualTo: articleSubject).getDocuments { snapshot, error in
         if let error = error {
             // Hata durumunu ele al
             print("Hata: \(error.localizedDescription)")
             return
         }
         
         if let snapshot = snapshot {
             DispatchQueue.main.async {
                 self.samearticles = snapshot.documents.map { article in
                     return Article(id: article.documentID,
                                    articleid: article["ArticleID"] as? String ?? "",
                                    storynumber: article["ArticleNumber"] as? Int ?? 0,
                                    name: article["ArticleName"] as? [String : String] ?? ["" : ""],
                                    readnow: article["ReadNow"] as? Bool ?? false,
                                    subject: article["ArticleSubject"] as? [String : String] ?? ["" : ""],
                                    free: article["ArticleFree"] as? Bool ?? false,
                                    duration: article["ArticleDuration"] as? String ?? "",
                                    summary: article["ArticleSummary"] as? [String : String] ?? ["" : ""],
                                    images: article["ArticleImage"] as? String ?? "",
                                    level: article["Level"] as? [String : String] ?? ["" : ""],
                                    sounds: article["ArticleSounds"] as? [String] ?? [""],
                                   
                                    content: article["Content"] as? [String: [String]] ?? ["" : [""]])
                                   // translate: article["Translate"] as? [String] ?? [""])
                 }//map
                 self.isLoading = false
             }//DispatchQueue.main.async
         }
     }// getDocuments
 }//getData func end


 
 
 */


    /*
     
     func readnow() {
         db.collection("Articles").whereField("ReadNow", isEqualTo: true).getDocuments { snapshot, error in
             if let error = error {
                 // Hata durumunu ele al
                 print("Hata: \(error.localizedDescription)")
                 return
             }
             
             if let snapshot = snapshot {
                 DispatchQueue.main.async {
                     self.readnowArticles = snapshot.documents.map { article in
                         return Article(id: article.documentID,
                                        articleid: article["ArticleID"] as? String ?? "",
                                        storynumber: article["ArticleNumber"] as? Int ?? 0,
                                        name: article["ArticleName"] as? [String : String] ?? ["" : ""],
                                        readnow: article["ReadNow"] as? Bool ?? false,
                                        subject: article["ArticleSubject"] as? [String : String] ?? ["" : ""],
                                        free: article["ArticleFree"] as? Bool ?? false,
                                        duration: article["ArticleDuration"] as? String ?? "",
                                        summary: article["ArticleSummary"] as? [String : String] ?? ["" : ""],
                                        images: article["ArticleImage"] as? String ?? "",
                                        level: article["Level"] as? [String : String] ?? ["" : ""],
                                        sounds: article["ArticleSounds"] as? [String] ?? [""],
                                        content: article["Content"] as? [String: [String]] ?? ["" : [""]])
                     }//map
                     self.isLoading = false
                 }//DispatchQueue.main.async
             }
         }// getDocuments
     }//getData func end
     
     
     */
    
    
    
    
    
    







/*
 --ESKİ TRANSLATE MANAGER BAKILABİLİR...
class TranslateManager: ArticleViewModel {
 getData()
    func getTranslate(for currentPage: Int, storyIndex: Int) -> [String]{
        getData()
        guard article.indices.contains(storyIndex) else {
            return []
        }
        guard currentPage >= 0 && currentPage < article.first(where: { $0.storynumber == storyIndex})?.translate.count ?? 0
        else {
            return []
        }
        return article.first(where: { $0.storynumber == storyIndex})?.translate[currentPage].components(separatedBy: " ") ?? [""]
    }
}


*/
    
    
    
    
    
    
