//
//  Publisher+.swift
//  Gamzabada
//
//  Created by Milkyo on 2021/12/15.
//  Copyright © 2021 takeapotato.com. All rights reserved.
//

import Combine

extension Publisher {
    func flatMapLatest<T: Publisher>(_ transform: @escaping (Self.Output) -> T) -> AnyPublisher<T.Output, T.Failure> where T.Failure == Self.Failure {
        return map(transform).switchToLatest().eraseToAnyPublisher()
    }

    static func empty() -> AnyPublisher<Output, Failure> {
        return Empty().eraseToAnyPublisher()
    }

    static func just(_ output: Output) -> AnyPublisher<Output, Never> {
        return Just(output)
            .eraseToAnyPublisher()
    }

    func mapToResult() -> AnyPublisher<Result<Output, Failure>, Never> {
        map(Result.success)
            .catch { Just(.failure($0)) }
            .eraseToAnyPublisher()
    }
}
