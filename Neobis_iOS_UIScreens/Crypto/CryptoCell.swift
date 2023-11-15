//
//  CryptoCell.swift
//  Neobis_iOS_UIScreens
//

import UIKit

class CryptoCell: UITableViewCell {

    let name: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let changePercentage: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let amountInDollars: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let amountInCoins: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    let logoBackground: UIView = {
        let view = UIView()
//        view.layer.opacity = 0.1
        view.alpha = 0.1
        view.layer.cornerRadius = 28
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    
        addSubviews()
        setupConstraints()
    }
    
    func configure(with data: Coin){
        name.text = data.name
        changePercentage.text = data.change
        amountInDollars.text = data.amountInDollar
        amountInCoins.text = data.amountInCoins
        image.image = UIImage(named: data.image)
        logoBackground.backgroundColor = data.color
//        circleView.backgroundColor = UIColor(named: data.color) //for hex
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews(){
        contentView.addSubview(logoBackground)
        contentView.addSubview(image)
        contentView.addSubview(name)
        contentView.addSubview(changePercentage)
        contentView.addSubview(amountInDollars)
        contentView.addSubview(amountInCoins)
    }

    func setupConstraints(){
        NSLayoutConstraint.activate([

            logoBackground.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            logoBackground.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            logoBackground.heightAnchor.constraint(equalToConstant: 56),
            logoBackground.widthAnchor.constraint(equalToConstant: 56),
            
            image.centerXAnchor.constraint(equalTo: logoBackground.centerXAnchor),
            image.centerYAnchor.constraint(equalTo: logoBackground.centerYAnchor),
            image.heightAnchor.constraint(equalToConstant: 22),
            image.widthAnchor.constraint(equalToConstant: 22),
            
            name.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            name.leadingAnchor.constraint(equalTo: logoBackground.trailingAnchor, constant: 12),
            
            changePercentage.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 3),
            changePercentage.leadingAnchor.constraint(equalTo: logoBackground.trailingAnchor, constant: 12),
            
            amountInDollars.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 22),
            amountInDollars.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            amountInCoins.topAnchor.constraint(equalTo: amountInDollars.bottomAnchor, constant: 3),
            amountInCoins.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
}
