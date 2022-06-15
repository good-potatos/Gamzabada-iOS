//
//  GamzabadaUITestsLaunchTests.swift
//  GamzabadaUITests
//
//  Created by Milkyo on 2022/06/15.
//

import XCTest

class GamzabadaUITestsLaunchTests: XCTestCase {
    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
