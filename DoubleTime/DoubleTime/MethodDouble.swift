public class MethodDouble {
    typealias Action = () -> Any?

    var wasSent = false
    var action: Action?

    public func andReturn<T>(value: T) {
        andCall() { value }
    }

    public func andCall<T>(action: () -> T) {
        self.action = action
    }

    func handleMessage<T>() -> T? {
        wasSent = true
        return action?() as? T
    }
}
