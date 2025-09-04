//
//  OrdersView.swift
//  miMake
//
//  Created by Jairus Pereira on 8/31/25.
//

import SwiftUI

struct OrdersView: View {
    @StateObject private var vm = OrdersViewModel()

    var body: some View {
        List(vm.orders) { order in
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text(order.itemTitle)
                        .font(.headline)
                    Spacer()
                    Text(Currency.formatINR(order.amountINR))
                        .bold()
                }

                HStack {
                    Text(order.status)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(Color.green.opacity(0.15))
                        .clipShape(RoundedRectangle(cornerRadius: 6))

                    Spacer()

                    Text(order.createdAt, style: .date)
                        .foregroundStyle(.secondary)
                }
            }
            .padding(.vertical, 4)
        }
        .navigationTitle("My Orders")
    }
}
