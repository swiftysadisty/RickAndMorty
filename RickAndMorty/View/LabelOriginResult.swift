
import UIKit

class LabelOriginResult: UILabel {
    
    var colorText: UIColor = .green
    var fontText = UIFont(name: "Gilroy-Medium", size: 13)
    var numberLines: Int = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLabelOriginResult()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLabelOriginResult() {
        textColor = colorText
        font = fontText
        numberOfLines = numberLines
        setContentHuggingPriority(.defaultHigh, for: .horizontal)
    }
}
