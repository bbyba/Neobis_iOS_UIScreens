//
//  CryptoVC.swift
//  Neobis_iOS_UIScreens
//

import UIKit

class CryptoVC: UIViewController {
    
    let coins = [
        Coin(name: "Bitcoin", amountInDollar: "$29,850.15", change: "+1,6%", amountInCoins: "2.73 BTC", image: "bitcoin", color: .systemRed),
        Coin(name: "Ethereum", amountInDollar: "$10,561.24", change: "-0,82%", amountInCoins: "47.61 ETH", image: "ethereum", color: .systemBlue),
        Coin(name: "Litecoin", amountInDollar: "$3,676.76", change: "-2,10%", amountInCoins: "39,27 LTC", image: "litecoin", color: .systemGreen),
        Coin(name: "Ripple", amountInDollar: "$5,241.62", change: "+0,27%", amountInCoins: "16447,65 XRP", image: "ripple", color: .systemPurple),
        Coin(name: "Ripple", amountInDollar: "$5,241.62", change: "+0,27%", amountInCoins: "16447,65 XRP", image: "ripple", color: .systemPurple),
        Coin(name: "Ripple", amountInDollar: "$5,241.62", change: "+0,27%", amountInCoins: "16447,65 XRP", image: "ripple", color: .systemPurple)
    ]
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Portfolio"
        label.font = .boldSystemFont(ofSize: 38)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    
    //MARK: Settings Button
    let settingsImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "settings"))
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    lazy var settingsButton: UIButton = {
        let button = UIButton()
        button.setImage(settingsImage.image, for: .normal)
        button.addTarget(self, action: #selector(didTapSettings), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    //MARK: "Show all" Button
    lazy var showAllButton: UIButton = {
        let button = UIButton()
        button.setTitle("Show all", for: .normal)
        button.setTitleColor(.systemRed, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16)
        button.titleLabel?.textAlignment = .right
        button.addTarget(self, action: #selector(didTapShowAllButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        addSubviews()
        configureTableView()
        setup()
    }

    
    func addSubviews(){
        view.addSubview(titleLabel)
        view.addSubview(settingsButton)
        view.addSubview(showAllButton)
        view.addSubview(tableView)
    }
    
    func configureTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 88
        //register cells
        tableView.register(CryptoCell.self, forCellReuseIdentifier: "cryptoCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setup(){
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 79),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
            
            settingsButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 84),
            settingsButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -28),
            settingsButton.widthAnchor.constraint(equalToConstant: 24),
            settingsButton.heightAnchor.constraint(equalToConstant: 24),
            
            showAllButton.topAnchor.constraint(equalTo: settingsButton.bottomAnchor, constant: 44),
            showAllButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -28),
            showAllButton.widthAnchor.constraint(equalToConstant: 94),
            showAllButton.heightAnchor.constraint(equalToConstant: 16),
            
            tableView.topAnchor.constraint(equalTo: showAllButton.bottomAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -28),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 100)
        ])
    }
    
    @objc func didTapSettings(){
        print("Crypto: Settings button tapped.")
    }
    
    @objc func didTapShowAllButton(){
        print("Crypto: Show all button tapped.")
    }
}



extension CryptoVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coins.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cryptoCell", for: indexPath) as? CryptoCell else {
            fatalError("Unable to dequeue CryptoCell")
        }
        let coin = coins[indexPath.row]
        cell.configure(with: coin)
        
        return cell
    }
}

