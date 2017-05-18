import UIKit
import NavigationDecorator

fileprivate struct Empty: Decorator {
    func decorate(_ navigationController: UINavigationController) {
        navigationController.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController.navigationBar.shadowImage = UIImage()
        navigationController.navigationBar.isOpaque = false
        navigationController.navigationBar.isTranslucent = false
        navigationController.navigationBar.backgroundColor = .clear
        navigationController.navigationBar.tintColor = UIColor(red: 147 / 255, green: 166 / 255, blue: 173 / 255, alpha: 1.0)
    }
    
    func decorateBackButton(for viewController: UIViewController, selector: Selector) {
        let backButton = UIBarButtonItem(image: UIImage(named: "arrow back"),
                                         style: .plain,
                                         target: viewController.navigationController,
                                         action: selector)
        viewController.navigationItem.leftBarButtonItem = backButton
        viewController.navigationItem.hidesBackButton = true
    }
}

fileprivate struct Blue: Decorator {
    func decorate(_ navigationController: UINavigationController) {
        navigationController.navigationBar.isOpaque = false
        navigationController.navigationBar.isTranslucent = false
        navigationController.navigationBar.tintColor = .white
        navigationController.navigationBar.barTintColor = UIColor(red: 29 / 255, green: 182 / 255, blue: 224 / 255, alpha: 1.0)
        navigationController.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        navigationController.navigationBar.shadowImage = UIImage()
        navigationController.navigationBar.setBackgroundImage(UIImage(), for: .default)
    }
    
    func decorateBackButton(for viewController: UIViewController, selector: Selector) {
        let backButton = UIBarButtonItem(image: UIImage(named: "back"),
                                         style: .plain,
                                         target:viewController.responds(to: selector) ?
                                            viewController :
                                            viewController.navigationController,
                                         action: selector)
        
        viewController.navigationItem.leftBarButtonItem = backButton
        viewController.navigationItem.hidesBackButton = true
    }
}

class MainNavigationController: NavigationController {
    
    init(nibName nibNameOrNil: String? = nil, bundle nibBundleOrNil: Bundle? = nil){
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil, decorator: Blue())
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder, decorator: Blue())
    }
}

class LoginNavigationController: NavigationController {
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?){
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil, decorator: Empty())
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder, decorator: Empty())
    }
}
