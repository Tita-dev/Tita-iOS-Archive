//
//  FindPWViewController.swift
//  Tita
//
//  Created by 혜인 on 2022/03/14.
//

import UIKit
import SnapKit
import Then

class FindPWViewController: UIViewController {
    //MARK: - Properties
    private let descriptionView = SignUpDescriptionView().then {
        $0.dataSetting(description: "비밀번호를 까먹으셨나요?", additionalDescription: "본인 인증을 위해 회원가입 시 사용했던 이메일이 필요해요.")
        $0.previousButton.addTarget(self, action: #selector(tapPrevious(_:)), for: .touchUpInside)
    }
    
    private let textFieldView = SignUpTextFieldView().then {
        $0.dataSetting(labelText: "이메일")
    }
    
    private let nextButton = LoginButton().then {
        $0.dataSetting(title: "다음")
        $0.addTarget(self, action: #selector(tapNextButton(_:)), for: .touchUpInside)
    }
    
    private let signUpLabel = UILabel().then {
        $0.isHidden = true
        $0.text = "혹시 아직 회원이 아니신가요?"
        $0.textColor = .black
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-Light")
    }

    private let signUpButton = UIButton().then {
        $0.isHidden = true
        $0.setTitle("회원가입", for: .normal)
        $0.setTitleColor(.rgb(red: 53, green: 117, blue: 172), for: .normal)
        $0.backgroundColor = .white
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-Bold")
        $0.addTarget(self, action: #selector(tapSignUp(sender:)), for: .touchUpInside)
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
        print("next")
        
        /* 등록되지 않은 이메일일 경우
        signUpLabel.isHidden = false
        signUpButton.isHidden = false
        errorLabel */
        
        // nextVC
    }
    
    @objc private func tapSignUp(sender:UIButton){
        print("SignUP")
        let nextVC = TermsAgreementViewController()
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
    
    //MARK: - NotificationCenterSetting
    private func notificationCenterSetting(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name:UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    //MARK: - Helpers
    private func configureUI(){
        view.backgroundColor = .white
        addView()
        cornerRadius()
        location()
        notificationCenterSetting()
    }
    
    // MARK: - Add View
    private func addView(){
        [descriptionView, textFieldView, nextButton, signUpLabel, signUpButton].forEach { view.addSubview($0) }
    }
    
    // MARK: - Corner Radius
    private func cornerRadius(){
        
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
        
        signUpLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(self.view.frame.width/3.44)
            make.bottom.equalTo(nextButton.snp.top).offset(self.view.frame.height/(-90.22))
        }
        
        signUpButton.snp.makeConstraints { make in
            make.left.equalTo(signUpLabel.snp.right).offset(self.view.frame.width/75)
            make.centerY.equalTo(signUpLabel)
            make.width.equalToSuperview().dividedBy(10.3)
            make.height.equalToSuperview().dividedBy(50.75)
        }
    }
    
}

//MARK: - Preview
#if DEBUG
import SwiftUI
struct FindPWViewControllerRepresentable: UIViewControllerRepresentable {
    
func updateUIViewController(_ uiView: UIViewController,context: Context) {
        // leave this empty
}
    @available(iOS 13.0.0, *)
    func makeUIViewController(context: Context) -> UIViewController{
        FindPWViewController()
    }
}
@available(iOS 13.0, *)
struct FindPWViewControllerRepresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            FindPWViewControllerRepresentable()
                .ignoresSafeArea()
                .previewDisplayName(/*@START_MENU_TOKEN@*/"Preview"/*@END_MENU_TOKEN@*/)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
        }
        
    }
} #endif
