public protocol TestDouble {
    var handler: MessageHandler { get }

    func stub(message: String) -> MethodDouble

    func handleMessage<T>(message: String) -> T?

    func wasSent(message: String) -> Bool
}

extension TestDouble {
    func stub(message: String) -> MethodDouble {
        return handler.stub(message)
    }

    func handleMessage<T>(message: String = __FUNCTION__) -> T? {
        return handler.handleMessage(message)
    }

    func handleMessage(message: String = __FUNCTION__) {
        let _: Void? = handleMessage(message)
    }

    func wasSent(message: String) -> Bool {
        return handler.wasSent(message)
    }
}
