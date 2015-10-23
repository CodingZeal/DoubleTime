public protocol TestDouble {
    var handler: CallHandler { get }

    func handleCall(message: String)

    func wasSent(message: String) -> Bool
}

extension TestDouble {
    func handleCall(message: String = __FUNCTION__) {
        handler.handleCall(message)
    }

    func wasSent(message: String) -> Bool {
        return handler.wasSent(message)
    }
}
