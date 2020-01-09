import UIKit

public enum ArtStyle: CaseIterable {
    case mosaic
    case dots
    case stripes
    case randomStripes
    case mondrian
    case bullseye
    case triangles
    case triangularMesh
    case blocks
    case brokenCircles
    case chaoticCircles
}

protocol ArtStyleDrawing {
    var minColors: Int { get }
    var maxColors: Int? { get }
    init(parameters: [String: Any]?)
    func draw(colors: [UIColor], size: CGSize, context: CGContext)
}

extension ArtStyle {
    public var name: String {
        switch self {
        case .mosaic: return "Mosaic"
        case .dots: return "Dots"
        case .stripes: return "Stripes"
        case .randomStripes: return "Random Stripes"
        case .mondrian: return "Mondrian"
        case .bullseye: return "Bullseye"
        case .triangles: return "Triangles"
        case .triangularMesh: return "Triangular Mesh"
        case .blocks: return "Blocks"
        case .brokenCircles: return "Broken Circles"
        case .chaoticCircles: return "Chaotic Circles"
        }
    }

    var drawer: ArtStyleDrawing {
        switch self {
        case .mosaic: return Mosaic()
        case .dots: return Dots()
        case .stripes: return Stripes()
        case .randomStripes: return RandomStripes()
        case .mondrian: return Mondrian()
        case .bullseye: return Bullseye()
        case .triangles: return Triangles()
        case .triangularMesh: return TriangularMesh()
        case .blocks: return Blocks()
        case .brokenCircles: return BrokenCircles()
        case .chaoticCircles: return ChaoticCircles()
        }
    }
}
