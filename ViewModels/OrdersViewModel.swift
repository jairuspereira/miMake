//
//  OrdersViewModel.swift
//  miMake
//
//  Created by Jairus Pereira on 8/31/25.
//

import Foundation
import Combine

final class OrdersViewModel: ObservableObject {
    @Published var orders: [Order] = OrdersData.sample
}
