import XCTest

class StubTests: XCTestCase {
    let double = ExampleDouble()

    func testReturnsStubbedValue() {
        double.stub("simpleQuery()").andReturn(42)

        XCTAssertEqual(42, double.simpleQuery())
    }
}
