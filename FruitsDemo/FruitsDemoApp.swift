import SwiftUI

@main
struct FruitsDemoApp: App {
    @StateObject var fruitStore = FruitStore()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(fruitStore)
        }
    }
}
