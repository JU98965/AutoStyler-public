//
//  ResultView.swift
//  AutoStyler
//
//  Created by 신정욱 on 9/3/24.
//

import UIKit
import SnapKit

final class ResultView: UIView {
    // MARK: - 컴포넌트
    let dismissBarButton = {
        let button = UIBarButtonItem()
        button.title = String(localized: "닫기")
        button.tintColor = .white
        return button
    }()
    
    let overallSV = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.distribution = .fill
        sv.spacing = 15
        return sv
    }()
    
    let tableView = {
        let tv = UITableView()
        tv.register(ResultCell.self, forCellReuseIdentifier: ResultCell.identifier)
        tv.separatorStyle = .none
        tv.backgroundColor = .clear
        return tv
    }()
    
    let dismissButton = {
        let button = UIButton(configuration: .filled())
        button.setTitle(String(localized: "닫기"), for: .normal)
        button.backgroundColor = .chuBlue
        button.layer.cornerRadius = 15
        button.clipsToBounds = true
        return button
    }()
    
    // MARK: - 라이프사이클
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .chuLightGray
        setAutoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - 오토레이아웃
    private func setAutoLayout() {
        self.addSubview(overallSV)
        overallSV.addArrangedSubview(tableView)
        overallSV.addArrangedSubview(dismissButton)
        
        overallSV.snp.makeConstraints { make in
            make.edges.equalTo(safeAreaLayoutGuide).inset(15)
        }
        dismissButton.snp.makeConstraints { $0.height.equalTo(50) }
    }
}

#Preview {
    UINavigationController(rootViewController: ResultVC())
}
