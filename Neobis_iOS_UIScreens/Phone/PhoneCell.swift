//
//  PhoneCell.swift
//  Neobis_iOS_UIScreens
//

import UIKit

class PhoneCell: UITableViewCell {
    
    let cellTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let cellDescription: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let cellImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let cellArrow: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "arrow")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    
    //Initializer
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        setupConstraints()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //Configurations and setup
    func addSubviews(){
        contentView.addSubview(cellImageView)
        contentView.addSubview(cellTitle)
        contentView.addSubview(cellDescription)
        contentView.addSubview(cellArrow)
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            cellArrow.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            cellArrow.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25),
            cellArrow.widthAnchor.constraint(equalToConstant: 10),
            cellArrow.heightAnchor.constraint(equalToConstant: 20),
            
            cellImageView.widthAnchor.constraint(equalToConstant: 100),
            cellImageView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    func configure(with data: PhoneModel) {
        cellTitle.text = data.title
        cellDescription.text = data.description
        cellImageView.image = UIImage(named: data.image)
        
        if data.isRight{
            NSLayoutConstraint.activate([
                cellImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                cellImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -48),
                
                cellTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 25),
                cellTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
                
                cellDescription.topAnchor.constraint(equalTo: cellTitle.bottomAnchor, constant: 5),
                cellDescription.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
                cellDescription.widthAnchor.constraint(equalToConstant: 185),
                cellDescription.heightAnchor.constraint(equalToConstant: 42)
            ])
        } else {
            NSLayoutConstraint.activate([
                cellImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                cellImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
                
                cellTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 25),
                cellTitle.leadingAnchor.constraint(equalTo: cellImageView.leadingAnchor, constant: 150),
                
                cellDescription.topAnchor.constraint(equalTo: cellTitle.bottomAnchor, constant: 5),
                cellDescription.leadingAnchor.constraint(equalTo: cellImageView.leadingAnchor, constant: 150),
                cellDescription.widthAnchor.constraint(equalToConstant: 185),
                cellDescription.heightAnchor.constraint(equalToConstant: 42)
            ])
            
        }
    }
}
