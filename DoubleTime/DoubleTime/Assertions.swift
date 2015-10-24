import XCTest

func AssertDouble(double: TestDouble, wasSent message: String, file: String = __FILE__, line: UInt = __LINE__) {
    XCTAssert(double.wasSent(message), "expected \(message) to have been sent to \(double)", file: file, line: line)
}

func AssertDouble(double: TestDouble, wasNotSent message: String, file: String = __FILE__, line: UInt = __LINE__) {
    XCTAssertFalse(double.wasSent(message), "expected \(message) not to have been sent to \(double)", file: file, line: line)
}
