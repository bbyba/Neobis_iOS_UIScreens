//
//  CryptoTabBarController.swift
//  Neobis_iOS_UIScreens
//

import UIKit

class CryptoTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabs()
    }
    
    private func configureTabs(){
        let vc1 = CryptoVC()
        let vc2 = CryptoVC2()
        let vc3 = CryptoVC3()
        let vc4 = WeatherVC()

        
        //Set tab images
        vc1.tabBarItem.image = UIImage(systemName: "cryptotab1")
        vc2.tabBarItem.image = UIImage(systemName: "cryptotab2")
        vc3.tabBarItem.image = UIImage(systemName: "cryptotab3")
        vc4.tabBarItem.image = UIImage(systemName: "arrowshape.backward.circle")
        
        //To wrap in a navigation controller
        let nav1 = UINavigationController(rootViewController: vc1)
        let nav2 = UINavigationController(rootViewController: vc2)
        let nav3 = UINavigationController(rootViewController: vc3)
        let nav4 = UINavigationController(rootViewController: vc4)

        
        tabBar.tintColor = .label
        tabBar.backgroundColor = .systemGray6
      
        setViewControllers([nav1, nav2, nav3, nav4], animated: true)
    }

}
