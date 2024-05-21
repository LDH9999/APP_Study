//
//  MyTableViewCell.swift
//  Anabada Board
//
//  Created by 임동현 on 2024/05/18.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    
    //MARK: - 화면에 배치 할 요소들 선언
    let thingsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let thingsNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let addressLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textColor = .systemGray2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.distribution  = .fillEqually
        sv.alignment = .fill
        sv.spacing = 5
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    //MARK: - 뷰에 요소들 올리기
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .clear
        
        setupScreenView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.thingsImageView.clipsToBounds = true
        self.thingsImageView.layer.cornerRadius = 5
    }
    
    func setupScreenView() {
        self.contentView.addSubview(thingsImageView)
        self.contentView.addSubview(stackView)
        
        stackView.addArrangedSubview(thingsNameLabel)
        stackView.addArrangedSubview(addressLabel)
        stackView.addArrangedSubview(priceLabel)
    }
    
    //MARK: - 오토레이아웃 설정
    func setConstraints() {
        NSLayoutConstraint.activate([
            thingsImageView.widthAnchor.constraint(equalToConstant: 100),
            thingsImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            thingsImageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10),
            thingsImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
            thingsImageView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: thingsImageView.trailingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: self.thingsImageView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.thingsImageView.bottomAnchor)
        ])
        
    }
    
    
}
