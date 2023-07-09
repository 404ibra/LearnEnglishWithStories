//
//  SoundViewModel.swift
//  LearnEnglishWithStories
//
//  Created by İbrahim Aktaş on 9.07.2023.
//

import Foundation
import AVFoundation
import FirebaseStorage


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
