//
//  Image+.swift
//
//
//  Created by Milkyo on 2022/06/29.
//

import Kingfisher
import SwiftUI

public extension Image {
    @ViewBuilder
    static func source(_ imageSource: ImageSource) -> some View {
        switch imageSource {
        case let .image(name):
            Image(name)
                .resizable()
        case let .url(url):
            KFImage(URL(string: url))
                .resizable()
        }
    }
}

public enum ImageSource {
    case image(String)
    case url(String)
}
