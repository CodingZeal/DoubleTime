public class MethodDouble {
    var wasSent = false
    var returnValue: Any?

    public func andReturn<T>(value: T) {
        returnValue = value
    }

    func handleSend<T>() -> T? {
        wasSent = true
        return returnValue as? T
    }
}