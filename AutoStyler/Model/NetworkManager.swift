//
//  NetworkManager.swift
//  AutoStyler
//
//  Created by 신정욱 on 9/2/24.
//

import UIKit
import Alamofire

final class NetworkManager {
    static let shared = NetworkManager()
    private init() {}
    
    func checkConnecting(_ repeatCount: Int = 5, completion: ((Result<Data?, AFError>) -> Void)? = nil) {
        let url = "https://..."
        
        AF.request(url)
            .validate(statusCode: 200..<300) // 200~300만 성공으로 처리
            .response { [weak self] in
                guard let self else { return }
                
                switch $0.result {
                case .success(let data):
                    print("접속 성공")
                    completion?(.success(data))
                    
                case .failure(let error):
                    if repeatCount > 0 {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0 ) {
                            print("재시도 중 \(repeatCount)")
                            self.checkConnecting(repeatCount - 1, completion: completion)
                        }
                    } else {
                        print("접속 실패")
                        completion?(.failure(error))
                    }
                }
            }
    }
    
    func fetchRecommendData(cody: Cody, completion: @escaping (Result<[RecommendElement], AFError>) -> Void) {
        let url = "https://flaskprc-ceegg.run.goorm.io/top/\(cody.top.requestName)/bottom/\(cody.bottom.requestName)/shoes/\(cody.shoes.requestName)"

        AF.request(url)
            .validate(statusCode: 200..<300) // 200~300만 성공으로 처리
            .responseDecodable(of: [RecommendElement].self) { completion($0.result) }
    }
    
    
}
