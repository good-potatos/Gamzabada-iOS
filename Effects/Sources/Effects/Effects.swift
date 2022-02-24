import ComposableArchitecture
import Entity

public protocol Effects {
    func fetchSnsLogin(body: SnsLoginBody) -> Effect<SnsLogin, ApiError>
}

public class EffectsImpl: BaseEffect, Effects {
    override public init() {}
}
