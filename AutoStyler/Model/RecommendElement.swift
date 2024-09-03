//
//  File.swift
//  AutoStyler
//
//  Created by 신정욱 on 9/3/24.
//

import Foundation

struct RecommendElement: Codable {
    let top: Top
    let bottom: Bottom
    let shoes: Shoes
    let rating: Double
}

enum Top: String, Codable {
    case anemosSuspenders = "AnemosSuspenders"
    case casualJacket = "CasualJacket"
    case raincoat = "Raincoat"
}

enum Bottom: String, Codable {
    case calfskinRiderBottoms = "CalfskinRiderBottoms"
    case casualHalfslops = "CasualHalfslops"
    case southernSeasSkirt = "SouthernSeasSkirt"
}

enum Shoes: String, Codable {
    case calfskinRiderShoes = "CalfskinRiderShoes"
    case collegiateShoes = "CollegiateShoes"
    case crescentMoonSlippers = "CrescentMoonSlippers"
}


