import Cocoa

class Human {
    var name: String
    var surname: String
    var age: Int
    var address: String
    
    init(name: String, surname: String, age: Int, address: String) {
        self.name = name
        self.surname = surname
        self.age = age
        self.address = address
    }
    
    func introduce(city: String) {
        print("Olá, me chamo \(name) \(String(describing: surname)).")
    }
    
    func activity() {
        print("Alguns humanos não gostam de fazer atividade física.")
    }
}

class Person: Human {
    var food: [String]
    var playSport: Bool
    
    init(name: String, surname: String, age: Int, food: [String], playSport: Bool, address: String) {
        self.food = food
        self.playSport = playSport
        super.init(name: name, surname: surname, age: age, address: address)
    }
    
    override func introduce(city: String) {
        
        if self.age < 24 {
            print("\(age): Sua idade enquadra-se como 'Criança/Adolescente'. Recomendamos setar um objeto 'child' com a classe 'Kids' para obter maiores informações.")
        } else {
            print("Nosso convidado de hoje chama-se \(name) \(String(describing: surname)), ele tem \(age) anos de idade e mora no endereço a seguir: \(address) na cidade de \(city).")
        }
            
    }
    
     func birthday() -> ((Int) -> Int) {
        func addOne(lifeAge: Int) -> Int {
            return 1 + lifeAge
        }
        return addOne
    }
    
    override func activity() {
        if playSport {
            switch age {
            case 0...23:
                print("")
           case 24...30:
                print("\n\(name ) gosta muito de correr e nadar.")
            case 31...40:
                print("\n\(name) prefere jogar golfe.")
            case 41...60:
                print("\n'Meu esporte preferido é viajar pelo Mundo' afirma \(name).")
            default:
                print("\n\(name ): O bingo te espera!")
            }
        }
        
    }
    
}

class Kids: Person {
    var study = true
    
    override init(name: String, surname: String, age: Int, food: [String], playSport: Bool, address: String) {
        super.init(name: name, surname: surname, age: age, food: food, playSport: playSport, address: address)
        study = true
    }
    
    override func introduce(city: String) {
        var increment = birthday()
        let NAME_PHRASE = "Nosso convidado de hoje chama-se \(name) \(String(describing: surname)), tem \(self.age) anos de idade"
        let ADDRESS_PHRASE = "e mora no endereço a seguir: \(address) na cidade de \(city). \(AgeGroup.teenager.study())"
        let AGE_PHRASE = "Ano que vem estará completando \(increment(age)) anos"
        
        if self.age == 1 {
         
            print("\(name) \(String(describing: surname)) tem \(self.age) ano de idade e ainda não aprendeu a falar. Não vai para a escola, pois \(AgeGroup.baby.study())"); AgeGroup.baby.foodMenu(menu: food)
            
        } else if self.age < 5 {
            print("\(NAME_PHRASE). \(name) está aprendendo a falar algumas palavras! \(AgeGroup.baby.study()) \(AGE_PHRASE)."); AgeGroup.child.foodMenu(menu: food)
            
        } else if self.age < 14 {
            print("\(NAME_PHRASE). \(name) gosta muito de brincar com seus amigos. \( AgeGroup.child.study()) \(AgeDriver.minor.driver(age)) \(AGE_PHRASE)."); AgeGroup.child.foodMenu(menu: food)
            
        } else if self.age < 18 {
            print("\(NAME_PHRASE) \(ADDRESS_PHRASE) \(AgeDriver.minor.driver(age)) \(AGE_PHRASE)."); AgeGroup.teenager.foodMenu(menu: food)
            
        } else if self.age < 24 {
            print("\(NAME_PHRASE) \(ADDRESS_PHRASE) e \(AgeDriver.ofLegalAge.driver(age)) \(AGE_PHRASE)."); AgeGroup.teenager.foodMenu(menu: food)
            
        } else {
           print("\(name) é um adulto. Está trabalhando. Sete o objeto 'human' com a classe 'Person' (human = Person( < parametros > ) e então, poderás conhecê-lo melhor. Vejo você lá!")
        }
        
    }
    
    override func activity() {
        if playSport {
            switch age {
            case 0...2:
                print("\nBebês não podem praticar esportes.")
            case 3...6:
                print("\n\(name) pode brincar no parquinho.")
            case 7...16:
                print("\n\(name) pode brincar depois da escola.")
            case 17...22:
                print("\n\(name) gosta muito de correr e nadar.")
            default:
                print("\nUma jornada de trabalho te espera!")
            }
        }
        
    }
    
}

enum AgeGroup {
    case baby
    case child
    case teenager
    case college
    
    func study() -> String {
        switch self {
        case .baby:
            return "Bebês não estudam."
        case .child:
            return "Atualmente vai para a escola."
        case .teenager:
            return "No momento está se preparando para o vestibular."
        case .college:
            return "já está na faculdade"
        }
    }
    
    func foodMenu(menu: [String]) {
        switch self {
        case .baby:
            print("Bebês comem papinha")
        case .child, .teenager, .college:
            if menu.count == 1 {
                print("\nSeu alimento preferido é:\n " )
                counterFood()
                    
            } else {
                DispatchQueue.global().sync {
                    print("\nSeus alimentos preferidos são:\n " )
                    counterFood()
                }
                
            }
        }
        
        func counterFood() {
            for (index, item) in menu.enumerated() {
                print("\(index + 1)- \(item)")
            }
        }
    }
}

enum AgeDriver {
    case ofLegalAge
    case minor
    
    func driver(_ aGe: Int) -> String {
        switch self {
        case .ofLegalAge:
            return "ele tem autorização para dirigir!"
        case .minor:
            return "Como ele tem \(aGe) anos de idade, ainda não pode dirigir."
        }
    }
}


print("-=-=-=-=-=-=- ::: KIDS: ::: -=-=-=-=-=-=-\n")

var child = Kids(name: "João", surname: "Flores", age: 2, food: ["chocolate", "arroz", "feijão"], playSport: true, address: "Rua 13 de Maio")

child.introduce(city: "Fortaleza")
child.activity()


print("\n\n-=-=-=-=-=-=- ::: ADULT: ::: -=-=-=-=-=-=-\n")


var adult = Person(name: "Lucas", surname: "Andrade", age: 45, food: ["macarronada"], playSport: true, address: "Av. Visconde do Rio Branco")
adult.introduce(city: "Uberlândia")

if adult.age > 24 {
    let food = adult.food
    AgeGroup.college.foodMenu(menu: food)
}

adult.activity()

var ageAdult = adult.birthday()
print("\nAno que vem \(adult.name) completará \(String(describing: ageAdult(adult.age))) anos de idade.")
