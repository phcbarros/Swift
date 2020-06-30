import UIKit

/*
 Comentários com mais de uma linha
 
 command + / = comenta as linhas
 */

let nome = "pastel"
let felicidade: Int = 5
let calorias: Double = 80.7
let gostou: Bool = true

//func comer() {
//    print("comeu o \(nome)")
//}

//comer()

// função com parâmetros explícitos
//func comeu(nome: String, calorias: Double) {
//    print("comeu \(nome) que tinha \(calorias) calorias")
//}
//
//comeu(nome: nome, calorias: calorias)

// função com parâmetros implicítos
// usar o _ + espace antes do nome da variável possibilita oculta-la na chamada do método
func comeu(_ nome: String, _ calorias: Double) {
    print("comeu \(nome) que tinha \(calorias) calorias")
}

comeu(nome, calorias)

