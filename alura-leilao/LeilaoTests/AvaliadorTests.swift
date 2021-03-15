//
//  AvaliadorTests.swift
//  LeilaoTests
//
//  Created by Paulo Barros on 10/03/21.
//  Copyright © 2021 Alura. All rights reserved.
//

import XCTest
@testable import Leilao

class AvaliadorTests: XCTestCase {
    
    func testDeveEntenderLancesEmOrdemCrescente() {
        // Cenario
        
        let joao = Usuario(nome: "Joao")
        let jose = Usuario(nome: "Jose")
        let maria = Usuario(nome: "Maria")
        
        let leilao = Leilao(descricao: "Playstation 4")
        leilao.propoe(lance: Lance(maria, 250.0))
        leilao.propoe(lance: Lance(joao, 300.0))
        leilao.propoe(lance: Lance(jose, 400.0))
        
        // Acao
        
        let leiloeiro = Avaliador()
        leiloeiro.avalia(leilao: leilao)
        
        // Validacao
        
        XCTAssertEqual(250.0, leiloeiro.menorLance())
        XCTAssertEqual(400.0, leiloeiro.maiorLance())
    }
    
    
    func testDeveEntenterLeilaoComApenasUmLance() {
        let joao  = Usuario(nome: "joao")
        let leilao = Leilao(descricao: "Playstation 5")
        leilao.propoe(lance: Lance(joao, 5000.0))
        
        let leiloeiro = Avaliador()
        leiloeiro.avalia(leilao: leilao)
        
        XCTAssertEqual(5000.0, leiloeiro.menorLance())
        XCTAssertEqual(5000.0, leiloeiro.maiorLance())
    }

    func testTresMaioresDeveConterSomenteTresLances() {
        let joao  = Usuario(nome: "joao")
        let maria = Usuario(nome: "Maria")
        
        let leilao = Leilao(descricao: "Playstation 5")
        leilao.propoe(lance: Lance(joao, 300.0))
        leilao.propoe(lance: Lance(maria, 400.0))
        leilao.propoe(lance: Lance(joao, 500.0))
        leilao.propoe(lance: Lance(maria, 600.0))
        
        let leiloeiro = Avaliador()
        leiloeiro.avalia(leilao: leilao)
        
        
        XCTAssertEqual(3, leiloeiro.obterTresMaioresLances().count)
    }
    
    func testDeveRetornarOsTresMaioresLances() {
        let joao  = Usuario(nome: "joao")
        let maria = Usuario(nome: "Maria")
        
        let leilao = Leilao(descricao: "Playstation 5")
        leilao.propoe(lance: Lance(joao, 300.0))
        leilao.propoe(lance: Lance(maria, 400.0))
        leilao.propoe(lance: Lance(joao, 500.0))
        leilao.propoe(lance: Lance(maria, 600.0))
        
        let leiloeiro = Avaliador()
        leiloeiro.avalia(leilao: leilao)
        
        let tresMaioresLances = leiloeiro.obterTresMaioresLances()
        
        XCTAssertEqual(600.0, tresMaioresLances[0].valor)
        XCTAssertEqual(500.0, tresMaioresLances[1].valor)
        XCTAssertEqual(400.0, tresMaioresLances[2].valor)
    }
}
