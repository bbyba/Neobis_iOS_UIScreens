//
//  WeatherVC.swift
//  Neobis_iOS_UIScreens
//


import UIKit

class WeatherVC: UIViewController {
    
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
        label.font = .boldSystemFont(ofSize: 24)
        label.addShadowToText()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let downVector: UIImageView = {
        let image = UIImageView(image: UIImage(named: "downvector"))
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
    
    let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.5)
        view.layer.cornerRadius = 20
        view.addShadowToView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let todayDate: UILabel = {
        let label = UILabel()
        label.text = "Today, April 26th"
        label.textColor = .white
        label.font = .systemFont(ofSize: 18)
        label.addShadowToText()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let todayTemperature: UILabel = {
        let label = UILabel()
        label.text = "22°"
        label.textColor = .white
        label.font = .systemFont(ofSize: 100)
        label.addShadowToText()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let todayWeather: UILabel = {
        let label = UILabel()
        label.text = "Sunny"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 24)
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
        label.textColor = .white
        label.font = .systemFont(ofSize: 20)
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
        label.textColor = .white
        label.font = .systemFont(ofSize: 20)
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

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemCyan
        
        addSubviews()
        setupConstraints()
    }
    
    func addSubviews(){
        view.addSubview(locationImage)
        view.addSubview(locationName)
        view.addSubview(downVector)
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
            locationImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            locationImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            locationImage.widthAnchor.constraint(equalToConstant: 25),
            locationImage.heightAnchor.constraint(equalToConstant: 25),
            
            locationName.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            locationName.leadingAnchor.constraint(equalTo: locationImage.trailingAnchor, constant: 5),
            locationName.heightAnchor.constraint(equalToConstant: 25),
            
            downVector.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            downVector.leadingAnchor.constraint(equalTo: locationName.trailingAnchor, constant: 5),
            downVector.widthAnchor.constraint(equalToConstant: 20),
            downVector.heightAnchor.constraint(equalToConstant: 25),
            
            notification.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            notification.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            notification.widthAnchor.constraint(equalToConstant: 25),
            notification.heightAnchor.constraint(equalToConstant: 25),
            
            sunImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            sunImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
            sunImage.widthAnchor.constraint(equalToConstant: 300),
            sunImage.heightAnchor.constraint(equalToConstant: 300),
            
            backgroundView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backgroundView.topAnchor.constraint(equalTo: sunImage.bottomAnchor, constant: 10),
            backgroundView.widthAnchor.constraint(equalToConstant: 350),
            backgroundView.heightAnchor.constraint(equalToConstant: 350),
            
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
            nextWeekButton.widthAnchor.constraint(equalToConstant: 250),
            nextWeekButton.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    @objc func didTapNextWeek(){
        self.navigationController?.pushViewController(WeatherVC2(), animated: true)
    }
}

