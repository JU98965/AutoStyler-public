//
//  ResultVC.swift
//  AutoStyler
//
//  Created by 신정욱 on 9/3/24.
//

import UIKit

final class ResultVC: UIViewController {
    
    let resultView = ResultView()
    
    var cody: [Cody]?
    
    override func loadView() {
        super.loadView()
        self.view = resultView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setAttributes()
        setNavigationBar(
            rightBarButtonItems: [resultView.dismissBarButton], 
            title: String(localized: "추천 결과"))
    }
    
    private func setAttributes() {
        resultView.tableView.dataSource = self
        resultView.dismissButton.addTarget(self, action: #selector(dismissAction), for: .touchUpInside)
        resultView.dismissBarButton.target = self
        resultView.dismissBarButton.action = #selector(dismissAction)
    }
    
    @objc private func dismissAction() {
        dismiss(animated: true)
    }
}


extension ResultVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cody?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ResultCell.identifier, for: indexPath) as? ResultCell,
              let cody = self.cody else { return UITableViewCell() }
        
        
        cell.setAttrubutes(cody: cody[indexPath.row])
        cell.selectionStyle = .none
        
        return cell
    }
}

#Preview {
    UINavigationController(rootViewController: ResultVC())
}
