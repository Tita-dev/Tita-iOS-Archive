//
//  SignUpPWViewController.swift
//  Tita
//
//  Created by 혜인 on 2022/02/01.
//

import UIKit
import SnapKit
import Then

class SignUpPWViewController: UIViewController {
    //MARK: - Properties
    private let descriptionView = SignUpDescriptionView().then {
        $0.dataSetting(description: "본격적으로 계정을 만들어봐요!", additionalDescription: "영문, 숫자, 특수문자를 섞어 8~16자 이내로 적어주세요.")
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
    @objc
    func tapVisibilityButton(_ sender: UIButton){
        if textFieldView.textField.isSecureTextEntry{
            sender.setImage(UIImage(named: "Tita-Eye"), for: .normal)
        }else{
            sender.setImage(UIImage(named: "Tita-EyeSlash"), for: .normal)
        }
        textFieldView.textField.isSecureTextEntry.toggle()
    }
    
    @objc private func tapNextButton(_ sender: UIButton){
        updateSignUp()
        let nextVC = SignUpSchoolViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }

    //MARK: - Helpers
    private func configureUI(){
        view.backgroundColor = .white
        addView()
        cornerRadius()
        location()
    }
    
    // MARK: - Add View
    private func addView(){
        [descriptionView, textFieldView, nextButton].forEach { view.addSubview($0)}
    }
    
    // MARK: - Corner Radius
    private func cornerRadius(){
        
    }
    
    //MARK: - Update SignUp
    @objc
    func updateSignUp() {
        let passwordPattern = "^(?=.*[A-Za-z])(?=.*[0-9])(?=.*[!@#$%^&*()_+=-]).{8,16}"
        let passwordRegex = try? NSRegularExpression(pattern: passwordPattern)
        
        if let _ = passwordRegex?.firstMatch(in: textFieldView.textField.text!, options: [], range: NSRange(location: 0, length: textFieldView.textField.text!.count)) {
            print("성공")
        }else{
            print("실패")
        }
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

//MARK: - Preview
#if DEBUG
import SwiftUI
struct SignUpPWViewControllerRepresentable: UIViewControllerRepresentable {
    
func updateUIViewController(_ uiView: UIViewController,context: Context) {
        // leave this empty
}
    @available(iOS 13.0.0, *)
    func makeUIViewController(context: Context) -> UIViewController{
        SignUpPWViewController()
    }
}
@available(iOS 13.0, *)
struct SingUpPWViewControllerRepresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            SignUpPWViewControllerRepresentable()
                .ignoresSafeArea()
                .previewDisplayName(/*@START_MENU_TOKEN@*/"Preview"/*@END_MENU_TOKEN@*/)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
        }
        
    }
} #endif
