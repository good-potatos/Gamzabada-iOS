//
//  SwiftUIView.swift
//  
//
//  Created by Milkyo on 2022/01/17.
//

import SwiftUI

public struct SwiftUIView: View {
    
    public init() { }
    
    public var body: some View {
        #if DEBUG
        Text("HELLO DEBUG WORLD")
        #else
        Text("HELLO WORLD")
        #endif
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
