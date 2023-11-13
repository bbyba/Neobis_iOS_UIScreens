//
//  TravelCell.swift
//  Neobis_iOS_UIScreens
//

import UIKit

class TravelCell: UITableViewCell {
    
    let cellName: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let cityImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    let fadingImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "fading"))
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    let lineImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "redLine"))
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
    
    func configure(with data: City) {
        cellName.text = data.name
        cityImage.image = UIImage(named: data.image)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews(){
        contentView.addSubview(cityImage)
        contentView.addSubview(fadingImage)
        contentView.addSubview(cellName)
        contentView.addSubview(lineImage)
    }

    func setupConstraints(){
        
        NSLayoutConstraint.activate([
            cityImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            cityImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cityImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            cityImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            fadingImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            fadingImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            fadingImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            fadingImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            cellName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            cellName.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            lineImage.topAnchor.constraint(equalTo: cellName.bottomAnchor, constant: 3),
            lineImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            lineImage.heightAnchor.constraint(equalToConstant: 3),
            lineImage.widthAnchor.constraint(equalToConstant: 500)
            ])
    }
}
