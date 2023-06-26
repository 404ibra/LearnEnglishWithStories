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





// Protocol for downloading files
protocol Downloadable {
    func download(from url: String, completion: @escaping (URL?, Error?) -> Void)
}

// Protocol for playing audio files
protocol Playable {
    func play(from url: URL?, isStop: Bool)
}

// Concrete implementation of Downloadable protocol
class DownloadManager: Downloadable {
    func download(from url: String, completion: @escaping (URL?, Error?) -> Void) {
        let storageRef = Storage.storage().reference(forURL: url)
        let localURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("currentPage_audio.mp3")
        
        storageRef.write(toFile: localURL!) { url, error in
            completion(url, error)
        }
    }
}

// Concrete implementation of Playable protocol
class PlayManager: Playable {
    private var player = AVPlayer()
    
    func play(from url: URL?, isStop: Bool) {
        if let url = url, isStop {
            self.player = AVPlayer(playerItem: AVPlayerItem(url: url))
            self.player.play()
        } else {
            self.player.pause()
        }
    }
}

// SoundManager adhering to SRP and DIP
class SoundManager: ObservableObject {
    @Published var isDownloading = false
    @Published var localURL: URL?
    
    private let downloadManager: Downloadable
    private let playManager: Playable
    
    init(downloadManager: Downloadable = DownloadManager(), playManager: Playable = PlayManager()) {
        self.downloadManager = downloadManager
        self.playManager = playManager
    }
    
    func downloadAndPlay(from url: String) {
        isDownloading = true
        downloadManager.download(from: url) { [weak self] url, error in
            if let error = error {
                print("Error when downloading mp3 file \(error)")
                return
            } else {
                self?.localURL = url
                self?.isDownloading = false
            }
        }
    }
    
    func playAfterDownload(localurl: URL, isStop: Bool) {
            if self.isDownloading == false {
                self.playManager.play(from: localurl, isStop: isStop)
            } else {return}
    }
}















/*
 
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
 
 
 
 */
