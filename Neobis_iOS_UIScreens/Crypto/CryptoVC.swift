//
//  CryptoVC.swift
//  Neobis_iOS_UIScreens
//

import UIKit

class CryptoVC: UIViewController {
    
    let coins = [
        Coin(name: "Bitcoin", amountInDollar: "$29,850.15", change: "+1,6%", amountInCoins: "2.73 BTC", image: "bitcoin", color: "#F6543E"),
        Coin(name: "Ethereum", amountInDollar: "$10,561.24", change: "-0,82%", amountInCoins: "47.61 ETH", image: "ethereum", color: "#6374C3"),
        Coin(name: "Litecoin", amountInDollar: "$3,676.76", change: "-2,10%", amountInCoins: "39,27 LTC", image: "litecoin", color: "#30E0A1"),
        Coin(name: "Ripple", amountInDollar: "$5,241.62", change: "+0,27%", amountInCoins: "16447,65 XRP", image: "ripple", color: "#638FFE"),
        Coin(name: "Ripple", amountInDollar: "$5,241.62", change: "+0,27%", amountInCoins: "16447,65 XRP", image: "ripple", color: "#638FFE"),
        Coin(name: "Ripple", amountInDollar: "$5,241.62", change: "+0,27%", amountInCoins: "16447,65 XRP", image: "ripple", color: "#638FFE")
    ]
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Portfolio"
        label.font = .boldSystemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
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
    
    let heading: UILabel = {
        let label = UILabel()
        label.text = "Show all"
        label.font = .systemFont(ofSize: 16)
        label.textAlignment = .right
        label.textColor = .red
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        addSubviews()
        configureTableView()
        setupTableView()
    }

    
    func addSubviews(){
        view.addSubview(titleLabel)
        view.addSubview(settingsButton)
        view.addSubview(heading)
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
    
    func setupTableView(){
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 79),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
            
            settingsButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 84),
            settingsButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -28),
            settingsButton.heightAnchor.constraint(equalToConstant: 24),
            settingsButton.widthAnchor.constraint(equalToConstant: 24),
            
            heading.topAnchor.constraint(equalTo: settingsButton.bottomAnchor, constant: 44),
            heading.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -28),
            
            tableView.topAnchor.constraint(equalTo: heading.bottomAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -28),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 100)
        ])
    }
    
    @objc func didTapSettings(){
        print("Crypto: Settings button tapped.")
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

