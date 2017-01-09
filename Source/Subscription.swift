import Foundation

@objc public class Subscription: NSObject {
    public let path: String
    public let taskIdentifier: Int?

    public var onOpen: (() -> Void)?
    public var onEvent: ((String, [String: String], Any) -> Void)?
    public var onEnd: ((Int?, [String: String]?, Any?) -> Void)?
    public var onError: ((Error) -> Void)?

    internal var internalOnEventHandlers: [(String, [String: String], Any) -> Void]

    public init(
        path: String,
        taskIdentifier: Int,
        onOpen: (() -> Void)? = nil,
        onEvent: ((String, [String: String], Any) -> Void)? = nil,
        onEnd: ((Int?, [String: String]?, Any?) -> Void)? = nil,
        onError: ((Error) -> Void)? = nil,
        internalOnEventHandlers: [(String, [String: String], Any) -> Void] = []) {
            self.path = path
            self.taskIdentifier = taskIdentifier
            self.onOpen = onOpen
            self.onEvent = onEvent
            self.onEnd = onEnd
            self.onError = onError
            self.internalOnEventHandlers = internalOnEventHandlers
    }
}
