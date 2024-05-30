import UIKit

class TitleLabel: UILabel {
    
    var textColorLabel: UIColor = .white
    var fontTitle = UIFont(name: "Gilroy-SemiBold", size: 17)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTitleLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupTitleLabel() {
        textColor = textColorLabel
        font = fontTitle
    }
}
