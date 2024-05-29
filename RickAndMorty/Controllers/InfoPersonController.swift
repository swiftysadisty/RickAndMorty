import UIKit
import SnapKit

class InfoPersonController: UIViewController {
    private let personImage: UIImageView = {
        let personImage = UIImageView()
        personImage.layer.cornerRadius = 10
        personImage.layer.masksToBounds = true
        return personImage
    }()
    
    private let personName: UILabel = {
        let personName = UILabel()
        personName.textColor = .white
        personName.font = UIFont(name: "Gilroy-Bold", size: 22)
        return personName
    }()
    
    private let statusPerson: UILabel = {
        let statusPerson = UILabel()
        statusPerson.font = UIFont(name: "Gilroy-Medium", size: 16)
        statusPerson.textColor = .white
        return statusPerson
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
        setupElements()
    }
    
    func configureController(with element: Person) {
        APIManager.shared.getImage(from: element.image) { [weak self] image in
            DispatchQueue.main.async {
                self?.personImage.image = image
            }
            
        }
        
        personName.text = element.name
        statusPerson.text = element.status.rawValue
        switch element.status {
                case .alive:
                    statusPerson.textColor = .green
                case .dead:
                    statusPerson.textColor = .red
                case .unknown:
                    statusPerson.textColor = .gray
                }
    }
    
    private func setupElements() {
        view.addSubview(personName)
        view.addSubview(personImage)
        view.addSubview(statusPerson)
        
        personImage.snp.makeConstraints { maker in
            maker.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(16)
            maker.centerX.equalToSuperview()
            maker.height.equalTo(148)
            maker.width.equalTo(148)
        }
        personName.snp.makeConstraints { maker in
            maker.top.equalTo(personImage.snp.bottom).offset(24)
            maker.centerX.equalToSuperview()
        }
        statusPerson.snp.makeConstraints { maker in
            maker.top.equalTo(personName.snp.bottom).offset(8)
            maker.centerX.equalToSuperview()
        }
    }
}

#Preview{InfoPersonController()}
