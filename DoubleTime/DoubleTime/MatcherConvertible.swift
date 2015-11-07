public protocol MatcherConvertible {
    typealias ValueType

    func asMatcher() -> Matcher<ValueType>
}

extension Bool: MatcherConvertible {
    public func asMatcher() -> Matcher<Bool> {
        return equals(self)
    }
}

extension Int: MatcherConvertible {
    public func asMatcher() -> Matcher<Int> {
        return equals(self)
    }
}

extension Float: MatcherConvertible {
    public func asMatcher() -> Matcher<Float> {
        return equals(self)
    }
}

extension Double: MatcherConvertible {
    public func asMatcher() -> Matcher<Double> {
        return equals(self)
    }
}

extension String: MatcherConvertible {
    public func asMatcher() -> Matcher<String> {
        return equals(self)
    }
}
