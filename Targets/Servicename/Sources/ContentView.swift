//
//  ContentView.swift
//  Servicename
//
//  Created by seokho on 2021/11/19.
//  Copyright © 2021 tuist.io. All rights reserved.
//

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
