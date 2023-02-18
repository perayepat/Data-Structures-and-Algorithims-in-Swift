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

protocol Graph{
    //makes sure it works with any type of element
    /// Definition of a graph protocol which are common and this doesnt depend on the type of graph
    associatedtype Element
    func createdVertex(data: Element) -> Vertex<Element>
    func addDirectedEdge(from source: Vertex<Element>, to destination: Vertex<Element>, weight: Double?)
    func addUndirectedEdge(between source: Vertex<Element>, and destination: Vertex<Element>, weight: Double?)
    func add(_ add: EdgeType, from source: Vertex<Element>, to destination: Vertex<Element>, weight: Double?)
    func edges(from source: Vertex<Element>) -> [Edge<Element>]
    func weight(from source: Vertex<Element>, to destination: Vertex<Element>) -> Double?
}
    
extension Graph{
    //add UnirectedGraph
    
    //add  
}
//: [Next](@next)
