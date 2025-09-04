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
        let columns = [GridItem(.adaptive(minimum: 160), spacing: 16)]

        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {              
                ForEach(vm.items) { item in
                    NavigationLink {
                        ItemDetailView(item: item)
                    } label: {
                        CatalogItemCard(item: item)
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding()
        }
        .navigationTitle("Catalog")
    }
}

private struct CatalogItemCard: View {
    let item: CatalogItem

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color(.secondarySystemBackground))
                    .frame(height: 100)
                Image(systemName: item.previewImageSystemName)
                    .font(.system(size: 40))
            }

            Text(item.title)
                .font(.headline)
                .lineLimit(2)

            Text(item.summary)
                .font(.caption)
                .foregroundStyle(.secondary)
                .lineLimit(2)

            HStack {
                Spacer()
                Text(Currency.formatINR(item.priceINR))
                    .font(.subheadline).bold()
            }
        }
        .padding(12)
        .background(.thinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}
