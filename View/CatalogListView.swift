//
//  CatalogListView.swift
//  miMake
//
//  Created by Jairus Pereira on 8/31/25.
//

import SwiftUI

struct CatalogListView: View {
    @StateObject private var vm = CatalogViewModel()
    private let columns: [GridItem] = [GridItem(.adaptive(minimum: 160), spacing: 16)]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(vm.items) { item in
                    CatalogItemCard(item: item)
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
            NavigationLink {
                ItemDetailView(item: item)
            } label: {
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
                }
            }

            HStack {
                Spacer()
                Text(Currency.formatINR(item.priceINR))
                    .font(.subheadline).bold()
            }

            HStack(spacing: 8) {
                NavigationLink {
                    CheckoutView(item: item, mode: .standard)
                } label: {
                    Label("Buy As‑Is", systemImage: "cart")
                        .font(.caption.bold())
                }
                .buttonStyle(.borderedProminent)

                NavigationLink {
                    PersonalizeView(item: item)
                } label: {
                    Label("Personalize", systemImage: "textformat.alt")
                        .font(.caption.bold())
                }
                .buttonStyle(.bordered)
            }
        }
        .padding(12)
        .background(.thinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}
