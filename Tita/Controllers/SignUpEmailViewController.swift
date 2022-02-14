//
//  SignUpEmailViewController.swift
//  Tita
//
//  Created by 혜인 on 2022/02/02.
//

import UIKit
import SnapKit
import Then

class SignUpEmailViewController: UIViewController {
    //MARK: - Properties
    private let descriptionView = SignUpDescriptionView().then {
        $0.dataSetting(description: "마지막으로, 본인인증을 위해\n이메일을 입력해주세요.")
        $0.previousButton.addTarget(self, action: #selector(tapPrevious(_:)), for: .touchUpInside)
    }
    
    private let textFieldView = SignUpTextFieldView().then {
        $0.dataSetting(labelText: "이메일")
    }
    
    private let nextButton = LoginButton().then {
        $0.dataSetting(title: "다음")
        $0.addTarget(self, action: #selector(tapNextButton(_:)), for: .touchUpInside)
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
    
    @objc private func tapNextButton(_ sender: UIButton){
        let nextVC = SignUpCertificationNumberViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
        print("next")
    }
    
    //MARK: - Keyboard Setting
    @objc func keyboardWillShow(_ sender: Notification) {
        nextButton.snp.remakeConstraints { make in
            make.width.equalToSuperview().dividedBy(1.15)
            make.height.equalToSuperview().dividedBy(16.24)
            make.top.equalToSuperview().offset(self.view.frame.height/1.8)
            make.centerX.equalToSuperview()
        }

    }

    @objc func keyboardWillHide(_ sender: Notification) {
        nextButton.snp.remakeConstraints { make in
            make.width.equalToSuperview().dividedBy(1.15)
            make.height.equalToSuperview().dividedBy(16.24)
            make.bottom.equalToSuperview().inset(self.view.frame.height/25.38)
            make.centerX.equalToSuperview()
        }
        
    }
        
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        textFieldView.textField.resignFirstResponder()
    }

    //MARK: - Helpers
    private func configureUI(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name:UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        view.backgroundColor = .white
        addView()
        location()
    }
    
    // MARK: - Add View
    private func addView(){
        [descriptionView, textFieldView, nextButton].forEach { view.addSubview($0)}
    }
    
    // MARK: - Location
    private func location(){
        descriptionView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalToSuperview().dividedBy(3.98)
            make.top.equalToSuperview().offset(self.view.frame.height/13.1)
            make.centerX.equalToSuperview()
        }
        
        textFieldView.snp.makeConstraints { make in
            make.width.equalToSuperview().dividedBy(1.15)
            make.height.equalToSuperview().dividedBy(9.12)
            make.top.equalTo(descriptionView.snp.bottom).offset(self.view.frame.height/32.48)
            make.centerX.equalToSuperview()
        }
        
        nextButton.snp.makeConstraints { make in
            make.width.equalToSuperview().dividedBy(1.15)
            make.height.equalToSuperview().dividedBy(16.24)
            make.bottom.equalToSuperview().inset(self.view.frame.height/25.38)
            make.centerX.equalToSuperview()
        }
    }
    
}
