import UIKit

extension CGRect {
    init(midPoint: CGPoint, size: CGSize) {
        self.init(x: midPoint.x - size.width / 2, y: midPoint.y - size.height / 2, width: size.width, height: size.height)
    }
}
