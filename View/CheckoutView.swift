//
//  CheckoutView.swift
//  miMake
//
//  Created by Jairus Pereira on 8/31/25.
//

import SwiftUI

enum PurchaseMode: Equatable {
    case standard
    case personalized(name: String)
}

struct CheckoutView: View {
    let item: CatalogItem
    let mode: PurchaseMode

    private let personalizationFeeINR = 100
    private var total: Int {
        switch mode {
        case .standard:
            return item.priceINR
        case .personalized:
            return item.priceINR + personalizationFeeINR
        }
    }

    var body: some View {
        List {
            Section("Item") {
                HStack {
                    Text(item.title)
                    Spacer()
                    Text(Currency.formatINR(item.priceINR))
                }
                if case .personalized = mode {
                    HStack {
                        Text("Personalization")
                        Spacer()
                        Text(Currency.formatINR(personalizationFeeINR))
                    }
                }
            }

            if case let .personalized(name) = mode {
                Section("Your Text") { Text(name).bold() }
            }

            Section {
                HStack {
                    Text("Total")
                    Spacer()
                    Text(Currency.formatINR(total)).bold()
                }
            }

            Section {
                NavigationLink {
                    OrderSuccessView(amountINR: total)
                } label: {
                    Label("Place Order (Mock)", systemImage: "checkmark.seal")
                        .font(.body.bold())
                }
            }
        }
        .navigationTitle("Checkout")
    }
}

struct OrderSuccessView: View {
    let amountINR: Int
    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "checkmark.circle.fill").font(.system(size: 64))
            Text("Order placed!").font(.title3.bold())
            Text("Amount: \(Currency.formatINR(amountINR))").foregroundStyle(.secondary)
            NavigationLink("Go to Orders") {
                OrdersView()
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .navigationBarBackButtonHidden(true)
    }
}
