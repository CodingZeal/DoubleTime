@testable import DoubleTime

class ExampleDouble: ExampleProtocol, TestDouble {
    let handler =  MessageHandler()
    
    func zeroArgumentCommand() {
        handler.handleMessage()
    }

    func multiArgumentCommand(number: Int, withKeyword keyword: String) {
        handler.handleMessage(with: number, keyword)
    }

    func simpleQuery() -> Int {
        return handler.handleMessage() ?? 0
    }
}
