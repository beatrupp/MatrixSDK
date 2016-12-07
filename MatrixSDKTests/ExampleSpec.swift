//
//  ExampleSpec.swift
//  MatrixSDK
//
//  Created by Gustavo Perdomo on 12/6/16.
//  Copyright © 2016 Gustavo Perdomo. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import MatrixSDK

class ExampleSpec: QuickSpec {
   override func spec() {
        describe("ExampleSpec") {
            it("it pass") {
                expect(true).to(beTrue())
            }
        }
    }
}
