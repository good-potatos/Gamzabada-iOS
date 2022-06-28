//
//  Font.swift
//
//
//  Created by Milkyo on 2022/06/27.
//

import Foundation
import SwiftUI

public extension GamzaUIKit {
    enum Font {}
}

public extension GamzaUIKit.Font {
    static var size32: Font {
        return FontSize.size32.font
    }

    static var size30: Font {
        return FontSize.size30.font
    }

    static var size28: Font {
        return FontSize.size28.font
    }

    static var size26: Font {
        return FontSize.size26.font
    }

    static var size24: Font {
        return FontSize.size24.font
    }

    static var size22: Font {
        return FontSize.size22.font
    }

    static var size20: Font {
        return FontSize.size20.font
    }

    static var size18: Font {
        return FontSize.size18.font
    }

    static var size16: Font {
        return FontSize.size16.font
    }

    static var size14: Font {
        return FontSize.size14.font
    }

    static var size12: Font {
        return FontSize.size12.font
    }

    static var size10: Font {
        return FontSize.size10.font
    }
}

private enum FontSize: CGFloat {
    case size34 = 34
    case size32 = 32
    case size30 = 30
    case size28 = 28
    case size26 = 26
    case size24 = 24
    case size22 = 22
    case size20 = 20
    case size18 = 18
    case size16 = 16
    case size14 = 14
    case size12 = 12
    case size10 = 10

    var font: Font {
        return Font.system(size: rawValue)
    }
}
