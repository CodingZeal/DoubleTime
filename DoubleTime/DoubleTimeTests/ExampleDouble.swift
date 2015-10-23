@testable import DoubleTime

class ExampleDouble: ExampleProtocol, TestDouble {
    let handler =  CallHandler()
    
    func zeroArgumentCommand() {
        handleCall()
    }
}
