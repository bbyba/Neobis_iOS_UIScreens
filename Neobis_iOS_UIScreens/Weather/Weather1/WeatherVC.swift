//
//  WeatherVC.swift
//  Neobis_iOS_UIScreens
//


import UIKit

class WeatherVC: UIViewController {
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Прогноз на неделю", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(didTapNextWeek), for: .touchUpInside)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        
        setupButton()
    }
    
    func setupButton(){
        view.addSubview(button)
        
        button.configuration = .filled()
        button.configuration?.baseBackgroundColor = .systemCyan
        button.configuration?.title = "Прогноз на неделю"
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.widthAnchor.constraint(equalToConstant: 250)
        ])
    }
    
    @objc func didTapNextWeek(){
        self.navigationController?.pushViewController(WeatherVC2(), animated: true)
        
    }
}

