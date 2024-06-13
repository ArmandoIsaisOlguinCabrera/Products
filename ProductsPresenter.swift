//
//  ProductsPresenter.swift
//  Products
//
//  Created by Armando Isais Olguin Cabrera  on 12/06/24.
//


import Foundation
import SwiftUI

class ProductsPresenter: ObservableObject {
    @Published var productos: [ProductsModel] = []

    func loadProducts() {
        let urlString = "http://alb-dev-ekt-875108740.us-east-1.elb.amazonaws.com/sapp/productos/plp/1/ad2fdd4bbaec4d15aa610a884f02c91a"
        guard let url = URL(string: urlString) else {
            fatalError("Invalid URL")
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Error fetching data: \(error?.localizedDescription ?? "Unknown error")")
                return
            }

            do {
                let response = try JSONDecoder().decode(APIResponse.self, from: data)
                DispatchQueue.main.async {
                    self.productos = response.resultado.productos
                }
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }.resume()
    }
}
