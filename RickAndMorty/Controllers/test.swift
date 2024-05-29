import UIKit
final class InfoController: UIViewController {
    private let rightLabel: UILabel = {
        let label = UILabel()
        label.text = "Right Label"
        label.textColor = .white
        label.numberOfLines = 0
        label.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        return label
    }()
    
    private let leftLabel: UILabel = {
        let label = UILabel()
        label.text = "Left Label"
        label.textColor = .white
        label.numberOfLines = 0
        label.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        return label
    }()
    
    private let centerLabel: UILabel = {
        let label = UILabel()
        label.text = "Center Label"
        label.textColor = .white
        label.numberOfLines = 0
        label.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        return label
    }()
    
    private lazy var horizontalStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [leftLabel, rightLabel, centerLabel])
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .equalSpacing
        stack.backgroundColor = UIColor.gray
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layoutMargins = UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0)
        
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStackView()
        setupLabels()
    }
    
    private func setupLabels() {
        NSLayoutConstraint.activate([
            leftLabel.widthAnchor.constraint(lessThanOrEqualTo: horizontalStackView.widthAnchor, multiplier: 0.5),
            rightLabel.widthAnchor.constraint(lessThanOrEqualTo: horizontalStackView.widthAnchor, multiplier: 0.5)
        ])
    }
    
    private func setupStackView() {
        view.addSubview(horizontalStackView)
        
        NSLayoutConstraint.activate([
            horizontalStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            horizontalStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            horizontalStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            horizontalStackView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
}

#Preview{InfoController()}
