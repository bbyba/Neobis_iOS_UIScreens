//
//  WeatherVC.swift
//  Neobis_iOS_UIScreens
//


import UIKit

class WeatherVC: UIViewController {
    
    //MARK: Location picker
    let locationView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let locationImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "location"))
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    let locationName: UILabel = {
        let label = UILabel()
        label.text = "Бишкек"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 22)
        label.addShadowToText()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let downArrow: UIImageView = {
        let image = UIImageView(image: UIImage(named: "opt"))
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    let notification: UIImageView = {
        let image = UIImageView(image: UIImage(named: "notification"))
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    let sunImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "bigsun"))
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    
    
    //Today's info
    let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.3)
        view.layer.cornerRadius = 20
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.white.cgColor
        view.addShadowToView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let todayDate: UILabel = {
        let label = UILabel()
        label.text = "Today, April 26th"
        label.textColor = .white
        label.font = .systemFont(ofSize: 18)
        label.textAlignment = .center
        label.addShadowToText()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let todayTemperature: UILabel = {
        let label = UILabel()
        label.text = "22°"
        label.textColor = .white
        label.font = .systemFont(ofSize: 100)
        label.textAlignment = .center
        label.addShadowToText()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let todayWeather: UILabel = {
        let label = UILabel()
        label.text = "Sunny"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 24)
        label.textAlignment = .center
        label.addShadowToText()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let windImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "wind"))
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    let windSpeed: UILabel = {
        let label = UILabel()
        label.text = "Wind | 15 km/h"
        label.font = .systemFont(ofSize: 20)
        label.textAlignment = .center
        label.textColor = .white
        label.addShadowToText()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let rainImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "droplet"))
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    let rainProbabity: UILabel = {
        let label = UILabel()
        label.text = "Rain | 26 %"
        label.font = .systemFont(ofSize: 20)
        label.textAlignment = .center
        label.textColor = .white
        label.addShadowToText()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    
    lazy var nextWeekButton: UIButton = {
        let button = UIButton()
        button.setTitle("Прогноз на неделю         ^", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.configuration = .filled()
        button.configuration?.baseBackgroundColor = .white
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(didTapNextWeek), for: .touchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    //MARK: Gradient
    lazy var gradientLayer: CAGradientLayer = {
        let gradient = CAGradientLayer()
        return gradient
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = .systemCyan
//        view.layer.addSublayer(gradientLayer)
        
        setupGradient()
        addSubviews()
        setupConstraints()
    }
    
    //MARK: Gradient
    func setupGradient() {
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor(red: 0 / 255, green: 190 / 255, blue: 229 / 255, alpha: 1).cgColor, UIColor(red: 23 / 255, green: 154 / 255, blue: 250 / 255, alpha: 1).cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
        view.layer.insertSublayer(gradientLayer, at: 0)
    }

    func addSubviews(){
        view.addSubview(locationView)
        
        locationView.addSubview(locationImage)
        locationView.addSubview(locationName)
        locationView.addSubview(downArrow)
        
        view.addSubview(notification)
        view.addSubview(sunImage)
        view.addSubview(backgroundView)
        view.addSubview(nextWeekButton)
        
        backgroundView.addSubview(todayDate)
        backgroundView.addSubview(todayTemperature)
        backgroundView.addSubview(todayWeather)
        backgroundView.addSubview(windImage)
        backgroundView.addSubview(windSpeed)
        backgroundView.addSubview(rainImage)
        backgroundView.addSubview(rainProbabity)
    }
    
    func setupConstraints(){
        
        NSLayoutConstraint.activate([
            //location
            locationView.topAnchor.constraint(equalTo: view.topAnchor, constant: 59),
            locationView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 31),
            locationView.widthAnchor.constraint(equalToConstant: 197),
            locationView.heightAnchor.constraint(equalToConstant: 37),
            
            locationImage.centerYAnchor.constraint(equalTo: locationView.centerYAnchor),
            locationImage.leadingAnchor.constraint(equalTo: locationView.leadingAnchor),
            locationImage.widthAnchor.constraint(equalToConstant: 25),
            locationImage.heightAnchor.constraint(equalToConstant: 25),
            
            locationName.centerYAnchor.constraint(equalTo: locationView.centerYAnchor),
            locationName.leadingAnchor.constraint(equalTo: locationImage.trailingAnchor, constant: 5),
            
            downArrow.centerYAnchor.constraint(equalTo: locationView.centerYAnchor),
            downArrow.leadingAnchor.constraint(equalTo: locationName.trailingAnchor, constant: 5),
            downArrow.widthAnchor.constraint(equalToConstant: 10),
            downArrow.heightAnchor.constraint(equalToConstant: 10),
    

            //notification
            notification.topAnchor.constraint(equalTo: view.topAnchor, constant: 59),
            notification.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            notification.widthAnchor.constraint(equalToConstant: 26),
            notification.heightAnchor.constraint(equalToConstant: 24),
            
            sunImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            sunImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            sunImage.widthAnchor.constraint(equalToConstant: 300),
            sunImage.heightAnchor.constraint(equalToConstant: 300),
            
            
            //Today's info
            backgroundView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backgroundView.topAnchor.constraint(equalTo: sunImage.bottomAnchor, constant: 10),
            backgroundView.widthAnchor.constraint(equalToConstant: 350),
            backgroundView.heightAnchor.constraint(equalToConstant: 335),
            
            todayDate.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
            todayDate.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 25),
            
            todayTemperature.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
            todayTemperature.topAnchor.constraint(equalTo: todayDate.bottomAnchor, constant: 15),
            
            todayWeather.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
            todayWeather.topAnchor.constraint(equalTo: todayTemperature.bottomAnchor, constant: 15),
//            todayWeather.heightAnchor.constraint(equalToConstant: 25),
            
            windImage.topAnchor.constraint(equalTo: todayWeather.bottomAnchor, constant: 30),
            windImage.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 80),
            windImage.widthAnchor.constraint(equalToConstant: 20),
            windImage.heightAnchor.constraint(equalToConstant: 20),
            
            windSpeed.topAnchor.constraint(equalTo: todayWeather.bottomAnchor, constant: 30),
            windSpeed.leadingAnchor.constraint(equalTo: windImage.trailingAnchor, constant: 15),
//            windSpeed.widthAnchor.constraint(equalToConstant: 20),
            windSpeed.heightAnchor.constraint(equalToConstant: 20),
            
            rainImage.topAnchor.constraint(equalTo: windImage.bottomAnchor, constant: 15),
            rainImage.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 80),
            rainImage.widthAnchor.constraint(equalToConstant: 20),
            rainImage.heightAnchor.constraint(equalToConstant: 20),
            
            rainProbabity.topAnchor.constraint(equalTo: windSpeed.bottomAnchor, constant: 15),
            rainProbabity.leadingAnchor.constraint(equalTo: rainImage.trailingAnchor, constant: 15),
//            rainProbabity.widthAnchor.constraint(equalToConstant: 20),
            rainProbabity.heightAnchor.constraint(equalToConstant: 20),
            
            
            nextWeekButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextWeekButton.topAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: 30),
            nextWeekButton.widthAnchor.constraint(equalToConstant: 249),
            nextWeekButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    @objc func didTapNextWeek(){
        self.navigationController?.pushViewController(WeatherVC2(), animated: true)
    }
}

