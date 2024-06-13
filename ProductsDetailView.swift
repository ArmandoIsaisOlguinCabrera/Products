//
//  ProductsDetailView.swift
//  Products
//
//  Created by Armando Isais Olguin Cabrera  on 12/06/24.
//

import SwiftUI

struct ProductsDetailView: View {
    let producto: ProductsModel
    let onClose: () -> Void

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                ForEach(producto.urlImagenes, id: \.self) { url in
                    AsyncImage(url: URL(string: url)) { image in
                        image.resizable()
                             .aspectRatio(contentMode: .fit)
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(maxHeight: 200)
                    .cornerRadius(8)
                }
                VStack(alignment: .leading, spacing: 8) {
                    Text(producto.nombre)
                        .font(.title)
                    if let categoria = producto.categoria {
                        Text("Categoría: \(categoria)")
                            .font(.headline)
                    }
                    Text(String(format: "$%.2f", producto.precioFinal))
                        .font(.headline)
                    Spacer()
                }
                .padding()
            }
        }
        .navigationTitle("Detalle del Producto")
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    onClose()
                }) {
                    Image(systemName: "arrow.left")
                        .imageScale(.large)
                }
            }
        }
    }
}


//struct ProductsDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        let sampleProduct = ProductsModel(id: "1", nombre: "Producto de ejemplo", precioFinal: 100.0, urlImagenes: ["https://ejemplo.com/imagen1.jpg"], categoria: "Electrónica")
//        ProductsDetailView(producto: sampleProduct)
//    }
//}
