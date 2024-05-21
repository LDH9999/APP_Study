//
//  ThingsInfoView.swift
//  Anabada Board
//
//  Created by 임동현 on 2024/05/19.
//

import UIKit
import ImageSlideshow

class ThingsInfoView: UIView {
    
    //MARK: - 화면에 배치 할 요소들 선언
    var things: Things? {
        didSet {
            userNameLabel.text = things?.userName
            addressLabel.text = things?.address
            thingsNameLabel.text = things?.thingsName
            priceLabel.text = Things.transInt(num: things?.price ?? 0)
            commentLabel.text = things?.comment
            setImageSlide()
            setHeartImage()
        }
    }
    
    private var imageSlide = ImageSlideshow()
    
    let userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .clear
        imageView.clipsToBounds = true
        imageView.image = UIImage(systemName: "person.fill")
        imageView.tintColor = .systemGray5
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let userNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.text = "유저이름"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let addressLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.text = "주소"
        label.textColor = .systemGray2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var userInfoStackView: UIStackView = {
        let stview = UIStackView(arrangedSubviews: [userNameLabel, addressLabel])
        stview.axis = .vertical
        stview.distribution = .fill
        stview.alignment = .fill
        stview.translatesAutoresizingMaskIntoConstraints = false
        return stview
    }()
    
    let heartImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .clear
        imageView.clipsToBounds = true
        imageView.image = UIImage(systemName: "heart")
        imageView.tintColor = .darkGray
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var userTotalStackView: UIStackView = {
        let stview = UIStackView(arrangedSubviews: [userImageView, userInfoStackView, heartImageView])
        stview.axis = .horizontal
        stview.spacing = 10
        stview.distribution = .fill
        stview.alignment = .fill
        stview.translatesAutoresizingMaskIntoConstraints = false
        return stview
    }()
    
    lazy var lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray3
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let thingsNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.text = "상품 이름"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.text = "가격"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let commentLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "상품 설명"
        label.textColor = .white
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var thingsInfoStackView: UIStackView = {
        let stview = UIStackView(arrangedSubviews: [lineView, thingsNameLabel, priceLabel, commentLabel])
        stview.axis = .vertical
        stview.spacing = 10
        stview.distribution = .fill
        stview.alignment = .fill
        stview.translatesAutoresizingMaskIntoConstraints = false
        return stview
    }()
    
    //MARK: - 뷰에 요소들 올리기
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(red: 0.13, green: 0.14, blue: 0.18, alpha: 1.00)
        setImageSlide()
        setConstraints()
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //이미지 슬라이드에 이미지 배열 세팅
    func setImageSlide() {
        imageSlide.translatesAutoresizingMaskIntoConstraints = false
        var imageAry: [ImageSource] = []
        for i in 0..<(things?.thingsImage.count ?? 0) {
            let source = ImageSource(image: things?.thingsImage[i] ?? UIImage(imageLiteralResourceName: "image04-1.jpg"))
            imageAry.append(source)
        }
        imageSlide.setImageInputs(imageAry)
    }
    
    func setHeartImage() {
        guard let favorite = things?.favorite else { return }
        if favorite {
            heartImageView.image = UIImage(systemName: "heart.fill")
            heartImageView.tintColor = .orange
        } else {
            heartImageView.image = UIImage(systemName: "heart")
            heartImageView.tintColor = .darkGray
        }
    }
    
    //MARK: - 오토레이아웃 설정
    func setConstraints() {
        self.addSubview(imageSlide)
        self.addSubview(userTotalStackView)
        self.addSubview(thingsInfoStackView)
        
        NSLayoutConstraint.activate([
            imageSlide.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            imageSlide.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageSlide.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            imageSlide.heightAnchor.constraint(equalToConstant: 400)
        ])
        
        NSLayoutConstraint.activate([
            userTotalStackView.topAnchor.constraint(equalTo: imageSlide.bottomAnchor, constant: 10),
            userTotalStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            userTotalStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            userImageView.widthAnchor.constraint(equalToConstant: 40),
            userImageView.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            heartImageView.widthAnchor.constraint(equalToConstant: 40),
        ])
        
        NSLayoutConstraint.activate([
            thingsInfoStackView.topAnchor.constraint(equalTo: userTotalStackView.bottomAnchor, constant: 10),
            thingsInfoStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            thingsInfoStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            thingsInfoStackView.bottomAnchor.constraint(greaterThanOrEqualTo: self.bottomAnchor, constant: -200)
        ])
        
        NSLayoutConstraint.activate([
            lineView.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        NSLayoutConstraint.activate([
            thingsNameLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            priceLabel.heightAnchor.constraint(equalToConstant: 40)
        ])

    }
}
