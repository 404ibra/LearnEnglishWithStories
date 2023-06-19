//
//  ArticlesViewModel.swift
//  LearnEnglishWithStories
//
//  Created by İbrahim Aktaş on 18.06.2023.
//

import Foundation
import Firebase
import AVFoundation
import FirebaseStorage

class ArticleViewModel: ObservableObject {
    @Published var article = [Article]()
    
    func getData() {
        let db = Firestore.firestore()
        db.collection("Articles").getDocuments { snapshot, error in
            if error == nil {
                if let snapshot = snapshot {
                    DispatchQueue.main.async {
                        self.article = snapshot.documents.map { article in
                            return Article(id: article.documentID,
                                         storynumber: article["ArticleNumber"] as? Int ?? 0,
                                         name: article["ArticleName"] as? String ?? "",
                                         images: article["ArticleImage"] as? String ?? "",
                                         level: article["Level"] as? String ?? "",
                                         sounds: article["ArticleSounds"] as? [String] ?? [""],
                                         contentnames: article["ContentNames"] as? [String] ?? [""],
                                         content: article["Content"] as? [String] ?? [""],
                                         translate: article["Translate"] as? [String] ?? [""])
                        }//map
                    }//DispatchQueue.main.async
                }//if
            }else {
                //handle error
            }//else
        }// getdocuments
    }//getData func end
}//ViewModel endup


class ArticleManager: ArticleViewModel {
    func getContent(for currentPage: Int, storyIndex: Int) -> [String]{
        getData()
        guard article.indices.contains(storyIndex) else {
            return []
        }
        guard currentPage >= 0 && currentPage < article[storyIndex].content.count
        else {
            return []
        }
        return article[storyIndex].content[currentPage].components(separatedBy: " ")
    }
}


class TranslateManager: ArticleViewModel {
    func getTranslate(for currentPage: Int, storyIndex: Int) -> [String]{
        getData()
        guard article.indices.contains(storyIndex) else {
            return []
        }
        guard currentPage >= 0 && currentPage < article[storyIndex].translate.count
        else {
            return []
        }
        return article[storyIndex].translate[currentPage].components(separatedBy: " ")
    }
}





class SoundManager: ObservableObject{
    
    var player = AVPlayer()

    func downloadAndPlay(audio: String, stopButton: Bool){
        let storage = Storage.storage().reference(forURL: audio)
        storage.downloadURL { [self] (url, error) in
            if error != nil {
                print("error var \(String(describing: error?.localizedDescription))")
            } else if stopButton {
                player = AVPlayer(playerItem: AVPlayerItem(url: url!))
                player.play()
            }else {
                player.pause()
            }
        }
    }
}
