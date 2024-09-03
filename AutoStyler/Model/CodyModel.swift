//
//  CodyModel.swift
//  AutoStyler
//
//  Created by 신정욱 on 9/3/24.
//

import UIKit

struct Cody {
    let top: Item
    let bottom: Item
    let shoes: Item
    var rate: Double = 0
}

extension Cody {
    init?(element: RecommendElement) {
        guard let top = Item.top.filter({ $0.requestName == element.top.rawValue }).first,
              let bottom = Item.bottom.filter({ $0.requestName == element.bottom.rawValue }).first,
              let shoes = Item.shoes.filter({ $0.requestName == element.shoes.rawValue }).first
        else { return nil }
        
        self.top = top
        self.bottom = bottom
        self.shoes = shoes
        self.rate = element.rating
    }
}
