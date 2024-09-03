//
//  ItemModel.swift
//  AutoStyler
//
//  Created by 신정욱 on 9/2/24.
//

import UIKit

enum ItemPart: Int, CaseIterable {
    case top
    case bottom
    case shoes
    
    var items: [Item] {
        switch self {
        case .top:
            Item.top
        case .bottom:
            Item.bottom
        case .shoes:
            Item.shoes
        }
    }
}

struct Item {
    let name: String
    let requestName: String
    let image: UIImage?
    
    static let top: [Item] = [
        .init(name: "아네모스 멜빵셔츠", requestName: "AnemosSuspenders", image: UIImage(named: "t1")),
        .init(name: "캐주얼 재킷", requestName: "CasualJacket", image: UIImage(named: "t2")),
        .init(name: "비옷", requestName: "Raincoat", image: UIImage(named: "t3"))]
    
    static let bottom: [Item] = [
        .init(name: "남해의 치마", requestName: "SouthernSeasSkirt", image: UIImage(named: "b1")),
        .init(name: "송아지 가죽 라이더 하의", requestName: "CalfskinRiderBottoms", image: UIImage(named: "b2")),
        .init(name: "캐주얼 반바지", requestName: "CasualHalfslops", image: UIImage(named: "b3"))]
    
    static let shoes: [Item] = [
        .init(name: "에오르제아 교복 로퍼: 장목양말", requestName: "CollegiateShoes", image: UIImage(named: "s1")),
        .init(name: "송아지 가죽 라이더 신발", requestName: "CalfskinRiderShoes", image: UIImage(named: "s2")),
        .init(name: "초승달 실내화", requestName: "CrescentMoonSlippers", image: UIImage(named: "s3"))]
}
