//
//  Things.swift
//  Anabada Board
//
//  Created by 임동현 on 2024/05/18.
//

import UIKit
//MARK: - 데이터 형태 정의
struct Things: Equatable {
    var thingsImage: [UIImage]
    var thingsName: String?
    var address: String?
    var price: Int?
    var userName: String?
    var comment: String?
    var favorite: Bool?
    
    //정수를 가격 형태의 문자열로 변환하는 함수
    static func transInt(num: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.locale = Locale(identifier: "ko_KR")
        if let formattedNumber = numberFormatter.string(from: NSNumber(value: num)) {
                return "\(formattedNumber)원"
        } else {
                return "\(num)원"
        }
    }
    
    //정수를 일반 문자열로 변환하는 함수
    static func transIntToString(num: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.locale = Locale(identifier: "ko_KR")
        if let formattedNumber = numberFormatter.string(from: NSNumber(value: num)) {
                return "\(formattedNumber)"
        } else {
                return "\(num)" 
        }
    }
}
