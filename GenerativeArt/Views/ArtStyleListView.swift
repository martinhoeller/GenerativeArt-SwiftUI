import SwiftUI

struct ArtStyleListView: View {
    @Binding var artStyles: [ArtStyle]

    var body: some View {
        List {
            ForEach(artStyles, id: \.self) { style in
                NavigationLink(
                    destination: ArtView(style: style)
                ) {
                    Text(style.name)
                }
            }
        }
    }
}

struct ArtStyleListView_Previews: PreviewProvider {
    static var previews: some View {
        ArtStyleListView(artStyles: .constant(ArtStyle.allCases))
    }
}
