import SnapKit
import UIKit

class MainController: UIViewController {
    private var data: [Person] = []
    
    private var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(PersonCellCollection.self, forCellWithReuseIdentifier: PersonCellCollection.identifier)
        collectionView.backgroundColor = .background
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    
    private var viewCharacters: UIView = {
        var viewCharacters = UIView()
        
        return viewCharacters
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        setupCollectonView()
        getPost()
        view.backgroundColor = .background
        collectionView.reloadData()
    }
    
    private func getPost() {
        APIManager.shared.getPosts {[weak self] post in
            DispatchQueue.main.async {
                self?.data = post.results
                self?.collectionView.reloadData()
            }
        }
    }
    
    
    
    private func setupCollectonView() {
        view.addSubview(viewCharacters)
        viewCharacters.addSubview(collectionView)
        viewCharacters.snp.makeConstraints { maker in
            
            maker.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(31)
            maker.leading.equalToSuperview().offset(20)
            maker.trailing.equalToSuperview().offset(-27)
            maker.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            
        }
        
        collectionView.snp.makeConstraints { maker in
            maker.edges.equalToSuperview()
        }
        
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    private func setupNavigation() {
        let titleNavigaton = UILabel()
        titleNavigaton.text = "Characters"
        titleNavigaton.font = UIFont(name: "Gilroy-Bold", size: 28)
        titleNavigaton.textColor = .white
        
        let leftItem = UIBarButtonItem(customView: titleNavigaton)
        self.navigationItem.leftBarButtonItem = leftItem
    }
}

extension MainController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PersonCellCollection.identifier, for: indexPath) as? PersonCellCollection else { return UICollectionViewCell() }
        cell.configureCell(with: data[indexPath.row])
        cell.backgroundColor = .backgroundCell
        cell.layer.cornerRadius = 16
        return cell
    }
}

extension MainController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 156, height: 202)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 3.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
}



#Preview{MainController()}
