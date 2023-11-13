//
//  PhoneVC.swift
//  Neobis_iOS_UIScreens
//

import UIKit

class PhoneVC: UIViewController {

    var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    func configureTableView(){
        view.addSubview(tableView)
        
        //set delegates
        setTableViewDelegates()
        
        //set row height
        tableView.rowHeight = 150
        
        //register cells
        
        //set constraints: pin to the edges
        tableView.pin(to: view)
    }
    
    func setTableViewDelegates(){
        tableView.delegate = self
        tableView.dataSource = self
    }
    

}



extension PhoneVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
