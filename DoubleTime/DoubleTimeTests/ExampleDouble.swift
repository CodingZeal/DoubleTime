@testable import DoubleTime

class ExampleDouble: ExampleProtocol, TestDouble {
    let handler =  MessageHandler()
    
    func zeroArgumentCommand() {
        handleMessage()
    }

    func multiArgumentCommand(number: Int, withKeyword keyword: String) {
        handleMessage(with: number, keyword)
    }

    func simpleQuery() -> Int {
        return handleMessage() ?? 0
    }
}
