import SwiftUI

struct ColorsSlider: View {
    var numColors: Binding<Double>
    let onEditingChanged: () -> Void

    private let minColors = 8.0
    private let maxColors = 128.0

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("Colors: \(Int(numColors.wrappedValue))")
            Slider(value: numColors, in: minColors...maxColors, step: 1, onEditingChanged: { isChanging in
                if !isChanging {
                    self.onEditingChanged()
                }
            })
        }
    }
}

struct ColorsSlider_Previews: PreviewProvider {
    static var previews: some View {
        ColorsSlider(numColors: .constant(12.0), onEditingChanged: {})
    }
}
