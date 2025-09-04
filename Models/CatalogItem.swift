//
//  CatalogItem.swift
//  miMake
//
//  Created by Jairus Pereira on 8/31/25.
//

import Foundation

struct CatalogItem: Identifiable,Hashable,Codable {
    var id: String
    var title: String
    var priceINR:Int
    var summary : String
    var previewImageSystemName: String
    var maxNameChars: Int?

    
    
}
