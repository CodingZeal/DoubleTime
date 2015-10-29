public protocol TestDouble {
    var handler: CallHandler { get }

    func stub(message: String) -> MethodDouble

    func handleCall<T>(message: String) -> T?

    func wasSent(message: String) -> Bool
}

extension TestDouble {
    func stub(message: String) -> MethodDouble {
        return handler.stub(message)
    }

    func handleCall<T>(message: String = __FUNCTION__) -> T? {
        return handler.handleCall(message)
    }

    func handleCall(message: String = __FUNCTION__) {
        let _: Void? = handleCall(message)
    }

    func wasSent(message: String) -> Bool {
        return handler.wasSent(message)
    }
}
