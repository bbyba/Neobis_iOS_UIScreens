//
//  WeatherVC2.swift
//  Neobis_iOS_UIScreens
//


import UIKit

class WeatherVC2: UIViewController {
    let gradientLayer = CAGradientLayer()
    
    let dailyWeather = [
        DailyWeather(temperature: "29°C", image: "cloudsun", hour: "15:00"),
        DailyWeather(temperature: "26°C", image: "cloudsun", hour: "16:00"),
        DailyWeather(temperature: "24°C", image: "cloud", hour: "17:00"),
        DailyWeather(temperature: "23°C", image: "cloudmoon", hour: "18:00"),
        DailyWeather(temperature: "22°C", image: "cloudmoon", hour: "19:00"),
        DailyWeather(temperature: "21°C", image: "cloud2", hour: "20:00"),
    ]
    
    let weeklyWeather = [
        WeeklyWeather(date: "Apr, 27", image: "storm", temperature: "21°"),
        WeeklyWeather(date: "Apr, 28", image: "rain", temperature: "22°"),
        WeeklyWeather(date: "Apr, 29", image: "sunny", temperature: "34°"),
        WeeklyWeather(date: "Apr, 30", image: "cloud2", temperature: "27°"),
        WeeklyWeather(date: "May, 01", image: "cloudsun", temperature: "32°"),
        WeeklyWeather(date: "May, 02", image: "sunny", temperature: "29°C"),
    ]
    
    let settingsImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "weathersettings"))
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
    
    let dayOfTheWeek: UILabel = {
        let label = UILabel()
        label.text = "Today"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 24)
        label.addShadowToText()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let todayDate: UILabel = {
        let label = UILabel()
        label.text = "Apr, 26"
        label.textColor = .white
        label.font = .systemFont(ofSize: 20)
        label.addShadowToText()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let weeklyView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let weekLabel: UILabel = {
        let label = UILabel()
        label.text = "This week: "
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 24)
        label.addShadowToText()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let calendarImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "calendar"))
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    let footerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let footerSun: UIImageView = {
        let image = UIImageView(image: UIImage(named: "whitesun"))
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    let footerLabel: UILabel = {
        let label = UILabel()
        label.text = "AccuWeather"
        label.textColor = .white
        label.font = .systemFont(ofSize: 20)
        label.addShadowToText()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    var collectionView: UICollectionView!
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemCyan
        
        setupGradient()
        configureCollectionView()
        configureTableView()
        addSubviews()
        setupConstraints()
    }
    
    private func setupGradient(){
        gradientLayer.bounds = view.bounds
        gradientLayer.colors = [
            UIColor(red: 0 / 255, green: 190 / 255, blue: 229 / 255, alpha: 1).cgColor,
            UIColor(red: 23 / 255, green: 154 / 255, blue: 250 / 255, alpha: 1).cgColor
        ]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
        view.layer.addSublayer(gradientLayer)
    }
    
    func addSubviews(){
        view.addSubview(settingsButton)
        view.addSubview(dayOfTheWeek)
        view.addSubview(todayDate)
        view.addSubview(collectionView)
        
        view.addSubview(weeklyView)
        weeklyView.addSubview(weekLabel)
        weeklyView.addSubview(calendarImage)
        
        view.addSubview(tableView)

        view.addSubview(footerView)
        footerView.addSubview(footerSun)
        footerView.addSubview(footerLabel)
    }
    
    // MARK: CollectionView
    let flowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
        layout.itemSize = CGSize(width: (UIScreen.main.bounds.width * 70 / 414.0), height: 155)
//      layout.itemSize = CGSize(width: 70, height: 155)
        return layout
    }()
    
    func configureCollectionView(){
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(DailyCollectionViewCell.self, forCellWithReuseIdentifier: "dailyCollectionViewCell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    // MARK: TableView
    
    func configureTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 60
        tableView.showsHorizontalScrollIndicator = true
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.layer.backgroundColor = UIColor.clear.cgColor
        //register cells
        tableView.register(WeeklyTableViewCell.self, forCellReuseIdentifier: "weeklyTableViewCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
    }

    func setupConstraints(){
        NSLayoutConstraint.activate([
            settingsButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 59),
            settingsButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 360),
            settingsButton.widthAnchor.constraint(equalToConstant: 24),
            settingsButton.heightAnchor.constraint(equalToConstant: 24),
            
            dayOfTheWeek.topAnchor.constraint(equalTo: view.topAnchor, constant: 138),
            dayOfTheWeek.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            dayOfTheWeek.heightAnchor.constraint(equalToConstant: 37),
            
            todayDate.topAnchor.constraint(equalTo: view.topAnchor, constant: 138),
            todayDate.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            todayDate.heightAnchor.constraint(equalToConstant: 37),
            
            collectionView.topAnchor.constraint(equalTo: dayOfTheWeek.bottomAnchor, constant: 32),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            collectionView.heightAnchor.constraint(equalToConstant: 150),
            
            weeklyView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            weeklyView.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 50),
            weeklyView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            weeklyView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            weeklyView.heightAnchor.constraint(equalToConstant: 37),
            
            weekLabel.centerYAnchor.constraint(equalTo: weeklyView.centerYAnchor),
            weekLabel.leadingAnchor.constraint(equalTo: weeklyView.leadingAnchor),
            
            calendarImage.centerYAnchor.constraint(equalTo: weeklyView.centerYAnchor),
            calendarImage.trailingAnchor.constraint(equalTo: weeklyView.trailingAnchor),
            calendarImage.widthAnchor.constraint(equalToConstant: 24),
            calendarImage.heightAnchor.constraint(equalToConstant: 24),
            
            tableView.topAnchor.constraint(equalTo: weeklyView.bottomAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            tableView.heightAnchor.constraint(equalToConstant: 312),
            
            footerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            footerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -15),
            footerView.widthAnchor.constraint(equalToConstant: 148),
            footerView.heightAnchor.constraint(equalToConstant: 28),
            
            footerSun.centerYAnchor.constraint(equalTo: footerView.centerYAnchor),
            footerSun.leadingAnchor.constraint(equalTo: footerLabel.leadingAnchor),
            
            footerLabel.centerYAnchor.constraint(equalTo: footerView.centerYAnchor),
            footerLabel.trailingAnchor.constraint(equalTo: footerView.trailingAnchor),
//            footer.heightAnchor.constraint(equalToConstant: 38),
            
        ])
        
    }
    
    @objc func didTapSettings(){
        print("Weather: Settings button tapped.")
    }
}




//MARK: delegate and datasource extensions
extension WeatherVC2: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dailyWeather.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "dailyCollectionViewCell", for: indexPath) as! DailyCollectionViewCell
        let data = dailyWeather[indexPath.item]
        cell.configure(with: data)
        
        return cell
    }
}


extension WeatherVC2: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weeklyWeather.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "weeklyTableViewCell", for: indexPath) as? WeeklyTableViewCell else {
            fatalError("Unable to dequeue WeeklyTableViewCell")
        }
        let data = weeklyWeather[indexPath.row]
        cell.configure(with: data)
        
        return cell
    }
}
