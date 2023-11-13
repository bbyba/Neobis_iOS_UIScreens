//
//  PhoneCell.swift
//  Neobis_iOS_UIScreens
//

import UIKit

class PhoneCell: UITableViewCell {
    
    var phoneImageView = UIImageView()
    var phoneTitle = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(phoneImageView)
        addSubview(phoneTitle)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureImageView(){
        
    }
    
    
    func configureTitle(){
        
    }
}
