import SwiftUI

struct ToggleChildView: View {
    @Binding var isOn: Bool
    
    var body: some View {
        Toggle(isOn: $isOn, label: {
            Text("is watching")
        }).fixedSize()
    }
}

struct ToggleChildView_Previews: PreviewProvider {
    static var previews: some View {
        ToggleChildView(isOn: .constant(false))
    }
}

