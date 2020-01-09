import UIKit

class RandomStripes: ArtStyleDrawing {
    var minColors: Int { return 4 }
    var maxColors: Int? { return 50 }

    var parameters: [String: Any]?

    required init(parameters: [String: Any]? = nil) {
        self.parameters = parameters
    }

    func draw(colors: [UIColor], size: CGSize, context: CGContext) {
        context.setLineWidth(size.width / 250)
        context.setStrokeColor(UIColor.white.cgColor)

        let maxRows = 8
        let numPoints = 7
        let xVariance: CGFloat = size.width * 0.04
        let yVariance: CGFloat = size.height * 0.02

        let rows = min(maxRows, colors.count)
        let rowHeight = size.height / CGFloat(rows)

        var lastPoints: [CGPoint] = [.zero, CGPoint(x: size.width, y: 0)]

        for row in 0..<rows {
            var points = [CGPoint]()

            for index in 0..<numPoints {
                let x: CGFloat
                if index == 0 {
                    x = 0
                } else if index == numPoints - 1 {
                    x = size.width
                } else {
                    let offset = CGFloat.random(in: -xVariance ..< xVariance)
                    x = CGFloat(index) * size.width / CGFloat(numPoints) + offset
                }

                let y: CGFloat
                if row == rows - 1 {
                    y = size.height
                } else {
                    let offset = CGFloat.random(in: -yVariance ..< yVariance)
                    y = CGFloat(row + 1) * rowHeight + offset
                }

                points.append(CGPoint(x: x, y: y))
            }

            let color = colors[row]
            color.setFill()

            let path = UIBezierPath()
            path.move(to: lastPoints[0])
            for point in lastPoints {
                path.addLine(to: point)
            }

            for point in points.reversed() {
                path.addLine(to: point)
            }

            path.close()

            context.addPath(path.cgPath)

            context.drawPath(using: .fillStroke)

            lastPoints = points
        }
    }
}
