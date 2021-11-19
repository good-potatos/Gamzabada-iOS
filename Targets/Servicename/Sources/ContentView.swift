import SwiftUI

struct ContentView: View {
    var body: some View {
        #if DEBUG
        Text("Hello, DEBUG!")
        #else
        Text("Hello, RELEASE")
        #endif
    }
    
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
