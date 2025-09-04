//
//  CatalogData.swift
//  miMake
//
//  Created by Jairus Pereira on 8/31/25.
//

import Foundation

enum CatalogData {
    static let items: [CatalogItem] = [
        CatalogItem(id:"nameplate_01",
                    title: "Desk Nameplate",
                    priceINR:599,
                    summary: "Personalized engraved nameplate for your desk.",
                    previewImageSystemName:"rectangle.and.pencil.and.ellipsis",
                    maxNameChars: 14),
        CatalogItem(id: "keychain_01",
                            title: "Text Keychain",
                            priceINR: 249,
                            summary: "Bold custom name keychain.",
                            previewImageSystemName: "key.horizontal",
                            maxNameChars: 10),
        CatalogItem(id: "tag_01",
                            title: "Pet Tag",
                            priceINR: 299,
                            summary: "Pet name tag with phone number.",
                            previewImageSystemName: "pawprint",
                            maxNameChars: 12)
    ]
}

enum OrdersData {
    static let sample: [Order]=[
        Order(id: "ord_demo_001",
              itemId : "nameplate_01",
              itemTitle : "Desk Nameplate",
              amountINR: 599,
              status: "Received",
              createdAt: .now)
    ]
}
