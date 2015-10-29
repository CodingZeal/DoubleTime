@testable import DoubleTime

class ExampleDouble: ExampleProtocol, TestDouble {
    let handler =  MessageHandler()
    
    func zeroArgumentCommand() {
        handleMessage()
    }

    func simpleQuery() -> Int {
        return handleMessage() ?? 0
    }
}
