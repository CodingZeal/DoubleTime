import XCTest

class StubTests: XCTestCase {
    let double = ExampleDouble()

    func testReturnsFixedValue() {
        double.stub("simpleQuery()").andReturn(42)

        XCTAssertEqual(42, double.simpleQuery())
    }

    func testEvaluatesBlock() {
        let value = 37
        double.stub("simpleQuery()").andCall() { value + 5 }

        XCTAssertEqual(42, double.simpleQuery())
    }

    func testReturnsDefaultValueWhenNoStubProvided() {
        XCTAssertEqual(0, double.simpleQuery())
    }

    func testReturnsDefaultValueWhenStubIsWrongType() {
        double.stub("simpleQuery()").andReturn("not an Int")
        XCTAssertEqual(0, double.simpleQuery())
    }
}
