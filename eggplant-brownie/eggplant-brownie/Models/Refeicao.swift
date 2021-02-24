//
//  Refeicao.swift
//  eggplant-brownie
//
//  Created by Paulo Barros on 09/07/20.
//  Copyright © 2020 Paulo Barros. All rights reserved.
//

import UIKit

class Refeicao: NSObject, NSCoding {
    
    // MARK: - Atributos
    
    let nome: String
    let felicidade: Int
    var itens: Array<Item> = []
    
    // MARK: - Construtor
    init(nome: String, felicidade: Int, itens: [Item] = []) {
        self.nome = nome;
        self.felicidade = felicidade
        self.itens = itens
    }
    
    // MARK: - NSCoding
    
    func encode(with coder: NSCoder) {
        coder.encode(nome, forKey: "nome")
        coder.encode(felicidade, forKey: "felicidade")
        coder.encode(itens, forKey: "itens")
    }
    
    required init?(coder decoder: NSCoder) {
        nome = decoder.decodeObject(forKey: "nome") as! String
        felicidade = decoder.decodeInteger(forKey: "felicidade")
        itens = decoder.decodeObject(forKey: "itens") as! [Item]
    }
    
    // MARK: - Métodos
    
    func totalDeCalorias() -> Double {
        var total: Double = 0
           for item in itens {
            total += item.calorias
           }

        return total
    }
    
    func detalhes() -> String {
        var mensagem = "Felicidade: \(felicidade)"
        
        for item in itens {
            mensagem += ", \(item.nome) - calorias: \(item.calorias)"
        }
        
        return mensagem
    }
    
    
    
}
