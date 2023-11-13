//
//  CryptoVC.swift
//  Neobis_iOS_UIScreens
//

import UIKit

class CryptoVC: UIViewController {
    
    let coins = [
        Coin(name: "Bitcoin", amountInDollar: "$29,850.15", change: "+1,6%", amountInCoins: "2.73 BTC", image: "bitcoin"),
        Coin(name: "Ethereum", amountInDollar: "$10,561.24", change: "-0,82%", amountInCoins: "47.61 ETH", image: "ethereum"),
        Coin(name: "Litecoin", amountInDollar: "$3,676.76", change: "-2,10%", amountInCoins: "39,27 LTC", image: "litecoin"),
        Coin(name: "Ripple", amountInDollar: "$5,241.62", change: "+0,27%", amountInCoins: "16447,65 XRP", image: "ripple"),
        Coin(name: "Ripple", amountInDollar: "$5,241.62", change: "+0,27%", amountInCoins: "16447,65 XRP", image: "ripple"),
        Coin(name: "Ripple", amountInDollar: "$5,241.62", change: "+0,27%", amountInCoins: "16447,65 XRP", image: "ripple"),
    ]
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Portfolio"
        label.font = .systemFont(ofSize: 30)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let settings: UIImageView = {
        let image = UIImageView(image: UIImage(named: "settings"))
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    let heading: UILabel = {
        let label = UILabel()
        label.text = "Посмотреть все"
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
        configureTableView()
        addSubviews()
        setupTableView()
    }

    
    func addSubviews(){
        view.addSubview(titleLabel)
        view.addSubview(settings)
        view.addSubview(heading)
        view.addSubview(tableView)
    }
    
    func configureTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 90
        //register cells
        tableView.register(CryptoCell.self, forCellReuseIdentifier: "cryptoCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupTableView(){
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            
            settings.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            settings.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            
            heading.topAnchor.constraint(equalTo: settings.bottomAnchor, constant: 20),
            heading.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            
            tableView.topAnchor.constraint(equalTo: heading.bottomAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
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

