//
//  ProductsListView.swift
//  Products
//
//  Created by Armando Isais Olguin Cabrera  on 12/06/24.
//

import SwiftUI

struct ProductsListView: View {
    let productos: [ProductsModel]
    let onSelect: (ProductsModel) -> Void

    var body: some View {
        List(productos) { producto in
            ProductRowView(producto: producto)
                .onTapGesture {
                    onSelect(producto)
                }
        }
        .navigationTitle("Productos")
    }
}





struct ProductRowView: View {
    let producto: ProductsModel

    var body: some View {
        HStack {
            AsyncImage(url: URL(string: producto.urlImagenes.first ?? "")) { image in
                image.resizable()
                     .aspectRatio(contentMode: .fill)
                     .frame(width: 80, height: 80)
                     .cornerRadius(8)
            } placeholder: {
                ProgressView()
            }
            VStack(alignment: .leading) {
                Text(producto.nombre)
                    .font(.headline)
                if let categoria = producto.categoria {
                    Text("Categoría: \(categoria)")
                        .font(.subheadline)
                }
                Text(String(format: "$%.2f", producto.precioFinal))
                    .font(.subheadline)
            }
        }
        .padding(.vertical, 8)
    }
}



//struct ProductsListView_Previews: PreviewProvider {
//    static var previews: some View {
//        let sampleProducts: [ProductsModel] = [
//            ProductsModel(id: "1", nombre: "Producto 1", precioFinal: 99.99, urlImagenes: ["https://ejemplo.com/imagen1.jpg"], categoria: "Electrónica"),
//            ProductsModel(id: "2", nombre: "Producto 2", precioFinal: 149.99, urlImagenes: ["https://ejemplo.com/imagen2.jpg"], categoria: "Hogar"),
//            ProductsModel(id: "3", nombre: "Producto 3", precioFinal: 199.99, urlImagenes: ["https://ejemplo.com/imagen3.jpg"], categoria: "Moda")
//        ]
//
//        ProductsListView(productos: sampleProducts)
//    }
//}
