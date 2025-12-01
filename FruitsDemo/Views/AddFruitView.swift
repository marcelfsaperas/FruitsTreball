
import SwiftUI

struct AddFruitView: View {
    @Binding var newFruit:Fruit
    @Binding var sheetIsVisible:Bool
    @Binding var sheetAction: SheetAction
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Name")) {
                    TextField("Name", text: $newFruit.name)
                }
                Section(header: Text("Description")) {
                    TextEditor(text: $newFruit.description)
                }
                Section(header: Text("Image")) {
                    EmojiPicker(emoji: $newFruit.emoji)
                        //TODO: .listRowInsets(EdgeInsets())
                }
            }.navigationTitle("Add fruit")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel"){ sheetIsVisible = false }
                    }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add"){
                        sheetIsVisible = false
                        sheetAction = SheetAction.add
                    }
                }
            }
        }
        
    }
}

struct AddFruitView_Previews: PreviewProvider {
    static var previews: some View {
        AddFruitView(newFruit: .constant(FruitStore.defaultFruit), sheetIsVisible: .constant(false), sheetAction: .constant(SheetAction.cancel))
        AddFruitView(newFruit: .constant(FruitStore.defaultFruit), sheetIsVisible: .constant(false), sheetAction: .constant(SheetAction.cancel))
            .preferredColorScheme(.dark)
        AddFruitView(newFruit: .constant(FruitStore.defaultFruit), sheetIsVisible: .constant(false), sheetAction: .constant(SheetAction.cancel))
            .previewLayout(.fixed(width: 480, height: 320))
    }
}
