import UIKit

class Bullseye: ArtStyleDrawing {
    var minColors: Int { return 3 }
    var maxColors: Int? { return nil }

    var parameters: [String: Any]?

    required init(parameters: [String: Any]? = nil) {
        self.parameters = parameters
    }

    private let minColorsPerBullseye = 3
    private let maxColorsPerBullseye = 10

    func draw(colors: [UIColor], size: CGSize, context: CGContext) {
        let numberOfBullseyes: Int
        let diameter: CGFloat

        if colors.count >= minColorsPerBullseye * 4 {
            numberOfBullseyes = 4
            diameter = size.width * 0.47
        } else {
            numberOfBullseyes = 1
            diameter = size.width * 0.83
        }

        let imageRect = CGRect(origin: .zero, size: size)

        if numberOfBullseyes == 1 {
            drawBullseye(at: CGPoint(x: imageRect.midX, y: imageRect.midY),
                         size: CGSize(width: diameter, height: diameter),
                         colors: colors,
                         context: context)
        } else {
            let numColors = min(maxColorsPerBullseye * 4, colors.count)
            let colorsPerBullseye = Int(Double(numColors) / 4.0)
            let reducedColors = Array(colors.suffix(colorsPerBullseye * 4))

            for bullseyeIndex in 0..<numberOfBullseyes {
                let colorStartIndex = bullseyeIndex * colorsPerBullseye
                let colorEndIndex = colorStartIndex + colorsPerBullseye - 1
                let currentColors = Array(reducedColors[colorStartIndex...colorEndIndex])

                let x, y: CGFloat

                if bullseyeIndex == 0 || bullseyeIndex == 2 {
                    x = diameter / 2
                } else {
                    x = size.width - diameter / 2
                }

                if bullseyeIndex < 2 {
                    y = diameter / 2
                } else {
                    y = size.height - diameter / 2
                }

                drawBullseye(at: CGPoint(x: x, y: y),
                             size: CGSize(width: diameter, height: diameter),
                             colors: currentColors,
                             context: context)
            }
        }
    }

    private func drawBullseye(at center: CGPoint, size: CGSize, colors: [UIColor], context: CGContext) {
        let circles = min(maxColorsPerBullseye, colors.count)
        let colorIndexes = Array(Array(0..<circles).reversed())

        let minRingWidth = size.width * 0.015
        let maxRingWidth = size.width * 0.068

        let innerDiameter = size.width * CGFloat.random(in: 0.3...0.45)
        let outerDiameter = size.width

        var diameters = [outerDiameter]
        var lastDiameter = innerDiameter
        for _ in 0..<circles-2 {
            let diameter = lastDiameter + CGFloat.random(in: minRingWidth...maxRingWidth)
            diameters.append(diameter)
            lastDiameter = diameter
        }
        diameters.append(innerDiameter)

        diameters.sort()
        diameters.reverse()

        for index in 0..<diameters.count {
            let diameter = diameters[index]
            let color = colors[colorIndexes[index]]
            context.setFillColor(color.cgColor)
            let rect = CGRect(x: center.x - diameter / 2.0,
                              y: center.y - diameter / 2.0,
                              width: diameter, height: diameter)
            context.fillEllipse(in: rect)
        }
    }
}
