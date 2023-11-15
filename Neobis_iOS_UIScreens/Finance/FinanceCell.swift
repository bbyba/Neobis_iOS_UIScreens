//
//  FinanceCell.swift
//  Neobis_iOS_UIScreens
//


import UIKit

class FinanceCell: UITableViewCell {

    let name: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let amount: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let category: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
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
        view.layer.cornerRadius = 15
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubviews()
        setupConstraints()
    }
    
    func configure(with data: Expense){
        name.text = data.name
        amount.text = data.amount
        category.text = data.category
        image.image = UIImage(named: data.image)
        logoBackground.backgroundColor = data.color
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews(){
        contentView.addSubview(logoBackground)
        contentView.addSubview(image)
        contentView.addSubview(name)
        contentView.addSubview(amount)
        contentView.addSubview(category)
    }
    
    func setupConstraints(){
        
        NSLayoutConstraint.activate([
            logoBackground.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            logoBackground.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            logoBackground.heightAnchor.constraint(equalToConstant: 30),
            logoBackground.widthAnchor.constraint(equalToConstant: 30),
            
            image.centerXAnchor.constraint(equalTo: logoBackground.centerXAnchor),
            image.centerYAnchor.constraint(equalTo: logoBackground.centerYAnchor),
            image.heightAnchor.constraint(equalToConstant: 15),
            image.widthAnchor.constraint(equalToConstant: 15),
            
            name.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            name.leadingAnchor.constraint(equalTo: logoBackground.trailingAnchor, constant: 15),
            
            amount.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            amount.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            category.topAnchor.constraint(equalTo: amount.bottomAnchor, constant: 3),
            category.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            
        ])
    }
}
