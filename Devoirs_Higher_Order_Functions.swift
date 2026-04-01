import Foundation

struct Personne {  // Structure Personne avec nom et age
    let nom: String
    let age: Int
}

func exercice1() {
    let nombres = [1, 2, 3, 4, 5, 6, 7]  // Liste de nombres
    let resultat =
        nombres
        .filter { $0 % 2 != 0 }  // Filtrer les nombres impairs
        .map { $0 * $0 }  // Mettre les nombres au carré

    print("Exercice 1:", resultat)  // Afficher le résultat (le tableau filtré puis mis au carré)
}

func exercice2() -> [Personne] {  // Créer une structure Personne avec nom et age
    let personnes = [
        Personne(nom: "John", age: 28),
        Personne(nom: "Zara", age: 30),
        Personne(nom: "Albert", age: 20),
    ]  // Créer liste des personnes avec leurs noms/ages

    let triees = personnes.sorted { $0.age > $1.age }  // Trier les personnes par âge décroissant
    let noms = triees.map { $0.nom }  // Récupérer les noms des personnes triées

    print("Exercice 2:", noms)  // Afficher les noms des personnes triées
    return triees  // Retourner la liste triée pour l'exercice 3 (plus pratique)
}

func exercice3(personnes: [Personne]) {  // Calculer la moyenne d'âge des personnes
    let sommeAges = personnes.reduce(0) { $0 + $1.age }  // Calculer la somme des âges avec reduce
    let moyenne = Double(sommeAges) / Double(personnes.count)  // Calculer la moyenne en divisant la somme par le nombre de personnes

    print("Exercice 3:", moyenne)  // Afficher la moyenne d'âge des personnes
}

func exercice4() {  // Conversion String -> Int, filtrer multiples de 3, puis somme
    let stringNombres = ["3", "5", "9", "15", "22", "27"]  // Liste des String nombres

    let somme =
        stringNombres  // Conversion de String à Int, filtrer les multiples de 3, puis somme
        .compactMap { Int($0) }  // Conversion avec compactMap pour éviter les nil en cas de conversion échouée
        .filter { $0 % 3 == 0 }  // Filtrer les nombres qui sont multiples de 3 (avec l'opération modulo)
        .reduce(0, +)  // Réduire la liste filtrée en une somme totale (en partant de 0 et en ajoutant chaque élément)

    print("Exercice 4:", somme)  // Afficher la somme des nombres multiples de 3
}

func exercice5() {  // Trouver le mot le plus long sans caractères répétés
    let mots = ["button", "trail", "pen", "apple", "swifter"]  // Liste de mots

    let sansRepetition = mots.filter { mot in  // Filtrer les mots qui n'ont pas de caractères répétés
        let caracteresUniques = Set(mot)  // Set de caractères uniques du mot
        return caracteresUniques.count == mot.count  // Vérifier que le nombre de caractères uniques = à la longueur du mot (pas de répétition)
    }

    let plusLong = sansRepetition.max { $0.count < $1.count } ?? ""  // Trouver le mot le plus long, comparant la longueur des mots filtrés
    // Si aucun mot ne correspond (tous ont des caractères répétés), retourner une chaîne vide (condition ternaire - vu également en JS personnellement)

    print("Exercice 5:", plusLong)  // Afficher le mot le plus long sans caractères répétés
}

func exercice6() {  // Calculer la moyenne des nombres positifs ou nuls
    let nombres = [1, -2, 3, 10, -5, 8]  // Liste de nombres

    let positifsOuNuls = nombres.filter { $0 >= 0 }  // Filtrer les nombres qui sont positifs ou nuls (>= 0)
    let somme = positifsOuNuls.reduce(0, +)  // Calculer la somme des nombres filtrés (en partant de 0 et en ajoutant chaque élément)
    let moyenne = Double(somme) / Double(positifsOuNuls.count)  // Calculer la moyenne en divisant la somme par le nombre de nombres filtrés (en convertissant en Double pour éviter les problèmes de division entière)

    print("Exercice 6:", moyenne)  // Afficher la moyenne des nombres positifs ou nuls
}

func exercice7() {  // Trier les mots par ordre alphabétique inverse après les avoir mis en majuscule
    let mots = ["swift", "programming", "language", "apple"]  // Liste de mots

    let resultat =
        mots
        .map { $0.capitalized }  // Mettre chaque mot en majuscule
        .sorted { $0 > $1 }  // Trier les mots par ordre alphabétique inverse

    print("Exercice 7:", resultat)  // Afficher les mots triés par ordre alphabétique inverse après les avoir mis en majuscule (.map)
}

func exercice8() {  // Compter le nombre de nombres uniques dans une listee
    let nombres = [1, 2, 3, 2, 4, 3, 5, 1]  // Liste de nombres avec des doublons

    let uniques = Set(nombres)  // Conversion liste en Set pour éviter les doublons
    let nombreUniques = uniques.count  // Compter le nombre d'éléments uniques en utilisant count

    print("Exercice 8:", nombreUniques)  // Afficher le nombre de nombres qui sont uniques
}

func exercice9() {  // Grouper les mots par leur première lettre et compter le nombre de mots dans chaque groupe
    let words = ["apple", "apricot", "banana", "blackberry", "cherry"]  // Liste de mots

    let groupes = Dictionary(grouping: words) { String($0.prefix(1)) }  // Grouper les mots avec leurs premières lettres avec prefix(1) et Dictionary(grouping:)
    let comptes = groupes.mapValues { $0.count }  // Compter le nombre de chaque mot avec mapValues count

    print("Exercice 9:", comptes)  // Afficher le résultat
}

func exercice10() {  // Trouver le nombre le plus fréquent dans une liste de nombres
    let nombres = [1, 2, 3, 2, 4, 3, 5, 1, 3]  // Liste de nombres avec doublons

    let frequences = nombres.reduce(into: [Int: Int]()) { compteur, nombre in  // Créer dictionnaire de fréquences avec reduce pour éviter les doublons
        compteur[nombre, default: 0] += 1  // Incrémenter le compteur
    }

    let plusFrequent = frequences.max { $0.value < $1.value }?.key  // Obtenir le nombre le plus fréquent puis récupérer sa clé

    print("Exercice 10:", plusFrequent ?? -1)  // Afficher le nombre le plus fréquent, ou -1 si la liste est vide (condition ternaire aussi)
}

// Appeler les fonctions pour exécuter les exercices
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
