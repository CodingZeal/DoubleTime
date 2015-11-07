public class MessageHandler {
    private var methods = [String: MethodDouble]()

    func stub(message: String) -> MethodDouble {
        return doubleForMessage(message)
    }

    func handleMessage<T>(message: String = __FUNCTION__, with args: Any...) -> T? {
        return handle(message, with: args)
    }

    func handleMessage(message: String = __FUNCTION__, with args: Any...) {
        let _:Void? = handle(message, with: args)
    }
    
    func wasSent<ArgumentTuple>(message: String, with args: ArgumentTuple?) -> Bool {
        return doubleForMessage(message).wasSent(with: args)
    }

    private func handle<T>(message: String, with args: [Any]) -> T? {
        return doubleForMessage(message).handleMessage(args)
    }

    private func doubleForMessage(message: String) -> MethodDouble {
        if methods[message] == nil {
            methods[message] = MethodDouble()
        }

        return methods[message]!
    }
}
