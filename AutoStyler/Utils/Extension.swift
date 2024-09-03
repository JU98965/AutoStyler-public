//
//  Extension.swift
//  AutoStyler
//
//  Created by 신정욱 on 9/2/24.
//

import UIKit

// MARK: - UIColor
extension UIColor {
    convenience init(hex: Int, alpha: CGFloat = 1.0) {
        let red = CGFloat((hex & 0xff0000) >> 16) / 255.0
        let green = CGFloat((hex & 0xff00) >> 8) / 255.0
        let blue = CGFloat((hex & 0xff) >> 0) / 255.0
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    static var chuLightGray: UIColor {
        UIColor.init(hex: 0xEBEBEB)
    }
    
    static var chuBlue: UIColor {
        UIColor.init(hex: 0x2B67F6)
    }
}

// MARK: - UIViewController
extension UIViewController {
    //네비게이션 바 구성, 스크롤 시에도 색이 변하지 않음
    func setNavigationBar(
        leftBarButtonItems: [UIBarButtonItem]? = nil,
        rightBarButtonItems: [UIBarButtonItem]? = nil,
        title: String? = nil
    ){
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithOpaqueBackground()
        navigationBarAppearance.backgroundColor = .chuBlue
        navigationBarAppearance.shadowColor = .clear // 그림자 없애기
        
        if let title { // 타이틀 설정
            navigationBarAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white] // 타이틀 색깔
            self.navigationController?.navigationBar.tintColor = .white
            self.title = title
        }
        if let leftBarButtonItems {
            navigationItem.leftBarButtonItems = leftBarButtonItems
        }
        if let rightBarButtonItems {
            navigationItem.rightBarButtonItems = rightBarButtonItems
        }

        navigationController?.navigationBar.standardAppearance = navigationBarAppearance
        navigationController?.navigationBar.compactAppearance = navigationBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navigationBarAppearance
    }
    
    func presentAcceptAlert(
        title: String,
        message: String,
        acceptTitle: String = String(localized: "확인"),
        acceptTask: (() -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let accept = UIAlertAction(title: acceptTitle, style: .default) { _ in acceptTask?() }
        
        alert.addAction(accept)
            
        self.present(alert, animated: true, completion: nil)
    }
}

// MARK: - UIImage
extension UIImage {
    func toImageView(size: CGFloat) -> UIImageView {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.frame = .init(x: 0, y: 0, width: size, height: size)
        view.image = self
        view.layer.cornerRadius = 15
        view.clipsToBounds = true
        return view
    }
}

// MARK: - Int
extension Int {
    var toItemComponent: ItemPart? {
        ItemPart(rawValue: self)
    }
}
