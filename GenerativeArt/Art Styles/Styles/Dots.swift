import UIKit

class Dots: ArtStyleDrawing {
    var minColors: Int { return 8 }
    var maxColors: Int? { return 2500 }

    var parameters: [String: Any]?

    required init(parameters: [String: Any]? = nil) {
        self.parameters = parameters
    }

    func draw(colors: [UIColor], size: CGSize, context: CGContext) {
        let columns = Int(sqrt(Double(colors.count)))
        let rows = columns
        let cellSize = (size.width) / CGFloat(columns)

        for row in 0..<rows {
            for column in 0..<columns {
                let index = row * columns + column
                let color = colors[index]
                color.setFill()

                let cellRect = CGRect(x: CGFloat(column) * cellSize,
                                      y: CGFloat(row) * cellSize,
                                      width: cellSize, height: cellSize)

                context.fillEllipse(in: cellRect)
            }
        }
    }
}
