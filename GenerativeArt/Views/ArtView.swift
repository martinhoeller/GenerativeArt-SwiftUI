import SwiftUI

struct ArtView: View {
    var style: ArtStyle

    @State private var palette = Palette.standard
    @State private var image: UIImage?
    @State private var numColors = 32.0
    @State private var showingShareSheet = false

    var body: some View {
        VStack(alignment: .center) {
            VStack(alignment: .leading, spacing: 20) {
                HStack(spacing: 10) {
                    Text("Palette:")
                    PaletteView(palette: palette)
                }.padding([.leading, .trailing], 15)
                
                ColorsSlider(numColors: $numColors, onEditingChanged: regenerateImage)
                    .padding([.leading, .trailing])

                Image(uiImage: image ?? UIImage())
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.all, 20)
                    .background(Color.black)
                    .padding(10)
            }
            Button("Regenerate Image", action: regenerateImage)
        }
        .onAppear {
            self.regenerateImage()
        }
        .navigationBarTitle(Text(style.name))
        .navigationBarItems(trailing:
            Button(action: {
                self.showingShareSheet = true
            }) {
                Image(systemName: "square.and.arrow.up")
            }
            .sheet(isPresented: $showingShareSheet) {
                ShareSheet(activityItems: [self.image!], applicationActivities: nil)
            }
        )
    }

    private func makeColors(num: Int) -> [UIColor] {
        var colors = [UIColor]()

        for _ in 0..<num {
            guard let color = palette.colors.randomElement() else { continue }
            colors.append(color)
        }

        return colors
    }

    private func regenerateImage() {
        image = ImageDrawer.image(style: style,
                                  colors: makeColors(num: Int(numColors)),
                                  size: CGSize(width: 1500, height: 1500),
                                  margin: 20)
    }
}

struct ArtView_Previews: PreviewProvider {
    static var previews: some View {
        ArtView(style: .blocks)
    }
}
