
import Foundation
import UIKit

class CustomUILabel: UILabel{
    
    init(title: String, fontSize: CGFloat) {
        super.init(frame: .zero)
        
        text = title
        textColor = .white
        textAlignment = .center
        font = UIFont.systemFont(ofSize: fontSize, weight: .light)
        numberOfLines = 1
        layer.shadowOpacity = 0.3
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 5, height: 3)
        adjustsFontSizeToFitWidth = true
        numberOfLines = 0
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setText(text: String) {
        self.text = text
    }
    
}
