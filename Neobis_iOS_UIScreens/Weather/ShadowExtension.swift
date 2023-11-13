import UIKit

//to change later

extension UILabel {
    func addShadowToText() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: -8, height: 13)
        self.layer.shadowRadius = 6
    }
}

extension UIView {
    func addShadowToView() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.3
        self.layer.shadowOffset = CGSize(width: -2, height: 3)      //how far away the shadow is
        self.layer.shadowRadius = 3
    }
}
