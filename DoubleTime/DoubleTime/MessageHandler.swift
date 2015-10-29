public class MessageHandler {
    private var methods = [String: MethodDouble]()

    func stub(message: String) -> MethodDouble {
        return doubleForMessage(message)
    }

    func handleMessage<T>(message: String) -> T? {
        return doubleForMessage(message).handleMessage()
    }
    
    func wasSent(message: String) -> Bool {
        return doubleForMessage(message).wasSent
    }

    func doubleForMessage(message: String) -> MethodDouble {
        if methods[message] == nil {
            methods[message] = MethodDouble()
        }

        return methods[message]!
    }
}
