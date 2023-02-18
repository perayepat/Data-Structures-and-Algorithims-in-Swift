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
    func addUndirectedEdge(between source: Vertex<Element>, and destination: Vertex<Element>, weight: Double?){
        addUndirectedEdge(between: source, and: destination, weight: weight)
        addUndirectedEdge(between: destination, and: source, weight: weight)
    }
    //add
    func add(_ edge: EdgeType, from source: Vertex<Element>, to destination: Vertex<Element>, weight: Double?){
        switch edge{
        case.directed:
            addDirectedEdge(from: source, to: destination, weight: weight)
        case .undirected:
            addUndirectedEdge(between: source, and: destination, weight: weight)
        default:
            addUndirectedEdge(between: source, and: destination, weight: weight)
        }
    }
}

class AdjecencyList<T: Hashable>: Graph{
    private var adjecencies: [Vertex<T>: [Edge<T>]] = [:]
    init() { }
    
    func createdVertex(data: T) -> Vertex<T> {
        let vertex = Vertex(data: data, index: adjecencies.count)
        adjecencies[vertex] = []
        return vertex
    }
    
    func addDirectedEdge(from source: Vertex<T>, to destination: Vertex<T>, weight: Double?) {
        let edge = Edge(source: source, destination: destination, weight: weight)
        adjecencies[source]?.append(edge)
    }
    
    func edges(from source: Vertex<T>) -> [Edge<T>] {
        return adjecencies[source] ?? []
    }
    
    func weight(from source: Vertex<T>, to destination: Vertex<T>) -> Double?{
        return edges(from: source).first {$0.destination == destination}?.weight
    }
    
}
//: [Next](@next)
