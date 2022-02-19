
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
        layer.shadowColor = UIColor.darkGray.cgColor
        layer.shadowOffset = CGSize(width: 3, height: 2)
        adjustsFontSizeToFitWidth = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setText(text: String) {
        self.text = text
    }
    
}
