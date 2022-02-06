//
//  Effects+Login.swift
//  
//
//  Created by Wimes on 2022/02/05.
//

import ComposableArchitecture
import Entity

extension EffectsImpl{
    public func fetchSnsLogin(body: SnsLoginBody) -> Effect<SnsLogin, ApiError>{
        self.execute(api: .snsLogin(body: body))
    }
}
