import SwiftUI

struct ContentView: View {
    @State private var artStyles = ArtStyle.allCases

    var body: some View {
        NavigationView {
            MasterView(artStyles: $artStyles)
                .navigationBarTitle(Text("Art Styles"))
            ArtView()
        }.navigationViewStyle(DoubleColumnNavigationViewStyle())
    }
}

struct MasterView: View {
    @Binding var artStyles: [ArtStyle]

    var body: some View {
        List {
            ForEach(artStyles, id: \.self) { style in
                NavigationLink(
                    destination: ArtView(selectedStyle: style)
                ) {
                    Text(style.name)
                }
            }
        }
    }
}

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


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
