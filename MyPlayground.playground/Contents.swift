import UIKit

/*
 Comentários com mais de uma linha
 
 command + / = comenta as linhas
 */

let nome = "pastel"
let felicidade: Int = 5
let calorias: Double = 80.7
let gostou: Bool = true

/*
    Funções
 */

func comer1() {
    print("comeu o \(nome)")
}

comer1()

// função com parâmetros explícitos
func comeu2(nome: String, calorias: Double) {
    print("comeu \(nome) que tinha \(calorias) calorias")
}

comeu2(nome: nome, calorias: calorias)

// função com parâmetros implicítos
// usar o _ + espace antes do nome da variável possibilita oculta-la na chamada do método
func comeu3(_ nome: String, _ calorias: Double) {
    print("comeu \(nome) que tinha \(calorias) calorias")
}

comeu3(nome, calorias)

/*
    Arrays e tipos de laço for
*/

let totalDeCalorias = [20.3, 50.5, 670.8, 100, 99]

// Primeira forma de escrever um for
print("Primeira forma de escrever um for")
for i in 0...3 {
    print("index: \(i)")
    print(totalDeCalorias[i])
}

// Segunda forma de escrever um for
print("Segunda forma de escrever um for")
for i in 0...totalDeCalorias.count - 1 {
    print("index: \(i)")
    print(totalDeCalorias[i])
}

// Terceira forma de escrever um for
// for in
print("Terceira forma de escrever um for")

for caloria in totalDeCalorias {
    print(caloria)
}

/*
    Arrays e Funções
 */

func somarTodasAsCalorias(totalDeCalorias: [Double]) -> Double {
    var total: Double = 0
    for caloria in totalDeCalorias {
        total += caloria
    }

    return total
}

let total = somarTodasAsCalorias(totalDeCalorias: [60, 50, 45.6])
print("Total de calorias: \(total)")


/*
   Classes
*/

class Refeicao1 {
    var nome: String?
    var felicidade: String?
}

let refeicao = Refeicao1()
refeicao.nome = "comida japonesa"


if refeicao.nome != nil {
    // Cuidado => forced unwrap (evitar)
    print(refeicao.nome!)
}

// Boas práticas para extrair valores opcionais

func exibirNomeDaRefeicao() {
    /*
        if let
        a variável só existe no escopo do if
    */
    if let nome = refeicao.nome {
        print("Usando if let \(nome.uppercased())")
    }
    
    // print(nome) // error
    
    /*
        guard let
        Consegue reutilizar a variável fora do escopo do if, o else é obrigatório
     */
    guard let nome = refeicao.nome else {
        return
    }
    
    print("Usando guard let \(nome)")
}

exibirNomeDaRefeicao()

class Refeicao {
    
    // MARK: - Atributos
    var nome: String
    var felicidade: String
    
    // MARK: - Constutor
    
    init(nome: String, felicidade: String) {
        self.nome = nome
        self.felicidade = felicidade
    }
    
}

let novaRefeicao = Refeicao(nome: "Temaki", felicidade: "5")

print(novaRefeicao.nome)
