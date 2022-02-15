//
//  SignUpCertificationNumberViewController.swift
//  Tita
//
//  Created by 혜인 on 2022/02/03.
//

import UIKit
import SnapKit
import Then

class SignUpCertificationNumberViewController: UIViewController {
    //MARK: - Properties
    private let descriptionView = SignUpDescriptionView().then {
        $0.dataSetting(description: "이메일을 열어 Ti-Ta가 남긴\n인증번호를 확인해주세요!", additionalDescription: nil)
        $0.previousButton.addTarget(self, action: #selector(tapPrevious(_:)), for: .touchUpInside)
    }
    
    private let textFieldView = SignUpTextFieldView().then {
        $0.dataSetting(labelText: "인증번호")
    }
    
    private let doNotReceiveButton = UIButton().then {
        $0.setTitle("인증번호가 오지 않았나요?", for: .normal)
        $0.setTitleColor(.rgb(red: 57, green: 117, blue: 172), for: .normal)
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-Regular")
        $0.addTarget(self, action: #selector(tapDoNotReceive(_:)), for: .touchUpInside)
    }
    
    private let reSendButton = UIButton().then {
        $0.setTitle("인증번호 재전송", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-Regular")
        $0.isHidden = true
        $0.addTarget(self, action: #selector(tapResendButton(_:)), for: .touchUpInside)
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
    
    @objc private func tapDoNotReceive(_ sender: UIButton){
        print("do not receive")
        if reSendButton.isHidden == true {
            doNotReceiveButton.snp.remakeConstraints { make in
                make.width.equalToSuperview().dividedBy(3.4)
                make.height.equalToSuperview().dividedBy(62.46)
                make.top.equalTo(textFieldView.errorLabel)
                make.left.equalToSuperview().offset(self.view.frame.width/2.21)
            }
            reSendButton.isHidden = false
        }
    }
    
    @objc private func tapResendButton(_ sender: UIButton){
        print("re-send")
    }
    
    @objc private func tapNextButton(_ sender: UIButton){
        if reSendButton.isHidden == false{
            doNotReceiveButton.snp.remakeConstraints { make in
                make.width.equalToSuperview().dividedBy(3.4)
                make.height.equalToSuperview().dividedBy(62.46)
                make.top.equalTo(textFieldView.errorLabel)
                make.right.equalTo(textFieldView.line)
            }
            reSendButton.isHidden = true
        }
        print("next")
        let nextVC = EndSignUpViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
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
        [descriptionView, textFieldView, doNotReceiveButton, reSendButton, nextButton].forEach { view.addSubview($0)}
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
        
        doNotReceiveButton.snp.makeConstraints { make in
            make.width.equalToSuperview().dividedBy(3.4)
            make.height.equalToSuperview().dividedBy(62.46)
            make.top.equalTo(textFieldView.errorLabel)
            make.right.equalTo(textFieldView.line)
        }
        
        reSendButton.snp.makeConstraints { make in
            make.width.equalToSuperview().dividedBy(5.65)
            make.height.equalToSuperview().dividedBy(62.46)
            make.top.equalTo(doNotReceiveButton)
            make.right.equalTo(textFieldView.line)
        }
        
        nextButton.snp.makeConstraints { make in
            make.width.equalToSuperview().dividedBy(1.15)
            make.height.equalToSuperview().dividedBy(16.24)
            make.bottom.equalToSuperview().inset(self.view.frame.height/25.38)
            make.centerX.equalToSuperview()
        }
    }
    
}
