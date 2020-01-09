import UIKit

class BrokenCircles: ArtStyleDrawing {
    var minColors: Int { return 4 }
    var maxColors: Int? { return 64 }

    var parameters: [String: Any]?

    required init(parameters: [String: Any]? = nil) {
        self.parameters = parameters
    }

    func draw(colors: [UIColor], size: CGSize, context: CGContext) {
        let columns = Int(sqrt(Double(colors.count)))
        let rows = columns
        let cellSize = size.width / CGFloat(columns)

        var colorIndex = 0
        for row in 0..<rows {
            for column in 0..<columns {
                let color = colors[colorIndex % colors.count]
                colorIndex += 1

                let cellRect = CGRect(x: CGFloat(column) * cellSize,
                                      y: CGFloat(row) * cellSize,
                                      width: cellSize, height: cellSize)

                for i in 0...3 {
                    let x: CGFloat
                    if i == 0 || i == 2 {
                        x = cellRect.minX
                    } else {
                        x = cellRect.midX
                    }

                    let y: CGFloat
                    if i == 0 || i == 1 {
                        y = cellRect.minY
                    } else {
                        y = cellRect.midY
                    }

                    let quarterRect = CGRect(x: x, y: y, width: cellRect.width / 2, height: cellRect.height / 2)
                    drawQuarterCircle(context: context, inRect: quarterRect, color: color)
                }

            }
        }
    }

    private func drawQuarterCircle(context: CGContext, inRect rect: CGRect, color: UIColor) {
        let variant = Int.random(in: 0...3)

        let center: CGPoint
        let startAngle: CGFloat
        let endAngle: CGFloat

        switch variant {
        case 0:
            center = rect.origin
            startAngle = 0.0
            endAngle = CGFloat(Double.pi / 2)
        case 1:
            center = CGPoint(x: rect.maxX, y: rect.origin.y)
            startAngle = CGFloat(Double.pi / 2)
            endAngle = CGFloat(Double.pi)
        case 2:
            center = CGPoint(x: rect.origin.x, y: rect.maxY)
            startAngle = CGFloat(3 * Double.pi / 2)
            endAngle = 0
        case 3:
            center = CGPoint(x: rect.maxX, y: rect.maxY)
            startAngle = CGFloat(Double.pi)
            endAngle = CGFloat(3 * Double.pi / 2)
        default:
            fatalError("this should never happen")
        }

        let path = UIBezierPath(arcCenter: center,
                                radius: rect.width,
                                startAngle: startAngle,
                                endAngle: endAngle,
                                clockwise: true)

        path.addLine(to: center)
        path.close()

        let alpha = CGFloat([1.0, 0.8, 0.6, 0.4].randomElement()!)
        let fillColor = color.withAlphaComponent(alpha)

        context.addPath(path.cgPath)
        context.setFillColor(fillColor.cgColor)
        context.fillPath()
    }
}
