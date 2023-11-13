//
//  FinanceVC.swift
//  Neobis_iOS_UIScreens
//

import UIKit

class FinanceVC: UIViewController {
    
    let expenses = [
        Expense(name: "Дом", amount: "$321", category: "Продукты", image: "home"),
        Expense(name: "Покупки", amount: "$574", category: "Одежда", image: "tag"),
        Expense(name: "Транспорт", amount: "$124", category: "Такси", image: "smile"),
        Expense(name: "Здоровье",  amount: "$765", category: "Лечение", image: "heart"),
        Expense(name: "Фитнес", amount: "$324", category: "Тренировки", image: "cookie"),
        Expense(name: "Счета",  amount: "$726", category: "Комунальные", image: "mail"),
        Expense(name: "Ресторан", amount: "$325", category: "Ужин", image: "heart"),
    ]
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Баланс"
        label.font = .systemFont(ofSize: 18)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()

    
    let totalAmount: UILabel = {
        let label = UILabel()
        label.text = "$1200.89"
        label.font = .systemFont(ofSize: 28)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let month: UILabel = {
        let label = UILabel()
        label.text = "Апрель 2020"
        label.font = .systemFont(ofSize: 20)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let footer: UILabel = {
        let label = UILabel()
        label.text = "См. ещё"
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
        view.addSubview(month)
        view.addSubview(tableView)
        view.addSubview(footer)
    }
    
    func configureTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 65
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
            
            month.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            month.topAnchor.constraint(equalTo: totalAmount.bottomAnchor, constant: 25),
            
            tableView.topAnchor.constraint(equalTo: month.bottomAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.heightAnchor.constraint(equalToConstant: CGFloat(65 * expenses.count)),
//            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            
            footer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            footer.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 20)
        ])
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

