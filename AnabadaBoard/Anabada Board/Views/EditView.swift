//
//  EditView.swift
//  Anabada Board
//
//  Created by 임동현 on 2024/05/20.
//

import UIKit

class EditView: UIView {
    
    //MARK: - 화면에 배치 할 요소들 선언
    var things: Things? {
        didSet {
            thingsImageView.image = things?.thingsImage[0]
            thingsTitleTextField.text = things?.thingsName
            addressTextField.text = things?.address
            priceTextField.text = Things.transIntToString(num: things?.price ?? 0)
            commentTextField.text = things?.comment
        }
    }
    
    let thingsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .clear
        imageView.clipsToBounds = true
        imageView.image = UIImage(systemName: "person.fill")
        imageView.tintColor = .systemGray5
        imageView.layer.cornerRadius = 5
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let thingsTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.text = "제목"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let thingsTitleTextField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.attributedPlaceholder = NSAttributedString(string: "제목", attributes: [NSAttributedString.Key.foregroundColor : UIColor.darkGray])
        tf.textColor = .white
        tf.backgroundColor = .clear
        tf.layer.borderWidth = 1
        tf.layer.borderColor = UIColor.darkGray.cgColor
        tf.layer.cornerRadius = 5
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.spellCheckingType = .no
        tf.clearsOnBeginEditing = false
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let addressLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.text = "거래 희망 장소"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let addressTextField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.attributedPlaceholder = NSAttributedString(string: "거래 희망 장소를 입력해 주세요.", attributes: [NSAttributedString.Key.foregroundColor : UIColor.darkGray])
        tf.textColor = .white
        tf.backgroundColor = .clear
        tf.layer.borderWidth = 1
        tf.layer.borderColor = UIColor.darkGray.cgColor
        tf.layer.cornerRadius = 5
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.spellCheckingType = .no
        tf.clearsOnBeginEditing = false
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.text = "가격"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let priceTextField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.attributedPlaceholder = NSAttributedString(string: "가격을 입력해주세요.", attributes: [NSAttributedString.Key.foregroundColor : UIColor.darkGray])
        tf.textColor = .white
        tf.backgroundColor = .clear
        tf.layer.borderWidth = 1
        tf.layer.borderColor = UIColor.darkGray.cgColor
        tf.layer.cornerRadius = 5
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.spellCheckingType = .no
        tf.clearsOnBeginEditing = false
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let commentLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.text = "자세한 설명"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let commentTextField: UITextField = {
        let tf = UITextField()
        tf.attributedPlaceholder = NSAttributedString(string: "올릴 게시글 내용을 작성해 주세요.", attributes: [NSAttributedString.Key.foregroundColor : UIColor.darkGray])
        tf.textColor = .white
        tf.backgroundColor = .clear
        tf.layer.borderWidth = 1
        tf.layer.borderColor = UIColor.darkGray.cgColor
        tf.layer.cornerRadius = 5
        tf.borderStyle = .roundedRect
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.spellCheckingType = .no
        tf.clearsOnBeginEditing = false
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let errorLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .red
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let editButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .orange
        button.setTitle("작성 완료", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var thingsInfoStackView: UIStackView = {
        let stview = UIStackView(arrangedSubviews: [thingsTitleLabel, thingsTitleTextField, addressLabel, addressTextField, priceLabel, priceTextField, commentLabel, commentTextField, errorLabel, editButton])
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
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - 오토레이아웃 설정
    func setConstraints() {
        self.addSubview(thingsImageView)
        self.addSubview(thingsInfoStackView)
        
        NSLayoutConstraint.activate([
            thingsImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            thingsImageView.heightAnchor.constraint(equalToConstant: 150),
            thingsImageView.widthAnchor.constraint(equalToConstant: 150),
            thingsImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            thingsInfoStackView.topAnchor.constraint(equalTo: thingsImageView.bottomAnchor, constant: 10),
            thingsInfoStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            thingsInfoStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            thingsInfoStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -50)
        ])
        
        NSLayoutConstraint.activate([
            thingsTitleLabel.heightAnchor.constraint(equalToConstant: 25),
            addressLabel.heightAnchor.constraint(equalToConstant: 25),
            priceLabel.heightAnchor.constraint(equalToConstant: 25),
            commentLabel.heightAnchor.constraint(equalToConstant: 25),
            errorLabel.heightAnchor.constraint(equalToConstant: 25)
        ])
        
        NSLayoutConstraint.activate([
            thingsTitleTextField.heightAnchor.constraint(equalToConstant: 30),
            addressTextField.heightAnchor.constraint(equalToConstant: 30),
            priceTextField.heightAnchor.constraint(equalToConstant: 30),
            editButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
}

