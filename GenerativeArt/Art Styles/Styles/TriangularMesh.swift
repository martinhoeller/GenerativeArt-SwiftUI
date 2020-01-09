import UIKit

class TriangularMesh: ArtStyleDrawing {
    var minColors: Int { return 3 }
    var maxColors: Int? { return nil }

    var parameters: [String: Any]?

    required init(parameters: [String: Any]? = nil) {
        self.parameters = parameters
    }

    func draw(colors: [UIColor], size: CGSize, context: CGContext) {
        context.setLineJoin(.bevel)
        context.setLineWidth(size.width / 250)

        var lines = [[CGPoint]]()
        let gap = size.width / 8

        var odd = false

        for y in stride(from: Int(gap/2), to: Int(size.height), by: Int(gap)) {
            odd = !odd

            var line = [CGPoint]()

            for x in stride(from: Int(gap/4), to: Int(size.width), by: Int(gap)) {
                let point = CGPoint(x: CGFloat(x) + CGFloat.random(in: -0.4...0.4) * gap + (odd ? gap/2 : 0),
                                    y: CGFloat(y) + CGFloat.random(in: -0.4...0.4) * gap)
                line.append(point)
            }

            lines.append(line)
        }


        var colorIndex = 0
        odd = true
        for y in 0..<lines.count - 1{
            odd = !odd

            var dotLine = [CGPoint]()
            for i in 0..<lines[y].count {
                dotLine.append(odd ? lines[y][i] : lines[y + 1][i])
                dotLine.append(odd ? lines[y + 1][i] : lines[y][i])
            }

            for i in 0..<dotLine.count - 2 {
                let color = colors[colorIndex % colors.count]
                colorIndex += 1
                drawTriangle(context: context, a: dotLine[i], b: dotLine[i + 1], c: dotLine[i + 2], color: color)
            }
        }
    }

    private func drawTriangle(context: CGContext, a: CGPoint, b: CGPoint, c: CGPoint, color: UIColor) {
        context.beginPath()
        context.move(to: a)
        context.addLine(to: b)
        context.addLine(to: c)
        context.addLine(to: a)
        context.closePath()

        context.setFillColor(color.cgColor)
        context.setStrokeColor(UIColor.black.cgColor)

        context.drawPath(using: .fillStroke)
    }
}
