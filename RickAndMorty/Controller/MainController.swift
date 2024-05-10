import SnapKit
import UIKit

class MainController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        view.backgroundColor = .red
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

#Preview{MainController()}
