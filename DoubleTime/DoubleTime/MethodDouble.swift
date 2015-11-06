public class MethodDouble {
    typealias Action = () -> Any?

    var actualArguments: [Any]?
    var action: Action?

    public func andReturn<T>(value: T) {
        andCall() { value }
    }

    public func andCall<T>(action: () -> T) {
        self.action = action
    }

    func handleMessage<T>(args: Any...) -> T? {
        actualArguments = args
        return action?() as? T
    }

    func wasSent(with args: Any...) -> Bool {
        return matches(args, actualArguments)
    }

    private func matches(expected: [Any], _ actual: [Any]?) -> Bool {
        guard let actual = actual
            where expected.count == actual.count
            else { return false }

        return zip(expected, actual).map { matchOne($0.0, $0.1) }.reduce(true) { $0 && $1 }
    }

    private func matchOne(expected: Any, _ actual: Any) -> Bool {
        return true
    }
}
