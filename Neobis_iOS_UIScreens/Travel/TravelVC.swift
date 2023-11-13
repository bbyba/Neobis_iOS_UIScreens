//
//  TravelVC.swift
//  Neobis_iOS_UIScreens
//

import UIKit

class TravelVC: UIViewController {
    
    let cities = [
        City(name: "Abu Dhabi", image: "city1"),
        City(name: "San Antonio", image: "city2"),
        City(name: "Abu Dhabi", image: "city1")
    ]
    
    let titleLabel: UILabel = {
        let title = UILabel()
        title.text = "Путешествуйте \n Почувствуйте прилив энергии"
        title.font = .systemFont(ofSize: 24)
        title.numberOfLines = 0
        title.textAlignment = .center
        title.translatesAutoresizingMaskIntoConstraints = false
        
        return title
    }()

    let subtitleLabel: UILabel = {
        let subtitle = UILabel()
        subtitle.text = "Мы поможем вам исследовать, сравнить и \n забронировать впечатления - все в одном \n месте."
        subtitle.font = .systemFont(ofSize: 14)
        subtitle.numberOfLines = 0
        subtitle.textAlignment = .center
        subtitle.translatesAutoresizingMaskIntoConstraints = false
        
        return subtitle
    }()
    
    let searchBar : UISearchBar = {
        let bar = UISearchBar()
        bar.placeholder = "Куда хотите поехать?"
        bar.searchTextField.font = .systemFont(ofSize: 12)
        bar.searchBarStyle = .minimal
        bar.translatesAutoresizingMaskIntoConstraints = false
        
        return bar
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
        view.addSubview(subtitleLabel)
        view.addSubview(searchBar)
        view.addSubview(tableView)
    }
    
    func configureTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 250
        tableView.separatorStyle = .none
        //register cells
        tableView.register(TravelCell.self, forCellReuseIdentifier: "travelCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupTableView(){
    
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 58),

            subtitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 11),
            subtitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            subtitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

            searchBar.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            searchBar.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 20),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),

            tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 25),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}


extension TravelVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "travelCell", for: indexPath) as? TravelCell else {
            fatalError("Unable to dequeue TravelCell")
        }
        let city = cities[indexPath.row]
        cell.configure(with: city)
        
        return cell
    }
}

