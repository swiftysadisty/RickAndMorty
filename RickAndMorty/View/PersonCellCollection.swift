import SnapKit
import UIKit

final class PersonCellCollection: UICollectionViewCell {
    static let identifier = "PersonCellCollection"
    private var imageCell = UIImageView()
    private var labelCell: UILabel = {
        var labelCell = UILabel()
        labelCell.font = UIFont(name: "Gilroy-SemiBold", size: 17)
        labelCell.textColor = .white
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
        imageCell.image = UIImage(systemName: person.image)
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
            maker.centerX.equalToSuperview()
        }
    }
}

#Preview{PersonCellCollection()}
