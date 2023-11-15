//
//  FinanceVC.swift
//  Neobis_iOS_UIScreens
//

import UIKit

class FinanceVC: UIViewController {
    
    let expenses = [
        Expense(name: "Дом", amount: "$321", category: "Продукты", image: "house", color: .systemYellow),
        Expense(name: "Покупки", amount: "$574", category: "Одежда", image: "tag", color: .systemPurple),
        Expense(name: "Транспорт", amount: "$124", category: "Такси", image: "emoji", color: .systemGreen),
        Expense(name: "Здоровье",  amount: "$765", category: "Лечение", image: "heart", color: .systemPurple),
        Expense(name: "Фитнес", amount: "$324", category: "Тренировки", image: "cookie", color: .systemBlue),
        Expense(name: "Счета",  amount: "$726", category: "Комунальные", image: "envelope", color: .systemMint),
        Expense(name: "Ресторан", amount: "$325", category: "Ужин", image: "heart", color: .systemPurple),
    ]
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Balance"
        label.font = .systemFont(ofSize: 16)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()

    
    let totalAmount: UILabel = {
        let label = UILabel()
        label.text = "$1200.89"
        label.font = .boldSystemFont(ofSize: 36)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    
    //MARK: Month and Year picker
    
    let dateView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let monthYear: UILabel = {
        let label = UILabel()
        label.text = "April 2020"
        label.font = .systemFont(ofSize: 18)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let leftArrowImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "leftArrow"))
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    lazy var leftArrowButton: UIButton = {
        let button = UIButton()
        button.setImage(leftArrowImage.image, for: .normal)
        button.addTarget(self, action: #selector(didTapLefttArrow), for: .touchUpInside)

        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    let rightArrowImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "rightArrow"))
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    lazy var rightArrowButton: UIButton = {
        let button = UIButton()
        button.setImage(rightArrowImage.image, for: .normal)
        button.addTarget(self, action: #selector(didTapRightArrow), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    let footer: UILabel = {
        let label = UILabel()
        label.text = "View more"
        label.font = .systemFont(ofSize: 16)
        label.textAlignment = .center
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
        view.addSubview(totalAmount)
        
        view.addSubview(dateView)
        dateView.addSubview(leftArrowButton)
        dateView.addSubview(monthYear)
        dateView.addSubview(rightArrowButton)
        
        view.addSubview(tableView)
        view.addSubview(footer)
    }
    
    func configureTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 75
        tableView.sectionFooterHeight = 10.0
        //register cells
        tableView.register(FinanceCell.self, forCellReuseIdentifier: "financeCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
    }
    

    func setupTableView(){
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            
            totalAmount.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            totalAmount.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            
            dateView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            dateView.topAnchor.constraint(equalTo: totalAmount.topAnchor, constant: 50),
            dateView.widthAnchor.constraint(equalToConstant: 310),
            dateView.heightAnchor.constraint(equalToConstant: 50),
            
            leftArrowButton.centerYAnchor.constraint(equalTo: dateView.centerYAnchor),
            leftArrowButton.leadingAnchor.constraint(equalTo: dateView.leadingAnchor),
            leftArrowButton.widthAnchor.constraint(equalToConstant: 30),
            leftArrowButton.heightAnchor.constraint(equalToConstant: 30),
            
            monthYear.centerXAnchor.constraint(equalTo: dateView.centerXAnchor),
            monthYear.centerYAnchor.constraint(equalTo: dateView.centerYAnchor),
//            month.topAnchor.constraint(equalTo: totalAmount.bottomAnchor, constant: 25),
            
            rightArrowButton.centerYAnchor.constraint(equalTo: dateView.centerYAnchor),
            rightArrowButton.trailingAnchor.constraint(equalTo: dateView.trailingAnchor),
            rightArrowButton.widthAnchor.constraint(equalToConstant: 30),
            rightArrowButton.heightAnchor.constraint(equalToConstant: 30),
            
            tableView.topAnchor.constraint(equalTo: monthYear.bottomAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.heightAnchor.constraint(equalToConstant: CGFloat(tableView.rowHeight * CGFloat(expenses.count))),
//            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            
            footer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            footer.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 20)
        ])
    }
    
    @objc func didTapRightArrow(){
        print("Finance: Right arrow tapped")
    }
    
    @objc func didTapLefttArrow(){
        print("Finance: Left arrow tapped")
    }


}




extension FinanceVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expenses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "financeCell", for: indexPath) as? FinanceCell else {
            fatalError("Unable to dequeue FinanceCell")
        }
        let expense = expenses[indexPath.row]
        cell.configure(with: expense)
        
        return cell
    }

}
