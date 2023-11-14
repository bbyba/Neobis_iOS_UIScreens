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
            temperature.widthAnchor.constraint(equalToConstant: 42),
            temperature.heightAnchor.constraint(equalToConstant: 28),
            
            image.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            image.topAnchor.constraint(equalTo: temperature.topAnchor, constant: 23),
            image.widthAnchor.constraint(equalToConstant: 37),
            image.heightAnchor.constraint(equalToConstant: 30),
            
            hour.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            hour.topAnchor.constraint(equalTo: image.topAnchor, constant: 20),
            hour.widthAnchor.constraint(equalToConstant: 44),
            hour.heightAnchor.constraint(equalToConstant: 28),
        ])
    }
}
