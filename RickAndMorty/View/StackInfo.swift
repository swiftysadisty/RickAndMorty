import UIKit

class StackInfo: UIStackView {
    
    var stackAxis: NSLayoutConstraint.Axis = .horizontal
    var stackDistrib: UIStackView.Distribution = .equalSpacing
    var stackAligment: UIStackView.Alignment = .center
    var ilMRA: Bool = true
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStackInfo()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupStackInfo() {
        axis = stackAxis
        distribution = stackDistrib
        alignment = stackAligment
        isLayoutMarginsRelativeArrangement = ilMRA
       
    }
}
