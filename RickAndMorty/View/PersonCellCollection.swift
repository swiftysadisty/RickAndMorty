import SnapKit
import UIKit

final class PersonCellCollection: UICollectionViewCell {
    static let identifier = "PersonCellCollection"
    private var imageCell =  {
        var imageCell = UIImageView()
        imageCell.contentMode = .scaleAspectFit
        imageCell.layer.cornerRadius = 10
        imageCell.layer.masksToBounds = true
        return imageCell
    }()
    private var labelCell: UILabel = {
        var labelCell = UILabel()
        labelCell.font = UIFont(name: "Gilroy-SemiBold", size: 17)
        labelCell.textColor = .white
        labelCell.textAlignment = .center
        labelCell.numberOfLines = 0
        return labelCell
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func configureCell(with person: Person) {
        
        APIManager.shared.getImage(from: person.image) { [weak self] image in
            DispatchQueue.main.async {
                self?.imageCell.image = image
            }
        }
        
        labelCell.text = person.name
        
    }
    
    private func setupElements() {
        addSubview(imageCell)
        addSubview(labelCell)
        imageCell.snp.makeConstraints { maker in
            maker.top.equalToSuperview().offset(8)
            maker.leading.equalToSuperview().offset(8)
            maker.trailing.equalToSuperview().offset(-8)
            maker.height.equalTo(140)
        }
        labelCell.snp.makeConstraints { maker in
            maker.top.equalTo(imageCell.snp.bottom).offset(16)
            //maker.centerX.equalToSuperview()
            maker.leading.equalToSuperview().offset(8)
            maker.trailing.equalToSuperview().offset(-8)
        }
    }
}

#Preview{PersonCellCollection()}
