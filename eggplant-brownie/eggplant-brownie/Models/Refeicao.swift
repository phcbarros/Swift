//
//  Refeicao.swift
//  eggplant-brownie
//
//  Created by Paulo Barros on 09/07/20.
//  Copyright © 2020 Paulo Barros. All rights reserved.
//

import UIKit

class Refeicao: NSObject {
    
    // MARK: - Atributos
    
    let nome: String
    let felicidade: Int
    let itens: Array<Item> = []
    
    // MARK: - Construtor
    
    init(nome: String, felicidade: Int) {
        self.nome = nome
        self.felicidade = felicidade
    }
    
    // MARK: - Métodos
    
    func totalDeCalorias() -> Double {
        var total: Double = 0
           for item in itens {
            total += item.calorias
           }

        return total
    }
}
