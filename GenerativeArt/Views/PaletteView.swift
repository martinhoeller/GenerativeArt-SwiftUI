import SwiftUI

struct PaletteView: View {
    let palette: Palette

    var body: some View {
        HStack {
            ForEach(palette.colors, id: \.self) { color in
                Text("")
                    .frame(width: 20, height: 20, alignment: .leading)
                    .background(Color(color))
            }
        }

    }
}

struct PaletteView_Previews: PreviewProvider {
    static var previews: some View {
        PaletteView(palette: Palette.standard)
    }
}
