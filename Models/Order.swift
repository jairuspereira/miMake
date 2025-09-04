//
//  Order.swift
//  miMake
//
//  Created by Jairus Pereira on 8/31/25.
//

import Foundation

struct Order: Identifiable,Hashable,Codable {
    var id: String
    var itemId: String
    var itemTitle: String
    var amountINR: Int
    var status: String        // "PendingPayment", "Received",etc.
    var createdAt: Date
}
