import SwiftUI

struct ArtView: View {
    var selectedStyle: ArtStyle?

    var body: some View {
        Group {
            if selectedStyle != nil {
                Text(selectedStyle!.name)
            } else {
                Text("Detail view content goes here")
            }
        }.navigationBarTitle(Text("Detail"))
    }
}

struct ArtView_Previews: PreviewProvider {
    static var previews: some View {
        ArtView()
    }
}
