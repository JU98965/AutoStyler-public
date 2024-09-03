//
//  ResultCell.swift
//  AutoStyler
//
//  Created by 신정욱 on 9/3/24.
//

import UIKit
import SnapKit

final class ResultCell: UITableViewCell {
    static let identifier = "ResultCell"
    var cody: Cody?

    // MARK: - 컴포넌트
    let overall = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.distribution = .fillEqually
        sv.spacing = 15
        return sv
    }()
    
    let rateLael = {
        let label = PaddingUILabel(padding: .init(top: 15, left: 10, bottom: 15, right: 10))
        label.font = .boldSystemFont(ofSize: label.font.pointSize)
        label.textColor = .gray
        label.text = String(localized: "AI 정확도\n50%")
        label.backgroundColor = .chuLightGray
        label.layer.cornerRadius = 15
        label.clipsToBounds = true
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    }()
    
    let topImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.layer.cornerRadius = 15
        view.image = UIImage(named: "s3")
        return view
    }()
    
    let bottomImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.layer.cornerRadius = 15
        view.image = UIImage(named: "s3")
        return view
    }()
    
    let shoesImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.layer.cornerRadius = 15
        view.image = UIImage(named: "s3")
        return view
    }()
    
    // MARK: - 라이프 사이클
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        contentView.backgroundColor = .white
        contentView.clipsToBounds = true
        contentView.layer.cornerRadius = 15
        
        setAutoLayout()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - 오토레이아웃
    private func setAutoLayout() {
        contentView.addSubview(overall)
        overall.addArrangedSubview(rateLael)
        overall.addArrangedSubview(topImageView)
        overall.addArrangedSubview(bottomImageView)
        overall.addArrangedSubview(shoesImageView)
        
        overall.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(15)
        }
        
    }
    
    // MARK: - 속성 초기화
    func setAttrubutes(cody: Cody) {
        if cody.rate == 1.0 {
            rateLael.text = String(localized: "내가 선택한\n조합")
        } else {
            let rate = String(format: "AI 정확도\n%2.1f%%", cody.rate * 100.0)
            rateLael.text = String(localized: String.LocalizationValue(rate))
        }
        topImageView.image = cody.top.image
        bottomImageView.image = cody.bottom.image
        shoesImageView.image = cody.shoes.image
    }
}

#Preview(traits: .fixedLayout(width: 400, height: 100)) {
    ResultCell()
}
