//
//  Item.swift
//  eggplant-brownie
//
//  Created by Paulo Barros on 09/07/20.
//  Copyright © 2020 Paulo Barros. All rights reserved.
//

import UIKit

class Item: NSObject, NSCoding {
    
    // MARK: - Atributos
    
    let nome: String
    let calorias: Double
       
    // MARK: - Init
    
    init(nome: String, calorias: Double) {
       self.nome = nome
       self.calorias = calorias
    }
    
    // MARK: - NSCoding
    
    func encode(with coder: NSCoder) {
        coder.encode(nome, forKey: "nome")
        coder.encode(calorias, forKey: "calorias")
    }
    
    required init?(coder decoder: NSCoder) {
        nome = decoder.decodeObject(forKey: "nome") as! String
        calorias = decoder.decodeDouble(forKey: "calorias")
    }
}
