//
//  DailyCollectionViewCell.swift
//  Neobis_iOS_UIScreens
//

import UIKit

class DailyCollectionViewCell: UICollectionViewCell {
    
    let temperature: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18)
        label.textColor = .white
        label.addShadowToText()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let image: UIImageView = {
        let image = UIImageView()
        image.tintColor = .white
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    let hour: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18)
        label.textColor = .white
        label.addShadowToText()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubviews()
        setupConstraints()
    }
    
    func configure(with data: DailyWeather){
        temperature.text = data.temperature
        image.image = UIImage(named: data.image)
        hour.text = data.hour
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews(){
        contentView.addSubview(temperature)
        contentView.addSubview(image)
        contentView.addSubview(hour)
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            temperature.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            temperature.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 13),
       
            image.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            image.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            image.widthAnchor.constraint(equalToConstant: 95),
            image.heightAnchor.constraint(equalToConstant: 95),
            
            hour.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            hour.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
        ])
    }
}
