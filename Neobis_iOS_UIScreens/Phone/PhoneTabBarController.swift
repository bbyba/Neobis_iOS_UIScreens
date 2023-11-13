//
//  PhoneTabBarController.swift
//  Neobis_iOS_UIScreens
//

import UIKit

class PhoneTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabs()
    }
    
    private func configureTabs(){
        let vc1 = PhoneVC()
        let vc2 = PhoneVC2()
        let vc3 = PhoneVC3()
        let vc4 = WeatherVC()

        
        //Set tab images
        vc1.tabBarItem.image = UIImage(systemName: "phonetab1")
        vc2.tabBarItem.image = UIImage(systemName: "phonetab2")
        vc3.tabBarItem.image = UIImage(systemName: "phonetab3")
        vc4.tabBarItem.image = UIImage(systemName: "arrowshape.backward.circle")
        
        //Title
        vc1.tabBarItem.title = "Series"
        vc2.tabBarItem.title = "Headspace"
        vc3.tabBarItem.title = "Profile"
        vc4.tabBarItem.title = "Home"
        
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
