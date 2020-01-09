import SwiftUI

struct ColorsSlider: View {
    var numColors: Binding<Double>
    private let minColors = 8.0
    private let maxColors = 128.0

    private let onEditingChanged: () -> Void

    init(numColors: Binding<Double>, onEditingChanged: @escaping () -> Void) {
        self.numColors = numColors
        self.onEditingChanged = onEditingChanged
    }

    var body: some View {
        Slider(value: numColors, in: minColors...maxColors, step: 1, onEditingChanged: { isChanging in
            if !isChanging {
                self.onEditingChanged()
            }
        })
    }
}

struct ColorsSlider_Previews: PreviewProvider {
    static var previews: some View {
        ColorsSlider(numColors: .constant(12.0), onEditingChanged: {})
    }
}
