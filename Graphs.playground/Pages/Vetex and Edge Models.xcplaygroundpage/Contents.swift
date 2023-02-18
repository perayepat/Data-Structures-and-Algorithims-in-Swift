//: [Previous](@previous)
import Foundation

enum EdgeType{
    case directed
    case undirected
    case weighted
}

struct Vertex<T>{
    let data: T
    let index :Int
}

extension Vertex: Hashable where T: Hashable{}
extension Vertex: Equatable where T: Equatable{}
extension Vertex: CustomStringConvertible{
    var description: String{
        return "\(index): \(data)"
    }
}

/// Dallas -- Houston
struct Edge<T>{
    let source: Vertex<T>
    let destination: Vertex<T>
    let weight: Double?
}

    
//: [Next](@next)
