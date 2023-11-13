//
//  TabBarController.swift
//  Neobis_iOS_UIScreens
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabs()
    }
    
    private func configureTabs(){
        let vc1 = WeatherVC()
        let vc2 = CryptoVC()
        let vc3 = FinanceVC()
        let vc4 = TravelVC()
        let vc5 = PhoneVC()
        
        //Set tab images
        vc1.tabBarItem.image = UIImage(systemName: "cloud.sun.circle")
        vc2.tabBarItem.image = UIImage(systemName: "bitcoinsign.circle")
        vc3.tabBarItem.image = UIImage(systemName: "dollarsign.circle")
        vc4.tabBarItem.image = UIImage(systemName: "airplane.circle")
        vc5.tabBarItem.image = UIImage(systemName: "iphone.gen1.circle")
        
        //Title
        vc1.tabBarItem.title = "Weather"
        vc2.tabBarItem.title = "Crypto"
        vc3.tabBarItem.title = "Finance"
        vc4.tabBarItem.title = "Travel"
        vc5.tabBarItem.title = "Phone"
        
        //To wrap in a navigation controller
        let nav1 = UINavigationController(rootViewController: vc1)
        let nav2 = UINavigationController(rootViewController: vc2)
        let nav3 = UINavigationController(rootViewController: vc3)
        let nav4 = UINavigationController(rootViewController: vc4)
        let nav5 = UINavigationController(rootViewController: vc5)
        
        tabBar.tintColor = .label
        tabBar.backgroundColor = .systemGray6
      
        setViewControllers([nav1, nav2, nav3, nav4, nav5], animated: true)
    }
}


