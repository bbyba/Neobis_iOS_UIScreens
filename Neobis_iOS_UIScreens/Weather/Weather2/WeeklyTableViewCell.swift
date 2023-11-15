//
//  WeeklyTableViewCell.swift
//  Neobis_iOS_UIScreens
//

import UIKit

class WeeklyTableViewCell: UITableViewCell {
    
    let date: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    let temperature: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .clear
        addSubviews()
        setupConstraints()
    }
    
    func configure(with data: WeeklyWeather){
        date.text = data.date
        image.image = UIImage(named: data.image)
        temperature.text = data.temperature
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews(){
        contentView.addSubview(date)
        contentView.addSubview(image)
        contentView.addSubview(temperature)
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            date.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            date.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            
            image.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            image.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            image.widthAnchor.constraint(equalToConstant: 90),
            image.heightAnchor.constraint(equalToConstant: 90),
            
            temperature.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            temperature.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
        ])
    }
}
