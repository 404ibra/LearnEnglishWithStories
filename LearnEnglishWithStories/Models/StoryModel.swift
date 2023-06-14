//
//  StoryModel.swift
//  LearnEnglishWithStories
//
//  Created by İbrahim Aktaş on 8.06.2023.
//

import Foundation

struct Story: Identifiable {
    var id = UUID()
    var name: String
    var images: String
    var level: String
    var content: [String]
    var translate: [String]

    
    static var stories: [Story] = [
        Story(name: "İstanbul Gezisi",
              images: "istanbul_img",
              level:  "Orta Düzey",
              content: [
                "The Basilica Cistern, located in Istanbul, Turkey, is an ancient underground water storage structure. It was built during the reign of Emperor Justinian I in the 6th century AD and served as a reservoir for the Byzantine Great Palace.",
                "Covering an area of approximately 9,800 square meters, the Basilica Cistern is an impressive architectural wonder. It consists of a vast chamber supported by a forest of 336 marble columns, each measuring about 9 meters in height. These columns were mostly recycled from older structures, giving the cistern a unique and eclectic appearance."
              ],
             translate: [
                "Yerebatan Sarnıcı, İstanbul, Türkiye'de bulunan antik bir yeraltı su depolama yapısıdır. İmparator Justinianus I döneminde, 6. yüzyılda inşa edilmiş olup Bizans Büyük Sarayı için bir su deposu olarak hizmet etmiştir.",
               " Yaklaşık 9.800 metrekarelik bir alanı kaplayan Yerebatan Sarnıcı, etkileyici bir mimari harikasıdır. Her biri yaklaşık 9 metre yüksekliğinde 336 mermer sütundan oluşan bir ormanla desteklenen geniş bir odadan oluşur. Bu sütunlar çoğunlukla eski yapılardan geri dönüştürülerek sarnıcın eşsiz ve eklektik bir görünüm kazanması sağlanmıştır."
             ]
             )
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
