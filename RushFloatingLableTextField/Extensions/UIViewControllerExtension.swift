

import UIKit

extension UIViewController {

    func setNavigationBar() {
        
        
       

        self.navigationController?.navigationBar.barTintColor = .white
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.view.backgroundColor = .white
        navigationController?.view.tintColor = .gray
        self.navigationItem.largeTitleDisplayMode = .never
        
        
        
    }
    
    
    
    func hideNavigation(){
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func showNavigation(){
        self.navigationController?.isNavigationBarHidden = false
    }
    
    func clearNavigationBg(){
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
    }
    
     func navigationTintColor(tintColor: UIColor) {
        self.navigationController?.view.tintColor = tintColor
        let LargAttrs = [
        NSAttributedString.Key.foregroundColor: tintColor,
        ]
        navigationController?.navigationBar.largeTitleTextAttributes = LargAttrs
    }
    func navigationLargTitle() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.largeTitleDisplayMode = .always
   }
    
    func setUpbackIndicatorImage(img: String){
        self.navigationController?.navigationBar.backIndicatorImage = UIImage(named: img)
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: img)
    }
    

    
}




