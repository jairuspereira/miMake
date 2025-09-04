//
//  PersonalizeView.swift
//  miMake
//
//  Created by Jairus Pereira on 8/31/25.
//

import SwiftUI

struct PersonalizeView: View {
    let item: CatalogItem
    @State private var nameText: String = ""

    var maxChars: Int { item.maxNameChars ?? 12 }

    var body: some View {
        Form {
            Section("Text Personalization") {
                TextField("Name to engrave (A–Z, 0–9)", text: $nameText)
                    .textInputAutocapitalization(.characters)
                    .onChange(of: nameText) { _, newValue in
                        let allowed = "ABCDEFGHIJKLMNOPQRSTUVWXYZ 0123456789-_."
                        let filtered = newValue.uppercased().filter { allowed.contains($0) }
                        nameText = String(filtered.prefix(maxChars))
                    }
                HStack {
                    Text("Characters left")
                    Spacer()
                    Text("\(max(0, maxChars - nameText.count))")
                        .monospacedDigit()
                        .foregroundStyle(.secondary)
                }
            }

            Section("Preview (mock)") {
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color(.secondarySystemBackground))
                        .frame(height: 120)
                    VStack(spacing: 8) {
                        Image(systemName: item.previewImageSystemName).font(.title2)
                        Text(nameText.isEmpty ? "YOUR TEXT" : nameText)
                            .font(.headline)
                    }
                }
            }

            Section {
                NavigationLink {
                    CheckoutView(item: item, nameText: nameText)
                } label: {
                    Label("Continue to Checkout", systemImage: "creditcard")
                        .font(.body.bold())
                }
                .disabled(nameText.isEmpty)
            }
        }
        .navigationTitle("Personalize")
    }
}
