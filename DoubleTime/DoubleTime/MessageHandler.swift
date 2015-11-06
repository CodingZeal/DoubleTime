public class MessageHandler {
    private var methods = [String: MethodDouble]()

    func stub(message: String) -> MethodDouble {
        return doubleForMessage(message)
    }

    func handleMessage<T>(message: String, with args: Any...) -> T? {
        return doubleForMessage(message).handleMessage(args)
    }
    
    func wasSent(message: String, with args: Any...) -> Bool {
        return doubleForMessage(message).wasSent(with: args)
    }

    private func doubleForMessage(message: String) -> MethodDouble {
        if methods[message] == nil {
            methods[message] = MethodDouble()
        }

        return methods[message]!
    }
}
