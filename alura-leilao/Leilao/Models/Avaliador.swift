//
//  Avaliador.swift
//  Leilao
//
//  Created by Alura Laranja on 04/05/18.
//  Copyright © 2018 Alura. All rights reserved.
//

import Foundation

class Avaliador {
    
    private var maiorDeTodos = Double.leastNonzeroMagnitude
    private var menorDeTodos = Double.greatestFiniteMagnitude
    private var tresMaiores: [Lance] = []
    
    func avalia(leilao:Leilao) {
        guard let lances = leilao.lances else { return }
        
        for lance in lances {
            if lance.valor > maiorDeTodos {
                maiorDeTodos = lance.valor
            }
            
            if lance.valor < menorDeTodos {
                menorDeTodos = lance.valor
            }
        }
        
        pegarOsTresMaioresLances(leilao)
    }
    
    func maiorLance() -> Double {
        return maiorDeTodos
    }
    
    func menorLance() -> Double {
        return menorDeTodos
    }
    
    func obterTresMaioresLances() -> [Lance] {
        return tresMaiores
    }
    
    private func pegarOsTresMaioresLances(_ leilao: Leilao) {
        guard let lances = leilao.lances else { return }
        
        let lancesOrdenadosPorValorDescrescente = lances.sorted { (lance1, lance2) -> Bool in
            return lance1.valor > lance2.valor
        }
        
        let maioresLances = lancesOrdenadosPorValorDescrescente.prefix(3)
        tresMaiores = Array(maioresLances)
    }
    
}
