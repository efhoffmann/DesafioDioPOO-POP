import Cocoa

protocol Dog {
    var name: String { get }
    var age: Int { get }
    var race: String { get }
    
    func latir(num: Int)
}

protocol Bird {
    var name: String { get }
    var age: Int { get }
}

protocol CanFly {
    var maximumSpeed: Double { get }
}


struct Buldog: Dog {
    var name: String
    var age: Int
    var race: String

    func latir(num: Int) {
        num.repetitions {
          print("Au")
        }
    }
}

struct Arara: Bird, CanFly {
    let name: String
    let age: Int
    let frequency : Double
    let amplitude: Double
    var maximumSpeed: Double {
        2 * frequency + amplitude
    }
}
   

struct Ema: Bird {
    let name: String
    let age: Int
}


extension Int {
    func repetitions(sound: () -> Void) {
        for _ in 0..<self {
            sound()
        }
    }
}

var passaro = Arara(name: "Azul", age: 3, frequency: 3, amplitude: 2)
print("A arara \(passaro.name) tem \(passaro.age) anos e voa a uma velocidade de \(passaro.maximumSpeed)Km/h")

var cachorro = Buldog(name: "Bridgton", age: 12, race: "Buldog")
print("O cãozinho \(cachorro.name) tem \(cachorro.age) anos.")
cachorro.latir(num: 5)


var ema = Ema(name: "Filó", age: 5)
print("A ema \(ema.name) tem \(ema.age) anos de existência.")

