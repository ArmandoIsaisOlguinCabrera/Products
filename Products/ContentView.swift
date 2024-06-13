//
//  ContentView.swift
//  Products
//
//  Created by Armando Isais Olguin Cabrera  on 12/06/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var presenter = ProductsPresenter()
    @State private var showProductList = false
    @State private var selectedProduct: ProductsModel? = nil

    var body: some View {
        NavigationView {
            VStack {
                if selectedProduct != nil {
                    ProductsDetailView(producto: selectedProduct!, onClose: {
                        selectedProduct = nil
                    })
                } else {
                    Button(action: {
                        presenter.loadProducts()
                        showProductList = true
                    }) {
                        Text("Mostrar Productos")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    .navigationTitle("Catálogo de Productos")
                    .sheet(isPresented: $showProductList) {
                        ProductsListView(productos: presenter.productos, onSelect: { product in
                            selectedProduct = product
                        })
                    }
                }
            }
        }
    }
}

//
//#Preview {
//    ContentView()
//}
