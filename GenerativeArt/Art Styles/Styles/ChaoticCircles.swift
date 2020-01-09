import UIKit

class ChaoticCircles: ArtStyleDrawing {
    var minColors: Int { return 3 }
    var maxColors: Int? { return 8 }

    var parameters: [String: Any]?

    required init(parameters: [String: Any]? = nil) {
        self.parameters = parameters
    }

    func draw(colors: [UIColor], size: CGSize, context: CGContext) {
        context.setLineWidth(size.width / 125)

        let diameter = size.width * 0.7
        let center = CGPoint(x: (size.width - diameter) / 2,
                             y: (size.height - diameter) / 2)


        let spread: CGFloat = 0.08

        for color in colors {
            color.setStroke()

            let xOffset = CGFloat.random(in: -spread...spread) * size.width
            let yOffset = CGFloat.random(in: -spread...spread) * size.height

            let rect = CGRect(x: center.x + xOffset, y: center.y + yOffset,
                              width: diameter, height: diameter)
            context.strokeEllipse(in: rect)
        }
    }
}
