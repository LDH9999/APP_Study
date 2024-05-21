//
//  ViewController.swift
//  StudyDiary
//
//  Created by 임동현 on 2024/05/02.
//

import UIKit

struct ProfileDataSet {
    let image: UIImage
    let nicName: String
    let name: String
    let age: String
    let comment: String
    let mbti: String
    let favorite: String
    let hobby: String
}

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView?
    private let addProVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AddProfileViewController") as! AddProfileViewController
    private let myProVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MyProfileViewController") as! MyProfileViewController
     
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        myProVC.viewDidLoad()
    }

    func configure() {
        tableView?.dataSource = self
        tableView?.delegate = self
        
        let rightButton = UIBarButtonItem(image: UIImage(systemName: "person.badge.plus"), style: .plain,  target: self, action: #selector(rightButtonTapped))
        let leftButton = UIBarButtonItem(image: UIImage(systemName: "person.crop.circle"), style: .plain,  target: self, action: #selector(leftButtonTapped))
        
        rightButton.tintColor = .black
        leftButton.tintColor = .black
        
        self.navigationItem.rightBarButtonItem = rightButton
        self.navigationItem.leftBarButtonItem = leftButton
    }
    
    @objc func rightButtonTapped() {
            addProVC.delegate = self
            self.navigationController?.pushViewController(addProVC, animated: true)
        }
    
    @objc func leftButtonTapped() {
            self.navigationController?.pushViewController(myProVC, animated: true)
            myProVC.defaultDataSetting()
        }
}

extension ProfileDataSet{
    static var sampleData: [ProfileDataSet] = [
        ProfileDataSet(image: UIImage(systemName: "person.badge.plus")!, nicName: "Taylor", name: "한수빈", age: "26", comment: "안녕하세요 스위프트하는 테일러입니다.", mbti: "ENTP", favorite: "멍때리기", hobby: "얼죽아"),
        ProfileDataSet(image: UIImage(systemName: "person.badge.plus")!, nicName: "Chris", name: "이혜인", age: "26", comment: "스위프트 열공중인 크리스입니다!", mbti: "ENTP", favorite: "맛집 탐방", hobby: "피아노"),
        ProfileDataSet(image: UIImage(systemName: "person.badge.plus")!, nicName: "Avery", name: "박윤선", age: "26", comment: "애플기기 좋아합니다.", mbti: "INFJ", favorite: "맛집 검색", hobby: "유튜브"),
        ProfileDataSet(image: UIImage(systemName: "person.badge.plus")!, nicName: "Diane", name: "박다현", age: "26", comment: "스위프트로 뭔가 만들어 내고 싶은 다이앤입니다 😊", mbti: "ISFP", favorite: "산", hobby: "수영"),
        ProfileDataSet(image: UIImage(systemName: "person.badge.plus")!, nicName: "Christy", name: "이한슬", age: "26", comment: "예비 개발자 Christy입니다!", mbti: "INFP", favorite: "디즈니", hobby: "유튜브 보기")
    ]
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return ProfileDataSet.sampleData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let profile = ProfileDataSet.sampleData[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "profileCell", for: indexPath) as! TableViewCell
        cell.profileImage.image = profile.image
        cell.profileName.text = profile.nicName
        cell.profileComment.text = profile.comment
        cell.selectionStyle = .none
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.navigationController?.pushViewController(self.myProVC, animated: true)
        myProVC.dataSetting(index: indexPath.row)
    }
}

extension ViewController: AddProVcProtocol {
    func reloadTableView() {
        tableView?.reloadData()
    }
}


