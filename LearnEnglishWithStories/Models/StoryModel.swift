//
//  StoryModel.swift
//  LearnEnglishWithStories
//
//  Created by İbrahim Aktaş on 8.06.2023.
//

import Foundation


/*Story Model Sırasıyla eklenecekler

 -Ortalama okuma süresi
 -Seviye hk.
 -Metinin ön açıklamassı
 -metnin türü (teknoloji, spor, biyoloji.. )

 
 */

struct Story: Identifiable {
    var id = UUID()
    var storynumber: Int
    var name: String
    var images: String
    var level: String
    var contentnames: [String]
    var content: [String]
    var translate: [String]

    static var stories: [Story] = [
        Story(
            storynumber: 0,
            name: "İstanbul Gezisi",
              images: "istanbul_img",
              level:  "Orta Düzey",
                contentnames: ["Yerebatan Sarnıcı", "Ayasofyanın Gizemler", "Boğazın Donması" ],
              content: [
                "The Basilica Cistern, located in Istanbul, Turkey, is an ancient underground water storage structure. It was built during the reign of Emperor Justinian I in the 6th century AD and served as a reservoir for the Byzantine Great Palace.",
                "Covering an area of approximately 9,800 square meters, the Basilica Cistern is an impressive architectural wonder. It consists of a vast chamber supported by a forest of 336 marble columns, each measuring about 9 meters in height. These columns were mostly recycled from older structures, giving the cistern a unique and eclectic appearance."
              ],
             translate: [
                "Yerebatan Sarnıcı, İstanbul, Türkiye'de bulunan antik bir yeraltı su depolama yapısıdır. İmparator Justinianus I döneminde, 6. yüzyılda inşa edilmiş olup Bizans Büyük Sarayı için bir su deposu olarak hizmet etmiştir.",
               " Yaklaşık 9.800 metrekarelik bir alanı kaplayan Yerebatan Sarnıcı, etkileyici bir mimari harikasıdır. Her biri yaklaşık 9 metre yüksekliğinde 336 mermer sütundan oluşan bir ormanla desteklenen geniş bir odadan oluşur. Bu sütunlar çoğunlukla eski yapılardan geri dönüştürülerek sarnıcın eşsiz ve eklektik bir görünüm kazanması sağlanmıştır."
             ]
             ),
            Story(
                storynumber: 1,
                name: "Krallar Mezarlığı",
                images: "egyptian.piramide",
                level: "Orta Düzey",
                contentnames: ["Kral Mezarlığı", "Nil Nehri", "Firavun Tutankomon" ],
                content: [
                "Thousands of years ago, the Ancient Egyptian civilization flourished on the fertile lands of the Nile River. During this time, Pharaohs were considered divine rulers and were revered throughout their lives. However, death was not seen as an end for them, but rather as the beginning of an eternal journey.The royal necropolis in Ancient Egypt was one of the places constructed to facilitate this eternal transition. This necropolis is famous for its enchanting silhouette of pyramids. These pyramids were magnificent monuments built to protect the souls and bodies of the Pharaohs. They served as a kind of afterlife home for them."
                
                ], translate: [
                "Binlerce yıl önce, Nil Nehri'nin verimli topraklarında Antik Mısır uygarlığı yükseldi. Bu dönemde Firavunlar, tanrısal krallar olarak kabul edilir ve hayatta oldukları sürece büyük bir saygı görürlerdi. Ancak ölüm, onlar için sadece bir son değil, aynı zamanda ebedi bir yaşama geçişin başlangıcıydı. Antik Mısır'daki krallar mezarlığı, bu ebedi geçişi sağlamak için inşa edilen yerlerden biriydi. Bu mezarlık, piramitlerin büyülü siluetleriyle tanınır. Piramitler, Firavunların ruhlarını ve bedenlerini korumak için yapılan muhteşem anıtlardı. Onlar için bir nevi ölümden sonraki evdi."
    
    ])
    ]
}
    
  /*  static var stories: [Story] = [
        Story(name: "İstanbul Gezisi 1",
              images: "istanbul_img",
              level:  "Orta Düzey",
              content: "The Basilica Cistern, located in Istanbul, Turkey, is an ancient underground water storage structure. It was built during the reign of Emperor Justinian I in the 6th century AD and served as a reservoir for the Byzantine Great Palace.",
             translate: "Yerebatan Sarnıcı, İstanbul, Türkiye'de bulunan antik bir yeraltı su depolama yapısıdır. İmparator Justinianus I döneminde, 6. yüzyılda inşa edilmiş olup Bizans Büyük Sarayı için bir su deposu olarak hizmet etmiştir."
             ),
        Story(name: "İstanbul Gezisi 2",
              images: "istanbul_img_2",
              level:  "Orta Düzey",
              content: "Covering an area of approximately 9,800 square meters, the Basilica Cistern is an impressive architectural wonder. It consists of a vast chamber supported by a forest of 336 marble columns, each measuring about 9 meters in height. These columns were mostly recycled from older structures, giving the cistern a unique and eclectic appearance.",
              translate: "Yerebatan Sarnıcı, İstanbul, Türkiye'de bulunan antik bir yeraltı su depolama yapısıdır. İmparator Justinianus I döneminde, 6. yüzyılda inşa edilmiş olup Bizans Büyük Sarayı için bir su deposu olarak hizmet etmiştir."
              )
    ] */
  




/*
 
 static var stories: [Story] = [
     Story(name: "İstanbul Gezisi 1", content: "The Basilica Cistern, located in Istanbul, Turkey, is an ancient underground water storage structure. It was built during the reign of Emperor Justinian I in the 6th century AD and served as a reservoir for the Byzantine Great Palace."),
     Story(name: "İstanbul Gezisi 2", content: "Covering an area of approximately 9,800 square meters, the Basilica Cistern is an impressive architectural wonder. It consists of a vast chamber supported by a forest of 336 marble columns, each measuring about 9 meters in height. These columns were mostly recycled from older structures, giving the cistern a unique and eclectic appearance."
           )
 ]
 
 
 
 
 
 */
