import UIKit

public class ImageDrawer {
    private let artStyle: ArtStyle

    public init(artStyle: ArtStyle) {
        self.artStyle = artStyle
    }

    public func image(fromColors colors: [UIColor], size: CGSize, margin: CGFloat) -> UIImage? {
        let drawer = artStyle.drawer

        guard colors.count >= drawer.minColors else { return nil }

        let latestColors: [UIColor]
        if let maxColors = drawer.maxColors {
            latestColors = Array(colors.suffix(maxColors))
        } else {
            latestColors = colors
        }

        let imageRect = CGRect(origin: .zero, size: size)
        UIGraphicsBeginImageContextWithOptions(imageRect.size, true, 0.0)

        UIColor.white.setFill()
        UIRectFill(imageRect)

        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        context.translateBy(x: margin, y: margin)

        let drawingSize = CGSize(width: size.width - margin * 2, height: size.height - margin * 2)
        drawer.draw(colors: latestColors, size: drawingSize, context: context)

        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return image
    }
}
