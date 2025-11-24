
import SwiftUI

//TODO: Create a list
//TODO: Create the navigation
struct ContentView: View {
    @EnvironmentObject var fruitStore: FruitStore
    var value = 1
    var body: some View {
        List {
            ForEach(fruitStore.fruits, id:\.self) {
                fruit in
                Text(fruit.name)   
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(FruitStore())
    }
}
