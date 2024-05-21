//
//  TingsInfoViewController.swift
//  Anabada Board
//
//  Created by 임동현 on 2024/05/19.
//

import UIKit

//MARK: - Delegate 패턴을 위한 프로토콜 정의
protocol ThingsVCProtocol: AnyObject {
    func changeFavorite(index: Int, bool: Bool)
    func deleteList(index: Int)
    func updateList(things: Things, index: Int)
}

class TingsInfoViewController: UIViewController {
    //MARK: - 필요한 요소들 선언
    private let thingsInfoView = ThingsInfoView()
    var things: Things?
    var screenIndex: Int?
    private var heartImageTapCount = 0
    weak var delegate: ThingsVCProtocol?
    
    lazy var editButton: UIBarButtonItem = {
        let button = UIBarButtonItem(image: UIImage(systemName: "pencil"), style: .plain, target: self, action: #selector(editButtonTapped))
        return button
    }()
    
    //MARK: - 뷰 교체
    override func loadView() {
        view = thingsInfoView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        setupNaviBar()
        setupTapGestures()
    }
    
    //MARK: - Navigation Bar 설정
    private func setupNaviBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .clear
        navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil) // title 부분 수정
        backBarButtonItem.tintColor = .white
        self.navigationItem.backBarButtonItem = backBarButtonItem
        
        self.navigationItem.rightBarButtonItem = self.editButton
    }
    
    //MARK: - 화면에 데이터 뿌리기
    private func setupData() {
        thingsInfoView.things = things
    }
    
    //MARK: - 이미지 클릭시 이벤트 설정
    func setupTapGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(touchUpImageView))
        thingsInfoView.heartImageView.addGestureRecognizer(tapGesture)
        thingsInfoView.heartImageView.isUserInteractionEnabled = true
    }
    
    @objc func touchUpImageView() {
        if heartImageTapCount == 0 {
            changeHeartImage(imageName: "heart.fill", color: .orange, bool: true, count: 1)
        } else {
            changeHeartImage(imageName: "heart", color: .darkGray, bool: false, count: -1)
        }
    }
    
    func changeHeartImage(imageName: String, color: UIColor, bool: Bool, count: Int) {
        thingsInfoView.heartImageView.image = UIImage(systemName: imageName)
        thingsInfoView.heartImageView.tintColor = color
        
        guard let index = screenIndex else { return }
        delegate?.changeFavorite(index: index, bool: bool)
        heartImageTapCount += count
    }
    
    //MARK: - Edit Button 세팅
    @objc func editButtonTapped() {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let option1 = UIAlertAction(title: "삭제하기", style: .default) { _ in
            guard let index = self.screenIndex else { return }
            self.delegate?.deleteList(index: index)
            self.navigationController?.popViewController(animated: true)
        }
        alertController.addAction(option1)
                
        let option2 = UIAlertAction(title: "수정하기", style: .default) { _ in
            let editVC = EditViewController()
            editVC.editDelegate = self
            editVC.things = self.things
            
            self.navigationController?.pushViewController(editVC, animated: true)
        }
        alertController.addAction(option2)
        
        present(alertController, animated: true, completion: nil)
    }

}

//MARK: - 프로토콜 요구사항 정의
extension TingsInfoViewController: EditViewProtocol {
    func compareThings(things: Things) -> Bool {
        if self.things == things {
            return true
        } else {
            return false
        }
    }
    
    func updateData(things: Things) {
        delegate?.updateList(things: things, index: screenIndex!)
        self.things = things
        setupData()
    }
}
