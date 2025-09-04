//
//  CatalogListView.swift
//  miMake
//
//  Created by Jairus Pereira on 8/31/25.
//

import SwiftUI

struct CatalogListView: View {
    @StateObject private var vm = CatalogViewModel()

    var body: some View {
        List(vm.items) { item in
            NavigationLink {
                ItemDetailView(item: item)
            } label: {
                HStack(spacing: 16) {
                    Image(systemName: item.previewImageSystemName)
                        .font(.system(size: 28))
                        .frame(width: 44, height: 44)
                    VStack(alignment: .leading, spacing: 4) {
                        Text(item.title).font(.headline)
                        Text(item.summary).font(.subheadline).foregroundStyle(.secondary)
                    }
                    Spacer()
                    Text(Currency.formatINR(item.priceINR))
                        .font(.subheadline).bold()
                }
                .padding(.vertical, 4)
            }
        }
        .navigationTitle("Catalog")
    }
}
