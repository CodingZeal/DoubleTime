import XCTest
@testable import DoubleTime

class SpyTests: XCTestCase {
    let double = ExampleDouble()

    func testConfirmsThatSpyWasCalled() {
        double.zeroArgumentCommand()
        
        XCTAssert(double.wasSent("zeroArgumentCommand()"))
    }

    func testFailsWhenSpyWasNotCalled() {
        XCTAssertFalse(double.wasSent("zeroArgumentCommand()"))
    }

    func testConfirmsThatSpyWasCalledWithArguments() {
        double.multiArgumentCommand(42, withKeyword: "KEYWORD")

        XCTAssert(double.wasSent("multiArgumentCommand(_:withKeyword:)", with: 42, "KEYWORD"))
    }

//    func testFailsWhenSpyCalledWithIncorrectArguments() {
//        double.multiArgumentCommand(43, withKeyword: "KEYWORD")
//
//        XCTAssertFalse(double.wasSent("multiArgumentCommand(_:withKeyword:)", with: 42, "KEYWORD"))
//    }

    func testPositiveAssertion() {
        double.zeroArgumentCommand()
        AssertDouble(double, wasSent: "zeroArgumentCommand()")
    }

    func testNegativeAssertion() {
        AssertDouble(double, wasNotSent: "zeroArgumentCommand()")
    }
}
