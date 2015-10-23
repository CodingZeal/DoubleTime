public class CallHandler {
    private var callLog = [String]()

    func handleCall(message: String) {
        callLog.append(message)
    }
    
    func wasSent(message: String) -> Bool {
        return callLog.contains() { $0 == message }
    }
}
