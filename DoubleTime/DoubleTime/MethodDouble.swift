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

    func handleMessage<T>(args: [Any]) -> T? {
        actualArguments = args
        return action?() as? T
    }

    func wasSent<ArgumentTuple>(with args: ArgumentTuple?) -> Bool {
        guard let args = args else { return actualArguments != nil }
        guard let actual = actualArguments
            where Mirror(reflecting: args).children.count == IntMax(actual.count)
            else { return false }

        return allMatch(args, actuals: [Any])
    }
//
//    func allMatch(args: (), actuals: [Any]) -> Bool {
//        return actuals.count == 0
//    }

    func allMatch<A: MatcherConvertible>(arg: A, actuals: [Any]) -> Bool {
        return actuals.count == 1 &&
            matcher(arg, matches: actuals[0])
    }

    func allMatch<A: MatcherConvertible, B: MatcherConvertible>(args: (A, B), actuals: [Any]) -> Bool {
        return actuals.count == 2 &&
            matcher(args.0, matches: actuals[0]) &&
            matcher(args.1, matches: actuals[1])
    }

    func matcher<M: MatcherConvertible>(mc: M, matches value: Any) -> Bool {
        guard let value = value as? M.ValueType else { return false }

        return mc.asMatcher().matches(value)
    }
}
