
import SwiftUI

//TODO: Create a list
//TODO: Create the navigation
struct ContentView: View {
    @EnvironmentObject var fruitStore: FruitStore
    @State private var sheetIsVisible = false
    @State private var fruitToAddTemplate = FruitStore.emptyFruit
    @State private var sheetAction = SheetAction.cancel
    @State private var showAlert = false
    var value = 1
    var body: some View {
        NavigationView {
            List {
                ForEach(fruitStore.fruits) { fruit in
                    NavigationLink(
                        destination: DetailFruitView(fruit: fruit)
                    ) {
                        FruitRowView(fruit: fruit)
                    }
                }
                .onDelete(perform: remove)
            }
            .navigationBarTitle(Text("Fruit List"))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add") {
                        sheetIsVisible = true
                    }
                }
                
            }
        }.sheet(isPresented: $sheetIsVisible, onDismiss: onSheetDismiss){
            AddFruitView(
                newFruit: $fruitToAddTemplate,
                sheetIsVisible: $sheetIsVisible,
                sheetAction: $sheetAction
            )
        }.alert(isPresented: $showAlert) {
            Alert(
                title: Text("Error"),
                message: Text ("This fruit already exists or its name is empty!"
                ))
        }
    }
    
    func onSheetDismiss()  {
        if sheetAction == SheetAction.add {
            showAlert = fruitStore.addFruit(fruitToAdd: fruitToAddTemplate)

            self.fruitToAddTemplate = FruitStore.emptyFruit
            self.sheetAction = SheetAction.cancel
        }
    }
    
    func remove(at offsets: IndexSet) {
        fruitStore.fruits.remove(atOffsets: offsets)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(FruitStore())
    }
}

enum SheetAction {
    case cancel
    case add
}
