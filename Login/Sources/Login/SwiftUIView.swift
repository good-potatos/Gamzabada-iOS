//
//  SwiftUIView.swift
//
//
//  Created by Milkyo on 2022/01/17.
//

import SwiftUI
import Effects
import Combine

public struct SwiftUIView: View {
    var cancelBag = Set<AnyCancellable>()
    public init() {
        let effect: Effects = EffectsImpl()
        let body = SnsLoginBody(
            accessToken: "string",
            snsType: "KAKAO",
            snsUserId: "string"
        )
        
        effect.fetchSnsLogin(body: body)
            .sink { completion in
                if case let .failure(error) = completion{
                    print(error)
                }
            } receiveValue: { result in
                print(result)
            }
            .store(in: &self.cancelBag)
        

    }
    
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
