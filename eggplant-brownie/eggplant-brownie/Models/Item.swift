//
//  Item.swift
//  eggplant-brownie
//
//  Created by Paulo Barros on 09/07/20.
//  Copyright © 2020 Paulo Barros. All rights reserved.
//

import UIKit

class Item: NSObject {

    // MARK: - Atributos
    
    let nome: String
    let calorias: Double
       
    // MARK: - Init
    
    init(nome: String, calorias: Double) {
       self.nome = nome
       self.calorias = calorias
    }
}
