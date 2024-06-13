//
//  ProductsModel.swift
//  Products
//
//  Created by Armando Isais Olguin Cabrera  on 12/06/24.
//

import Foundation

struct ProductsModel: Codable, Identifiable {
    let id: String
    let nombre: String
    let precioFinal: Double
    let urlImagenes: [String]
    let categoria: String?

    enum CodingKeys: String, CodingKey {
        case id
        case nombre = "nombre"
        case precioFinal = "precioFinal"
        case urlImagenes = "urlImagenes"
        case categoria = "codigoCategoria"
    }
}

struct APIResponse: Codable {
    let resultado: Resultado
}

struct Resultado: Codable {
    let productos: [ProductsModel]
}
