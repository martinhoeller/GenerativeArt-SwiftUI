import UIKit

class Mondrian: ArtStyleDrawing {
    var minColors: Int { return 3 }
    var maxColors: Int? { return nil }

    var parameters: [String: Any]?

    required init(parameters: [String: Any]? = nil) {
        self.parameters = parameters
    }

    func draw(colors: [UIColor], size: CGSize, context: CGContext) {
        let minSpacing = Int(size.width / 50)
        let minBlocks = 3
        let maxBlocks = 8
        let lineWidth = size.width / 125

        let numLinesX = Int.random(in: 2...6)
        let numLinesY = Int.random(in: 2...6)

        var xs = [CGFloat]()
        for _ in 0..<numLinesX {
            let x = CGFloat(Int.random(in: 1..<40) * minSpacing)
            xs.append(x)
        }

        var ys = [CGFloat]()
        for _ in 0..<numLinesY {
            let y = CGFloat(Int.random(in: 1..<40) * minSpacing)
            ys.append(y)
        }

        xs.sort()
        ys.sort()
        ys.reverse()

        context.setLineWidth(lineWidth)
        context.setStrokeColor(UIColor.black.cgColor)

        // vertical lines
        for index in 0..<xs.count {
            let path = UIBezierPath()
            path.move(to: CGPoint(x: xs[index], y: 0))
            path.addLine(to: CGPoint(x: xs[index], y: size.height))

            context.addPath(path.cgPath)
            context.strokePath()
        }

        // horizontal lines
        for index in 0..<ys.count {
            let path = UIBezierPath()
            path.move(to: CGPoint(x: 0, y: ys[index]))
            path.addLine(to: CGPoint(x: size.width, y: ys[index]))

            context.addPath(path.cgPath)
            context.strokePath()
        }

        // color blocks
        let numBlocks = Int.random(in: minBlocks...maxBlocks)
        for _ in 0..<numBlocks {
            let i = Int.random(in: 0..<xs.count-1)
            let j = Int.random(in: 0..<ys.count-1)

            let rect = CGRect(x: xs[i],
                              y: ys[j],
                              width: xs[i + 1] - xs[i],
                              height: ys[j + 1] - ys[j])
            let path = UIBezierPath(rect: rect)

            let color = colors.randomElement()!
            color.setFill()
            path.fill()

            UIColor.black.setStroke()
            path.lineWidth = 4
            path.stroke()
        }
    }
}
