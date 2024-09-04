//
//  MainVC.swift
//  AutoStyler
//
//  Created by 신정욱 on 9/2/24.
//

import UIKit

final class MainVC: UIViewController {

    let mainView = MainView()
    
    // MARK: - 라이프사이클
    override func loadView() {
        super.loadView()
        self.view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.pickerView.delegate = self

        setNavigationBar(title: String(localized: "코디 추천"))
        setAttributes()
    }
    
    // MARK: - 속성 초기화
    private func setAttributes() {
        NetworkManager.shared.checkConnecting { [weak self] result in
            switch result {
            case .success(_):
                self?.mainView.connectStatusLabel.text = String(localized: "서버 온라인")
            case .failure(_):
                self?.mainView.connectStatusLabel.text = String(localized: "서버 오프라인")
            }
        }
        
        mainView.confirmButton.addTarget(self, action: #selector(confirmRecommend), for: .touchUpInside)
    }

    // MARK: - 로직
    @objc private func confirmRecommend() {
        // 버튼 비활성화 및 인디케이터
        mainView.confirmButton.configuration?.showsActivityIndicator = true
        mainView.confirmButton.isEnabled = false
        
        // 현재 선택된 조합 인덱스 값 가져오기
        let topIndex = mainView.pickerView.selectedRow(inComponent: ItemPart.top.rawValue)
        let bottomIndex = mainView.pickerView.selectedRow(inComponent: ItemPart.bottom.rawValue)
        let shoesIndex = mainView.pickerView.selectedRow(inComponent: ItemPart.shoes.rawValue)
        let cody = Cody(top: Item.top[topIndex], bottom: Item.bottom[bottomIndex], shoes: Item.shoes[shoesIndex])
        
        // 네트워크 통신 시작
        NetworkManager.shared.fetchRecommendData(cody: cody) { [weak self] result in
            // 버튼 활성화 및 인디케이터
            self?.mainView.confirmButton.configuration?.showsActivityIndicator = false
            self?.mainView.confirmButton.isEnabled = true
            
            // rsponse 핸들링
            switch result {
            case .success(let data): 
                let codyData = data.map { Cody(element: $0) }.compactMap { $0 }
                self?.presentResult(cody: codyData)
            case .failure(_):
                self?.presentAcceptAlert(
                    title: String(localized: "추천 실패"),
                    message: String(localized: "통신 중 문제가 발생했어요.\n네트워크 상태를 확인해 주세요."))
            }
        }
    }
    
    
    private func presentResult(cody: [Cody]) {
        let resultVC = ResultVC()
        resultVC.cody = cody
        let vc = UINavigationController(rootViewController: resultVC)
        vc.modalPresentationStyle = .fullScreen

        self.present(vc, animated: true)
    }
}


extension MainVC: UIPickerViewDataSource, UIPickerViewDelegate {
    // 섹션 갯수
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        ItemPart.allCases.count
    }
    
    // 섹션별 셀 개수
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        component.toItemComponent?.items.count ?? 0
    }
    
    // 셀 내용
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        component.toItemComponent?.items[row].image?.toImageView(size: Constants.rowHeight) ?? UIView()
    }
    
    // 셀 높이
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        Constants.rowHeight
    }
}



#Preview {
    UINavigationController(rootViewController: MainVC())
}

