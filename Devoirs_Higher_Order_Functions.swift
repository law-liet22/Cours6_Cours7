import Foundation

struct Personne {
    let nom: String
    let age: Int
}

func exercice1() {
    let nombres = [1, 2, 3, 4, 5, 6, 7] // Liste de nombres
    let resultat = nombres
        .filter { $0 % 2 != 0 } // Filtrer les nombres impairs
        .map { $0 * $0 } // Mettre les nombres au carré

    print("Exercice 1:", resultat) // Afficher le résultat (le tableau filtré puis mis au carré)
}

func exercice2() -> [Personne] { // Créer une structure Personne avec nom et age
    let personnes = [
        Personne(nom: "John", age: 28),
        Personne(nom: "Zara", age: 30),
        Personne(nom: "Albert", age: 20)
    ] // Créer liste des personnes avec leurs noms/ages

    let triees = personnes.sorted { $0.age > $1.age } // Trier les personnes par âge décroissant
    let noms = triees.map { $0.nom } // Récupérer les noms des personnes triées

    print("Exercice 2:", noms) // Afficher les noms des personnes triées
    return triees // Retourner la liste triée pour l'exercice 3 (plus pratique)
}

func exercice3(personnes: [Personne]) {
    let sommeAges = personnes.reduce(0) { $0 + $1.age }
    let moyenne = Double(sommeAges) / Double(personnes.count)

    print("Exercice 3:", moyenne)
}

func exercice4() {
    let stringNombres = ["3", "5", "9", "15", "22", "27"]

    let somme = stringNombres
        .compactMap { Int($0) }
        .filter { $0 % 3 == 0 }
        .reduce(0, +)

    print("Exercice 4:", somme)
}

func exercice5() {
    let mots = ["button", "trail", "pen", "apple", "swifter"]

    let sansRepetition = mots.filter { mot in
        let caracteresUniques = Set(mot)
        return caracteresUniques.count == mot.count
    }

    let plusLong = sansRepetition.max { $0.count < $1.count } ?? ""

    print("Exercice 5:", plusLong)
}

func exercice6() {
    let nombres = [1, -2, 3, 10, -5, 8]

    let positifsOuNuls = nombres.filter { $0 >= 0 }
    let somme = positifsOuNuls.reduce(0, +)
    let moyenne = Double(somme) / Double(positifsOuNuls.count)

    print("Exercice 6:", moyenne)
}

func exercice7() {
    let mots = ["swift", "programming", "language", "apple"]

    let resultat = mots
        .map { $0.capitalized }
        .sorted { $0 > $1 }

    print("Exercice 7:", resultat)
}

func exercice8() {
    let nombres = [1, 2, 3, 2, 4, 3, 5, 1]

    let uniques = Set(nombres)
    let nombreUniques = uniques.count

    print("Exercice 8:", nombreUniques)
}

func exercice9() {
    let words = ["apple", "apricot", "banana", "blackberry", "cherry"]

    let groupes = Dictionary(grouping: words) { String($0.prefix(1)) }
    let comptes = groupes.mapValues { $0.count }

    print("Exercice 9:", comptes)
}

func exercice10() {
    let nombres = [1, 2, 3, 2, 4, 3, 5, 1, 3]

    let frequences = nombres.reduce(into: [Int: Int]()) { compteur, nombre in
        compteur[nombre, default: 0] += 1
    }

    let plusFrequent = frequences.max { $0.value < $1.value }?.key

    print("Exercice 10:", plusFrequent ?? -1)
}

exercice1()
let personnesTriees = exercice2()
exercice3(personnes: personnesTriees)
exercice4()
exercice5()
exercice6()
exercice7()
exercice8()
exercice9()
exercice10()
