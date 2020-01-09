import UIKit

class Blocks: ArtStyleDrawing {
    var minColors: Int { return 3 }
    var maxColors: Int? { return nil }

    var parameters: [String: Any]?

    required init(parameters: [String: Any]? = nil) {
        self.parameters = parameters
    }

    func draw(colors: [UIColor], size: CGSize, context: CGContext) {
        let columns = 8
        let rows = 8

        let cellSize = size.width / CGFloat(columns)

        var colorIndex = 0

        for row in 0..<rows {
            for column in 0..<columns {
                let color = colors[colorIndex % colors.count]
                colorIndex += 1
                let nextColor = colors[colorIndex % colors.count]

                let outerRect = CGRect(x: CGFloat(column) * cellSize,
                                      y: CGFloat(row) * cellSize,
                                      width: cellSize, height: cellSize)

                // outer
                if Int.random(in: 0...1) == 0 {
                    color.setFill()
                    UIRectFill(outerRect)
                }

                // inner
                if Int.random(in: 0...1) == 0 {
                    let inset = CGFloat.random(in: 0.1...0.3) * cellSize
                    var innerRect = outerRect.insetBy(dx: inset, dy: inset)

                    if Int.random(in: 0..<10) >= 8 {
                        let offsetX = CGFloat([-1, 1].randomElement()!) * 0.05 * cellSize
                        let offsetY = CGFloat([-1, 1].randomElement()!) * 0.05 * cellSize
                        innerRect = innerRect.offsetBy(dx: offsetX, dy: offsetY)
                    }

                    nextColor.setFill()
                    UIRectFill(innerRect)
                }
            }
        }
    }
}
