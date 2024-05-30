import UIKit
import SnapKit

class InfoPersonController: UIViewController {
    private let personImage: UIImageView = {
        let personImage = UIImageView()
        personImage.layer.cornerRadius = 10
        personImage.layer.masksToBounds = true
        return personImage
    }()
    
    private let infoPerson: TitleLabel = {
        let infoPerson = TitleLabel()
        infoPerson.text = "Info"
        return infoPerson
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
    
    private let infoView: UIView = {
        let infoView = UIView()
        infoView.backgroundColor = .backgroundCell
        infoView.layer.cornerRadius = 16
        return infoView
    }()
    
    private let species: InfoLabelView = {
        let specie = InfoLabelView()
        specie.text = "Species:"
        return specie
    }()
    
    private let speciesResult: InfoLabelView = {
        let speciesResult = InfoLabelView()
        speciesResult.textColor = .white
        return speciesResult
    }()
    
    private let gender: InfoLabelView = {
        let gender = InfoLabelView()
        gender.text = "Gender:"
        return gender
    }()
    
    private let genderResult: InfoLabelView = {
        let gender = InfoLabelView()
        gender.textColor = .white
        return gender
    }()
    
    private let typeLabel: InfoLabelView = {
        let typeLabel = InfoLabelView()
        typeLabel.text = "Type:"
        return typeLabel
    }()
    
    private let typeLabelResult: InfoLabelView = {
        let typeLabel = InfoLabelView()
        typeLabel.textColor = .white
        return typeLabel
    }()
    
    private lazy var mainStackInfo: UIStackView = {
        let mainStackInfo = UIStackView(arrangedSubviews: [speciesStack, genderStack, typeStack])
        mainStackInfo.axis = .vertical
        mainStackInfo.distribution = .fillEqually
        mainStackInfo.isLayoutMarginsRelativeArrangement = true
        mainStackInfo.layoutMargins = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        return mainStackInfo
    }()
    
    private lazy var speciesStack: StackInfo = {
        let stackInfo = StackInfo(arrangedSubviews: [species, speciesResult])
        return stackInfo
    }()
    
    private lazy var genderStack: StackInfo = {
        let stackInfo = StackInfo(arrangedSubviews: [gender, genderResult])
        return stackInfo
    }()
    
    private lazy var typeStack: StackInfo = {
        let stackInfo = StackInfo(arrangedSubviews: [typeLabel, typeLabelResult])
        return stackInfo
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
        
        speciesResult.text = element.species.rawValue
        genderResult.text = element.gender.rawValue
        typeLabelResult.text = element.type
    }
    
    private func setupView() {
        view.addSubview(personName)
        view.addSubview(personImage)
        view.addSubview(statusPerson)
        view.addSubview(infoPerson)
        view.addSubview(infoView)
        infoView.addSubview(mainStackInfo)
    }
    
    private func setupElements() {
        setupView()
        
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
        infoPerson.snp.makeConstraints { maker in
            maker.top.equalTo(statusPerson.snp.bottom).offset(24)
            maker.leading.equalToSuperview().offset(24)
        }
        infoView.snp.makeConstraints { maker in
            maker.top.equalTo(infoPerson.snp.bottom).offset(16)
            maker.leading.equalToSuperview().offset(24)
            maker.trailing.equalToSuperview().offset(-24)
            maker.height.equalTo(130)
        }
        mainStackInfo.snp.makeConstraints { maker in
            maker.edges.equalToSuperview()
        }
    }
}

#Preview{InfoPersonController()}
