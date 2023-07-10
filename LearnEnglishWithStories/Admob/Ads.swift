//
//  Ads.swift
//  LearnEnglishWithStories
//
//  Created by İbrahim Aktaş on 10.07.2023.
//

import GoogleMobileAds

class Reward: NSObject, GADFullScreenContentDelegate, ObservableObject {
    @Published var rewardLoaded: Bool = false
    var rewardedAd: GADRewardedAd?

    override init() {
        super.init()
    }

    //Ödüllü reklamlar yükleniyor
    func LoadReward() {
        GADRewardedAd.load(withAdUnitID: "ca-app-pub-3940256099942544/1712485313", request: GADRequest()) { (ad, error) in
            if let _ = error {
                print("😭: okunamadı")
                self.rewardLoaded = false
                return
            }
            print("😍: başarıyla yüklend")
            self.rewardLoaded = true
            self.rewardedAd = ad
            self.rewardedAd?.fullScreenContentDelegate = self
        }
    }

    // Ödüllü reklamları görüntüleme
    func ShowReward() {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let root = windowScene.windows.first?.rootViewController,
         let ad = rewardedAd {
            ad.present(fromRootViewController: root, userDidEarnRewardHandler: {
                print("😍:ödül kazandı")
                self.rewardLoaded = false
            })
        } else {
            print("😭: Reklam hazır değildi")
            self.rewardLoaded = false
            self.LoadReward()
        }
    }
}
