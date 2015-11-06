public protocol TestDouble {
    var handler: MessageHandler { get }

    func stub(message: String) -> MethodDouble

    func handleMessage<T>(message: String, with args: Any...) -> T?

    func wasSent(message: String, with args: Any...) -> Bool
}

extension TestDouble {
    func stub(message: String) -> MethodDouble {
        return handler.stub(message)
    }

    func handleMessage<T>(message: String = __FUNCTION__, with args: Any...) -> T? {
        return handler.handleMessage(message, with: args)
    }

    func handleMessage(message: String = __FUNCTION__, with args: Any...) {
        let _: Void? = handleMessage(message, with: args)
    }

    func wasSent(message: String, with args: Any...) -> Bool {
        return handler.wasSent(message, with: args)
    }
}
