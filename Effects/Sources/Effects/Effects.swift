import ComposableArchitecture
import Entity

public protocol Effects {
    func fetchSnsLogin(body: SnsLoginBody)
}

public class EffectsImpl: Effects {
    public init() {}
    public func fetchSnsLogin(body: SnsLoginBody) {
        let api: GamzabadaApi = .snsLogin(body: body)
    }
}
