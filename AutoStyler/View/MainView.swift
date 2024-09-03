//
//  MainView.swift
//  AutoStyler
//
//  Created by 신정욱 on 9/2/24.
//

import UIKit
import SnapKit

final class MainView: UIView {
    
    // MARK: - 컴포넌트
    let connectStatusLabel = {
        let label = UILabel()
        label.text = String(localized: "연결중..")
        label.textColor = .gray
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    let overallSV = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.distribution = .fill
        sv.spacing = 10
        sv.isLayoutMarginsRelativeArrangement = true
        sv.directionalLayoutMargins = .init(top: 10, leading: 10, bottom: 10, trailing: 10)
        sv.backgroundColor = .white
        sv.layer.cornerRadius = 15
        sv.clipsToBounds = true
        return sv
    }()
    
    let codyTitleLabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 18)
        label.text = String(localized: "의상 조합 선택")
        label.textColor = .gray
        return label
    }()
    
    let pickerView = {
        let pv = UIPickerView()
        return pv
    }()
    
    let secondOverallSV = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.distribution = .fill
        sv.spacing = 10
        sv.isLayoutMarginsRelativeArrangement = true
        sv.directionalLayoutMargins = .init(top: 10, leading: 10, bottom: 10, trailing: 10)
        sv.backgroundColor = .white
        sv.layer.cornerRadius = 15
        sv.clipsToBounds = true
        return sv
    }()
    
    let infoLabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 18)
        label.textColor = .gray
        label.text = String(localized: "선택한 조합을 기반으로\n좋아할 만한 코디를 추천해 드릴게요!")
        label.numberOfLines = 2
        return label
    }()
    
    let confirmButton = {
        let button = UIButton(configuration: .filled())
        button.setTitle(String(localized: "이 조합으로 코디 추천받기"), for: .normal)
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
        self.addSubview(connectStatusLabel)
        self.addSubview(overallSV)
        self.addSubview(secondOverallSV)
        self.addSubview(confirmButton)
        overallSV.addArrangedSubview(codyTitleLabel)
        overallSV.addArrangedSubview(DivideView(lineWidth: 1, lineColor: .chuLightGray))
        overallSV.addArrangedSubview(pickerView)
        secondOverallSV.addArrangedSubview(infoLabel)
        
        connectStatusLabel.snp.makeConstraints { make in
            make.leading.top.equalTo(self.safeAreaLayoutGuide).inset(5)
        }
        
        overallSV.snp.makeConstraints { make in
            make.top.equalTo(connectStatusLabel.snp.bottom).offset(15)
            make.horizontalEdges.equalToSuperview().inset(15)
        }
        
        pickerView.snp.makeConstraints { $0.height.equalTo(200) }
        
        secondOverallSV.snp.makeConstraints { make in
            make.top.equalTo(overallSV.snp.bottom).offset(15)
            make.horizontalEdges.equalToSuperview().inset(15)
        }
        
        confirmButton.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(15)
            make.bottom.equalTo(self.safeAreaLayoutGuide).inset(15)
            make.height.equalTo(50)
        }
    }
}



#Preview {
    UINavigationController(rootViewController: MainVC())
}
