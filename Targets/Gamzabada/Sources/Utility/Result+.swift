//
//  Result+.swift
//  Gamzabada
//
//  Created by Milkyo on 2021/12/15.
//  Copyright © 2021 takeapotato.com. All rights reserved.
//

import Foundation

extension Result {
    var value: Success? {
        guard case let .success(value) = self else {
            return nil
        }

        return value
    }

    var error: Failure? {
        guard case let .failure(error) = self else {
            return nil
        }

        return error
    }
}
