import UIKit

class Stripes: ArtStyleDrawing {
    var minColors: Int { return 4 }
    var maxColors: Int? { return 100 }

    var parameters: [String: Any]?

    required init(parameters: [String: Any]? = nil) {
        self.parameters = parameters
    }

    func draw(colors: [UIColor], size: CGSize, context: CGContext) {
        let rows = colors.count
        let rowHeight = size.height / CGFloat(rows)

        for row in 0..<rows {
            let color = colors[row]
            color.setFill()

            let rowRect = CGRect(x: 0,
                                 y: CGFloat(row) * rowHeight,
                                 width: size.width, height: rowHeight)

            UIRectFill(rowRect)
        }
    }
}
