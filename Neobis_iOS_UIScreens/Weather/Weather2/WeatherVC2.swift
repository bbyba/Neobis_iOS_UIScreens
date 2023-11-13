//
//  WeatherVC2.swift
//  Neobis_iOS_UIScreens
//


import UIKit

class WeatherVC2: UIViewController {

    let settingsImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "weathersettings"))
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    let dayOfTheWeek: UILabel = {
        let label = UILabel()
        label.text = "Today"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 24)
        label.addShadowToText()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let todayDate: UILabel = {
        let label = UILabel()
        label.text = "Apr, 26"
        label.textColor = .white
        label.font = .systemFont(ofSize: 20)
        label.addShadowToText()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let weekLabel: UILabel = {
        let label = UILabel()
        label.text = "This week: "
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 24)
        label.addShadowToText()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let calendarImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "calendar"))
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    let footer: UILabel = {
        let label = UILabel()
        label.text = "Accu Weather"
        label.textColor = .white
        label.font = .systemFont(ofSize: 20)
        label.addShadowToText()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemCyan
    }
    

}
