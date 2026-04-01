import Foundation

// Étape 1 : code refactorisé

// 1) Gestion des erreurs
// Chaque cas représente un problème réseau possible
enum NetworkError: Error {
    case noInternet // Pas de connexion
    case serverError // Réponse serveur invalide
}

// 2) Modèle de données
struct NewsItem: Identifiable, CustomStringConvertible {
    let id: Int
    let title: String

    // Texte affiché par print(item)
    var description: String {
        return "📰 [#\(id)] \(title)"
    }
}

// 3) Protocole du service de données
protocol DataService {
    // Type de donnée renvoyé par le service
    associatedtype Item
    // Récupère une liste de données de façon asynchrone
    func fetch() async throws -> [Item]
}

// 4) Implémentation concrète du service
struct NewsService: DataService {
    // Ce service retourne des NewsItem
    typealias Item = NewsItem

    // Peut attendre une opération longue et lancer une erreur
    func fetch() async throws -> [NewsItem] {
        print("🔄 Récupération des actualités...")

        // Pause asynchrone de 2 secondes (sans bloquer l'app)
        try await Task.sleep(nanoseconds: 2_000_000_000)

        // Simulation aléatoire : succès ou échec
        let success = Bool.random()

        if success {
            return [
                NewsItem(id: 1, title: "Swift domine le monde du développement !"),
                NewsItem(id: 2, title: "Les protocoles : complexes mais puissants.")
            ]
        } else {
            // Retourne une erreur gérable au lieu d'un crash
            throw NetworkError.serverError
        }
    }
}


// 5) Fonction générique d'affichage
func loadAndDisplay<T: DataService>(service: T) async where T.Item: CustomStringConvertible {
    // Gestion sécurisée des erreurs
    do {
        let items = try await service.fetch()
        print("✅ \(items.count) élément(s) chargé(s) :")
        for item in items {
            print("   \(item)")
        }
    } catch NetworkError.noInternet {
        print("❌ Erreur : Pas de connexion internet. Vérifiez votre réseau.")
    } catch NetworkError.serverError {
        print("❌ Erreur : Le serveur a rencontré un problème. Réessayez plus tard.")
    } catch {
        // Erreur inattendue.
        print("❌ Erreur inattendue : \(error)")
    }
}


// 6) Point d'entrée
print("🚀 Application démarrée")

// Lance l'appel asynchrone depuis le contexte principal
Task {
    let service = NewsService()
    await loadAndDisplay(service: service)
    print("🏁 Application terminée")
}

// Garde le script actif le temps de finir la Task
Thread.sleep(forTimeInterval: 5)
