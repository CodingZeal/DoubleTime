public protocol TestDouble {
    var handler: MessageHandler { get }

    func stub(message: String) -> MethodDouble

    func wasSent<ArgumentTuple>(message: String, with args: ArgumentTuple?) -> Bool
}

extension TestDouble {
    func stub(message: String) -> MethodDouble {
        return handler.stub(message)
    }

    func wasSent<ArgumentTuple>(message: String, with args: ArgumentTuple?) -> Bool {
        return handler.wasSent(message, with: args)
    }

    func wasSent(message: String) -> Bool {
        let args: ()? = nil
        return wasSent(message, with: args)
    }
}
