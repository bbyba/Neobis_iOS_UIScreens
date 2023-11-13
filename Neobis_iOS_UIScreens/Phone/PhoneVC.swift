//
//  PhoneVC.swift
//  Neobis_iOS_UIScreens
//

import UIKit

class PhoneVC: UIViewController {
    
    let categories: [PhoneModel] = [
        PhoneModel(title: "SOS", description: "Mini meltdown? Get some Headspace in a hurry", image: "book", isRight: true),
        PhoneModel(title: "On-the-Go", description: "Mindful living? Get your Headspace to go", image: "books", isRight: false),
        PhoneModel(title: "Classic", description: "Like it simple? Get some extra Headspace", image: "certificate", isRight: true),
        PhoneModel(title: "SOS", description: "Mini meltdown? Get some Headspace in a hurry", image: "globe", isRight: false)
    ]
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Series"
        label.font = .boldSystemFont(ofSize: 22)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let options: UIImageView = {
        let image = UIImageView(image: UIImage(named: "option"))
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    let search: UIImageView = {
        let image = UIImageView(image: UIImage(named: "magnifier"))
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        configureNavBar()
        configureTableView()
        addSubviews()
        setupConstraints()
    }
    
    func addSubviews(){
        view.addSubview(titleLabel)
        view.addSubview(options)
        view.addSubview(search)
        view.addSubview(tableView)
    }
    
    func configureNavBar() {
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.titleView = titleLabel
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: options)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: search)
    }
    
    func configureTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 160
        //register cells
        tableView.register(PhoneCell.self, forCellReuseIdentifier: "phoneCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupConstraints(){
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}



extension PhoneVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "phoneCell", for: indexPath) as? PhoneCell else {fatalError("Unable to dequeue PhoneCell")}
        let data = categories[indexPath.row]
        cell.configure(with: data)

        return cell
    }
}


