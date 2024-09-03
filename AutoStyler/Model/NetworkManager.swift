//
//  NetworkManager.swift
//  AutoStyler
//
//  Created by 신정욱 on 9/2/24.
//

import UIKit
import Alamofire
//import SwiftyJSON

final class NetworkManager {
    static let shared = NetworkManager()
    private init() {}

    func checkConnecting(completion: @escaping (Result<Data?, AFError>) -> Void) {
        let url = "https://flaskprc-ceegg.run.goorm.io/"
        
        AF.request(url)
            .validate(statusCode: 200..<300) // 200~300만 성공으로 처리
            .response { completion($0.result) }
    }
    
    func fetchRecommendData(cody: Cody, completion: @escaping (Result<[RecommendElement], AFError>) -> Void) {
        let url = "https://flaskprc-ceegg.run.goorm.io/top/\(cody.top.requestName)/bottom/\(cody.bottom.requestName)/shoes/\(cody.shoes.requestName)"

        AF.request(url)
            .validate(statusCode: 200..<300) // 200~300만 성공으로 처리
            .responseDecodable(of: [RecommendElement].self) { completion($0.result) }
    }
    
    
}
