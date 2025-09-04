//
//  HomeView.swift
//  miMake
//
//  Created by Jairus Pereira on 8/31/25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack(spacing:24){
            VStack(spacing:8){
                Image(systemName: "cube.transparent")
                    .font(.system(size: 56, weight: .thin))
                Text("miMake")
                    .font(.largeTitle).bold()
                Text("Premade 3D models with simple personalization")
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
            }
            .padding(.top, 32)
            
            NavigationLink {
                            CatalogListView()
                        } label: {
                            Label("Browse Catalog", systemImage: "square.grid.2x2")
                                .font(.title3.bold())
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(.thinMaterial)
                                .clipShape(RoundedRectangle(cornerRadius: 16))
                        }
            
            NavigationLink {
                            OrdersView()
                        } label: {
                            Label("My Orders", systemImage: "shippingbox")
                                .font(.title3.bold())
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(.thinMaterial)
                                .clipShape(RoundedRectangle(cornerRadius: 16))
                        }
            
            Spacer()
                 }
                 .padding()
                 .navigationTitle("Home")
            
        }
    }

