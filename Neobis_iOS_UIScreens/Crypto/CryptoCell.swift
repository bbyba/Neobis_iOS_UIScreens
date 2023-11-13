//
//  CryptoCell.swift
//  Neobis_iOS_UIScreens
//

import UIKit

class CryptoCell: UITableViewCell {

    let name: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let changePercentage: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let amountInDollars: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let amountInCoins: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        
        return label
    }()
    
    let image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    let circleView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 16
        
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSuviews()
        setupConstraints()
    }
    
    func configure(with data: Coin){
        name.text = data.name
        changePercentage.text = data.change
        amountInDollars.text = data.amountInDollar
        amountInCoins.text = data.amountInCoins
        image.image = UIImage(named: data.image)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSuviews(){
//        contentView.addSubview(circleView)
        contentView.addSubview(image)
        contentView.addSubview(name)
        contentView.addSubview(changePercentage)
        contentView.addSubview(amountInDollars)
        contentView.addSubview(amountInCoins)
    }

    func setupConstraints(){
        NSLayoutConstraint.activate([
//            circleView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
//            circleView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
//            circleView.heightAnchor.constraint(equalToConstant: 50),
//            circleView.widthAnchor.constraint(equalToConstant: 50),
            
//            image.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            image.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            image.heightAnchor.constraint(equalToConstant: 30),
            image.widthAnchor.constraint(equalToConstant: 30),
            
            name.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            name.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 20),
//            name.leadingAnchor.constraint(equalTo: circleView.leadingAnchor, constant: 20),
            
            changePercentage.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 7),
            changePercentage.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 20),
//            changePercentage.leadingAnchor.constraint(equalTo: circleView.leadingAnchor, constant: 15),
            
            amountInDollars.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            amountInDollars.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            amountInCoins.topAnchor.constraint(equalTo: amountInDollars.bottomAnchor, constant: 7),
            amountInCoins.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10)
        ])
    }
}
