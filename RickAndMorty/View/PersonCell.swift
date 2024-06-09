import SnapKit
import UIKit

class PersonCell: UITableViewCell {
    static let identifier = "PersonCell"
    
    private let nameEpisodes: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.numberOfLines = 0
        label.font = UIFont(name: "Gilroy-SemiBold", size: 17)
        return label
    }()
    
    private let whichEpisodes: UILabel = {
        let label = UILabel()
        label.textColor = .green
        label.font = UIFont(name: "Gilroy-Medium", size: 13)
        return label
    }()
    private let dateEpisodes: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = UIFont(name: "Gilroy-Medium", size: 12)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(with element: Episode) {
        nameEpisodes.text = element.name
        whichEpisodes.text = element.episode
        dateEpisodes.text = element.air_date
    }
       
    private func setupElements() {
       addSubview(nameEpisodes)
        addSubview(whichEpisodes)
        addSubview(dateEpisodes)
        
        nameEpisodes.snp.makeConstraints { maker in
            maker.top.equalToSuperview().offset(16)
            maker.leading.equalToSuperview().offset(16)
            maker.trailing.equalToSuperview().offset(-16)
        }
        whichEpisodes.snp.makeConstraints { maker in
            maker.top.equalTo(nameEpisodes.snp.bottom).offset(16)
            maker.leading.equalToSuperview().offset(16)
            maker.bottom.equalToSuperview().offset(-14)
        }
        dateEpisodes.snp.makeConstraints { maker in
            maker.bottom.equalToSuperview().offset(-16)
            maker.trailing.equalToSuperview().offset(-16)
        }
    }
}

#Preview{PersonCell()}
