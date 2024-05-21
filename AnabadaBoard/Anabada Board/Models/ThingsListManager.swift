//
//  ThingsListManager.swift
//  Anabada Board
//
//  Created by 임동현 on 2024/05/18.
//

import UIKit

final class ThingsListManager {
    private var thingsList: [Things] = []
    private var copyThingsList: [Things] = []
    
    //MARK: - 기본 데이터들을 세팅하는 함수
    func makeThingsListDatas() {
        thingsList = [
            Things(thingsImage: [UIImage(imageLiteralResourceName: "image01-1.jpg"), UIImage(imageLiteralResourceName: "image01-2.jpg")], thingsName: "카메라", address: "용산구", price: 300000, userName: "콩쥐", comment: "거의 사용하지 않은 카메라 입니다.", favorite: false), Things(thingsImage: [UIImage(imageLiteralResourceName: "image02-1.jpg"), UIImage(imageLiteralResourceName: "image02-2.jpg"), UIImage(imageLiteralResourceName: "image02-3.jpg")], thingsName: "화장품", address: "강남구", price: 40000, userName: "팥쥐", comment: "색이 맘에 안들어서 팔아요", favorite: false), Things(thingsImage: [UIImage(imageLiteralResourceName: "image03-1.jpg"), UIImage(imageLiteralResourceName: "image03-2.jpg")], thingsName: "핸드크림", address: "홍대", price: 20000, userName: "물쥐", comment: "너무 많아서 팔아요", favorite: false), Things(thingsImage: [UIImage(imageLiteralResourceName: "image04-1.jpg"), UIImage(imageLiteralResourceName: "image04-2.jpg"), UIImage(imageLiteralResourceName: "image04-3.jpg")], thingsName: "립스틱", address: "여의도", price: 20000, userName: "쥐쥐", comment: "필요없어서 팔아요", favorite: false)
        ]
    }
    
    func getThingsList() -> [Things] {
        return thingsList
    }
    
    func copyThingList() {
        copyThingsList = thingsList
    }
    
    //MARK: - 리스트를 정렬하는 함수
    func newestList() {
        thingsList = copyThingsList
    }
    
    func highestList() {
        thingsList.sort { $0.price ?? 0 > $1.price ?? 0 }
    }
    
    func lowestList() {
        thingsList.sort { $0.price ?? 0 < $1.price ?? 0 }
    }
    
    func changeFavoriteList(index: Int, bool: Bool) {
            thingsList[index].favorite = bool
            copyThingsList[index].favorite = bool
    }
    
    func favoriteList() {
        thingsList = thingsList.filter { $0.favorite == true }
    }
    
    //MARK: - 리스트에 요소를 삭제하거나 추가하는 함수
    func deleteList(index: Int) {
        thingsList.remove(at: index)
        copyThingsList.remove(at: index)
    }
    
    func updateLisit(things: Things, index: Int) {
        thingsList[index] = things
        copyThingsList[index] = things
    }
    
    func addList(things: Things) {
        thingsList.append(things)
        copyThingsList.append(things)
    }
}
