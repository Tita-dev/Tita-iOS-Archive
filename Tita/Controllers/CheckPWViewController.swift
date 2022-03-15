//
//  CheckPWViewController.swift
//  Tita
//
//  Created by 혜인 on 2022/03/15.
//

import UIKit
import SnapKit
import Then

class CheckPWViewController: UIViewController {
    //MARK: - Properties
    private let descriptionView = SignUpDescriptionView().then {
        $0.dataSetting(description: "비밀번호를 재설정했어요!\n이제 다시 로그인을 시도해 봐요!", additionalDescription: nil)
        $0.previousButton.addTarget(self, action: #selector(tapPrevious(_:)), for: .touchUpInside)
    }
    
    private let mainButton = LoginButton().then {
        $0.dataSetting(title: "메인으로")
        $0.addTarget(self, action: #selector(tapMainButton(_:)), for: .touchUpInside)
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    //MARK: - Selectors
    @objc private func tapPrevious(_ sender: UIButton){
        navigationController?.popViewController(animated: true)
        print("previous")
    }
    
    @objc private func tapMainButton(_ sender: UIButton){
        let nextVC = LoginViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
       print("complete sign up")
    }
    
    //MARK: - Helpers
    private func configureUI(){
        view.backgroundColor = .white
        addView()
        location()
    }
    
    // MARK: - Add View
    private func addView(){
        [descriptionView, mainButton].forEach { view.addSubview($0)}
    }
    
    // MARK: - Location
    private func location(){
        descriptionView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalToSuperview().dividedBy(3.37)
            make.top.equalToSuperview().offset(self.view.frame.height/13.1)
            make.centerX.equalToSuperview()
        }
        
        mainButton.snp.makeConstraints { make in
            make.width.equalToSuperview().dividedBy(1.15)
            make.height.equalToSuperview().dividedBy(16.24)
            make.bottom.equalToSuperview().inset(self.view.frame.height/25.38)
            make.centerX.equalToSuperview()
        }
    }
    
}
