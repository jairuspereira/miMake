//
//  ItemDetailView.swift
//  miMake
//
//  Created by Jairus Pereira on 8/31/25.
//

import SwiftUI

struct ItemDetailView: View {
    let item: CatalogItem

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color(.secondarySystemBackground))
                        .frame(height: 220)
                    Image(systemName: item.previewImageSystemName)
                        .font(.system(size: 64))
                }
                Text(item.title).font(.title).bold()
                Text(item.summary).foregroundStyle(.secondary)

                HStack {
                    Text("Price")
                    Spacer()
                    Text(Currency.formatINR(item.priceINR)).bold()
                }
                .font(.title3)

                NavigationLink {
                    PersonalizeView(item: item)
                } label: {
                    Label("Personalize", systemImage: "textformat.alt")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(.blue.opacity(0.15))
                        .clipShape(RoundedRectangle(cornerRadius: 14))
                }
                .padding(.top, 8)
            }
            .padding()
        }
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}
