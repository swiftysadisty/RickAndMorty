
import UIKit

class InfoLabelView: UILabel {
    
    var colorText: UIColor = .gray
    var fontText = UIFont(name: "Gilroy-Medium", size: 17)
    var numberLines: Int = 0
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupInfoLabelView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupInfoLabelView() {
        textColor = colorText
        font = fontText
        numberOfLines = numberLines
        setContentHuggingPriority(.defaultHigh, for: .horizontal)
    }
}
