import SwiftUI

struct ContentView: View {
    @State private var artStyles = ArtStyle.allCases

    var body: some View {
        NavigationView {
            ArtStyleListView(artStyles: $artStyles)
                .navigationBarTitle(Text("Art Styles"))
        }.navigationViewStyle(DoubleColumnNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
