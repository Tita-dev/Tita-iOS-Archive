//
//  NewPWViewController.swift
//  Tita
//
//  Created by 혜인 on 2022/03/15.
//

import UIKit
import SnapKit
import Then

class NewPWViewController: UIViewController {
    //MARK: - Properties
    private let descriptionView = SignUpDescriptionView().then {
        $0.dataSetting(description: "새롭게 비밀번호를 설정해 볼까요?", additionalDescription: "영문, 숫자, 특수문자를 섞어 8~16자 이내로 적어주세요.")
        $0.previousButton.addTarget(self, action: #selector(tapPrevious(_:)), for: .touchUpInside)
    }
    
    private let textFieldView = SignUpTextFieldView().then {
        $0.dataSetting(labelText: "비밀번호")
        $0.visibilityButton.isHidden = false
        $0.textField.isSecureTextEntry = true
        $0.visibilityButton.addTarget(self, action: #selector(tapVisibilityButton(_:)), for: .touchUpInside)
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
    
    @objc private func tapVisibilityButton(_ sender: UIButton){
        if textFieldView.textField.isSecureTextEntry{
            sender.setImage(UIImage(named: "Tita-Eye"), for: .normal)
        }else{
            sender.setImage(UIImage(named: "Tita-EyeSlash"), for: .normal)
        }
        textFieldView.textField.isSecureTextEntry.toggle()
    }
    
    @objc private func tapNextButton(_ sender: UIButton){
        let passwordPattern = "^(?=.*[A-Za-z])(?=.*[0-9])(?=.*[!@#$%^&*()_+=-]).{8,16}"
        let passwordRegex = try? NSRegularExpression(pattern: passwordPattern)
        
        if let _ = passwordRegex?.firstMatch(in: textFieldView.textField.text!, options: [], range: NSRange(location: 0, length: textFieldView.textField.text!.count)) {
            print("성공")
            textFieldView.errorLabel.text = ""
            let nextVC = CheckPWViewController()
            self.navigationController?.pushViewController(nextVC, animated: true)
        }else{
            print("실패")
            textFieldView.errorLabel.text = "조건에 맞지 않는 비밀번호입니다."
        }
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
    
    //MARK: - NotificationCenterSetting
    private func notificationCenterSetting(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name:UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    //MARK: - Helpers
    private func configureUI(){
        view.backgroundColor = .white
        addView()
        location()
        notificationCenterSetting()
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

