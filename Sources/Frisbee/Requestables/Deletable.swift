import Foundation

protocol Deletable {
    @discardableResult
    func delete<T: Decodable>(url: String,
                              onComplete: @escaping OnComplete<T>) -> Cancellable
    @discardableResult
    func delete<T: Decodable>(url: URL,
                              onComplete: @escaping OnComplete<T>) -> Cancellable
    @discardableResult
    func delete<T: Decodable, U: Encodable>(url: String, body: U,
                                            onComplete: @escaping OnComplete<T>) -> Cancellable
    @discardableResult
    func delete<T: Decodable, U: Encodable>(url: URL, body: U,
                                            onComplete: @escaping OnComplete<T>) -> Cancellable
}
