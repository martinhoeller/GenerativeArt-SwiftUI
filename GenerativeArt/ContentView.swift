import SwiftUI

struct ContentView: View {
    @State private var artStyles = [String]()

    var body: some View {
        NavigationView {
            MasterView(artStyles: $artStyles)
                .navigationBarTitle(Text("Art Styles"))
            ArtView()
        }.navigationViewStyle(DoubleColumnNavigationViewStyle())
    }
}

struct MasterView: View {
    @Binding var artStyles: [String]

    var body: some View {
        List {
            ForEach(artStyles, id: \.self) { style in
                NavigationLink(
                    destination: ArtView(selectedStyle: style)
                ) {
                    Text(style)
                }
            }
        }
    }
}

struct ArtView: View {
    var selectedStyle: String?

    var body: some View {
        Group {
            if selectedStyle != nil {
                Text(selectedStyle!)
            } else {
                Text("Detail view content goes here")
            }
        }.navigationBarTitle(Text("Detail"))
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
