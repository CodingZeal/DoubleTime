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
}
