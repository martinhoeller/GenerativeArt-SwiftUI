import SwiftUI

struct ArtView: View {
    var style: ArtStyle

    @State private var image: UIImage?
    @State private var numColors = 32.0
    @State var quantity: Int = 0

    private let availableColors: [UIColor] = [
        UIColor(red:0.98, green:0.93, blue:0.41, alpha:1.0),
        UIColor(red:0.94, green:0.54, blue:0.36, alpha:1.0),
        UIColor(red:0.72, green:0.23, blue:0.37, alpha:1.0),
        UIColor(red:0.42, green:0.17, blue:0.44, alpha:1.0),
        UIColor(red:0.45, green:0.71, blue:0.61, alpha:1.0),
        UIColor(red:0.00, green:0.34, blue:0.57, alpha:1.0)
    ]

    var body: some View {
        VStack(spacing: 20) {
            VStack(alignment: .leading, spacing: 4) {
                Text("Colors: \(Int(numColors))")
                ColorsSlider(numColors: $numColors, onEditingChanged: regenerateImage)
            }.padding([.leading, .trailing])

            Group {
                Image(uiImage: image ?? UIImage())
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.all, 20)
                    .background(Color.black)
            }.padding(10)


            Button("Regenerate Image", action: regenerateImage)
        }
        .navigationBarTitle(Text(style.name))
        .onAppear {
            self.regenerateImage()
        }
    }

    private func makeColors(num: Int) -> [UIColor] {
        var colors = [UIColor]()

        for _ in 0..<num {
            guard let color = availableColors.randomElement() else { continue }
            colors.append(color)
        }

        return colors
    }

    private func regenerateImage() {
        image = ImageDrawer.image(style: style,
                                  colors: makeColors(num: Int(numColors)),
                                  size: CGSize(width: 500, height: 500),
                                  margin: 20)
    }
}

struct ArtView_Previews: PreviewProvider {
    static var previews: some View {
        ArtView(style: .blocks)
    }
}
