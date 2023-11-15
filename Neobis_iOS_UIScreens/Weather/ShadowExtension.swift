import UIKit

//to change later

extension UILabel {
    func addShadowToText() {
        self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
        self.layer.shadowOpacity = 1
        self.layer.shadowRadius = 1
//        self.layer.bounds = .bounds
//        self.layer.position = .center
        self.layer.shadowOffset = CGSize(width: -2, height: 3)
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
