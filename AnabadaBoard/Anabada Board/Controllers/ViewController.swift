//
//  ViewController.swift
//  Anabada Board
//
//  Created by 임동현 on 2024/05/18.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - 화면에 배치 할 요소들 선언
    private let tableView = UITableView()
    private var thingsManager = ThingsListManager()
    private var favoriteBtTapCount = 0
    
    let plusButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .orange
        button.setTitle("+ 글쓰기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 30
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var favoritesButton: UIBarButtonItem = {
        let button = UIBarButtonItem(image: UIImage(systemName: "heart.fill"), style: .plain, target: self, action: #selector(favoritesButtonTapped))
        return button
    }()
    
    lazy var sortButton: UIBarButtonItem = {
        let button = UIBarButtonItem(image: UIImage(systemName: "mount.fill"), style: .plain, target: self, action: #selector(sortButtonTapped))
        return button
    }()
    
    //MARK: - 화면 세팅
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNaviBar()
        setupTableView()
        setConstraints()
        setupDatas()
        setupTableViewConstraints()
        plusButtonSetting()
        view.backgroundColor = UIColor(red: 0.13, green: 0.14, blue: 0.18, alpha: 1.00)
    }
    
    //MARK: - 화면에 plus버튼 올리기
    func setConstraints() {
        view.addSubview(plusButton)
        
        NSLayoutConstraint.activate([
            plusButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -70),
            plusButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            plusButton.heightAnchor.constraint(equalToConstant: 60),
            plusButton.widthAnchor.constraint(equalToConstant: 110)
        ])
    }
    
    //MARK: - 네비게이션바 세팅
    func setupNaviBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .clear
        navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        backBarButtonItem.tintColor = .white
        self.navigationItem.backBarButtonItem = backBarButtonItem
        
        self.navigationItem.rightBarButtonItem = self.favoritesButton
        self.navigationItem.leftBarButtonItem = self.sortButton
    }
    
    //MARK: - plus 버튼 세팅
    func plusButtonSetting() {
        view.bringSubviewToFront(plusButton) //plus버튼을 화면의 제일 위로 올림
        plusButton.addTarget(self, action: #selector(plusButtonTapped), for: .touchUpInside)
    }
    
    @objc func plusButtonTapped() {
        let editVC = EditViewController()
        editVC.things = Things(thingsImage: [UIImage(imageLiteralResourceName: "image01-1.jpg")], thingsName: nil, address: nil, price: nil, userName: "Eren", comment: nil, favorite: false)
        editVC.addDelegate = self
        
        navigationController?.pushViewController(editVC, animated: true)
    }
    
    //MARK: - favorite 버튼 세팅
    @objc func favoritesButtonTapped() {
        if favoriteBtTapCount == 0 {
            thingsManager.favoriteList()
            favoriteBtChange(color: .orange, count: 1)
        } else {
            thingsManager.newestList()
            favoriteBtChange(color: .white, count: -1)
        }
    }
    
    func favoriteBtChange(color: UIColor, count: Int) {
        self.navigationItem.rightBarButtonItem?.tintColor = color
        tableView.reloadData()
        favoriteBtTapCount += count
    }
    
    //MARK: - sort 버튼 세팅
    @objc func sortButtonTapped() {
        let alertController = UIAlertController(title: nil, message: "정렬 방식을 선택해주세요.", preferredStyle: .actionSheet)
        
        let option1 = UIAlertAction(title: "최신 순", style: .default) { _ in
            self.thingsManager.newestList()
            self.tableView.reloadData()
        }
        alertController.addAction(option1)
                
        let option2 = UIAlertAction(title: "최고가 순", style: .default) { _ in
            self.thingsManager.highestList()
            self.tableView.reloadData()
        }
        alertController.addAction(option2)
                
        let option3 = UIAlertAction(title: "최저가 순", style: .default) { _ in
            self.thingsManager.lowestList()
            self.tableView.reloadData()
        }
        alertController.addAction(option3)
        
        present(alertController, animated: true, completion: nil)
    }
    
    //MARK: - tableView 세팅
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self

        tableView.rowHeight = 120
        tableView.backgroundColor = .clear
        tableView.separatorColor = .darkGray

        tableView.register(MyTableViewCell.self, forCellReuseIdentifier: "ThingsCell")
    }
    
    func setupTableViewConstraints() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
    }
    
    //MARK: - 기본 데이터 세팅
    func setupDatas() {
        thingsManager.makeThingsListDatas()
        thingsManager.copyThingList()
    }
    
}

//MARK: - tableView Cell 설정
extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return thingsManager.getThingsList().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ThingsCell", for: indexPath) as! MyTableViewCell
        let things = thingsManager.getThingsList()[indexPath.row]

        cell.thingsImageView.image = things.thingsImage[0]
        cell.addressLabel.text = things.address
        cell.thingsNameLabel.text = things.thingsName
        cell.priceLabel.text = Things.transInt(num: things.price ?? 0)
        cell.selectionStyle = .none
        
        return cell
    }
}

//MARK: - tableView Cell 클릭시 동작 설정
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let thingsInfoVC = TingsInfoViewController()
        thingsInfoVC.delegate = self
        
        thingsInfoVC.things = thingsManager.getThingsList()[indexPath.row]
        thingsInfoVC.screenIndex = indexPath.row

        navigationController?.pushViewController(thingsInfoVC, animated: true)
    }
}

//MARK: - Protocol 요구사항 정의
extension ViewController: ThingsVCProtocol {
    func changeFavorite(index: Int, bool: Bool) {
        thingsManager.changeFavoriteList(index: index, bool: bool)
    }
    
    func deleteList(index: Int) {
        thingsManager.deleteList(index: index)
        tableView.reloadData()
    }
    
    func updateList(things: Things, index: Int) {
        thingsManager.updateLisit(things: things, index: index)
        tableView.reloadData()
    }
}

extension ViewController: AddViewProtocol {
    func addList(things: Things) {
        thingsManager.addList(things: things)
        tableView.reloadData()
    }
}
