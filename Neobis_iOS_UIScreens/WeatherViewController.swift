//
//  WeatherViewController.swift
//  Neobis_iOS_UIScreens
//
//  Created by Burte Bayaraa on 2023.11.10.
//

import UIKit

class WeatherViewController: UIViewController {

    lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Прогноз на неделю", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(didTapNextWeek), for: .touchUpInside)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        
        configureUI()
    }
    
    func configureUI(){
        view.addSubview(button)
    }
    
    @objc func didTapNextWeek(){
        self.navigationController?.pushViewController(Weather2ViewController, animated: true)
        
    }

}
