//
//  CatalogViewModel.swift
//  miMake
//
//  Created by Jairus Pereira on 8/31/25.
//

import Foundation
import Combine

final class CatalogViewModel: ObservableObject {
    @Published var items: [CatalogItem] = CatalogData.items
}

