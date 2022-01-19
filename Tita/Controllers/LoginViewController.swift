//
//  LoginViewController.swift
//  Tita
//
//  Created by 노연주 on 2022/01/19.
//

import UIKit
import SnapKit
import Then

class LoginViewController: UIViewController {
    //MARK: - Properties
    private let logo = UIImageView().then {
        $0.image = UIImage(named: "Tita-Logo")
    }
    
    private let aboutTita = UILabel().then {
        $0.text = "우리만의 공간, Time-Table"
        $0.dynamicFont(fontSize: 8, currentFontName: "AppleSDGothicNeo-Bold")
        $0.textColor = .black
    }
    
    private let idTextField = LoginTextField().then {
        $0.dataSetting(placeholderText: "아이디")
    }
    
    private let pwTextField = LoginTextField().then {
        $0.dataSetting(placeholderText: "비밀번호")
        $0.isSecureTextEntry = true
    }
    
    private let forgotButton = UIButton().then {
        $0.setTitle("아이디 / 비밀번호를 잊으셨나요?", for: .normal)
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-Light")
        $0.backgroundColor = .white
        $0.setTitleColor(.rgb(red: 53, green: 117, blue: 172), for: .normal)
    }
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    //MARK: - Selectors
    @objc private func onTapLogin(sender:UIButton){
        print("Login")
        let nextVC = MainViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @objc private func onTapSignUp(sender:UIButton){
        print("SignUP")
    }

    @objc private func onTapForgotId(sender:UIButton){
        print("ForgotId")
    }

    @objc private func onTapForgotPw(sender:UIButton){
        print("ForgotPw")
    }
    
    //MARK: - Helpers
    private func configureUI(){
        view.backgroundColor = .white
        
        keyboardTypeSetting()
        
        addView()
        location()
    }
    
    // MARK: - Add View
    private func addView(){
        [logo, aboutTita, idTextField, pwTextField, forgotButton].forEach{ view.addSubview($0) }
    }
    
    // MARK: - Location
    private func location(){
        logo.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(self.view.frame.height/3.59)
            make.width.equalToSuperview().dividedBy(3.46)
            make.height.equalToSuperview().dividedBy(20.12)
        }
        
        aboutTita.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(logo.snp.bottom).offset(self.view.frame.height/174.62)
        }
        
        idTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(aboutTita.snp.bottom).offset(self.view.frame.height/15.62)
            make.width.equalToSuperview().dividedBy(1.43)
            make.height.equalToSuperview().dividedBy(19.33)
        }
        
        pwTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(idTextField.snp.bottom).offset(self.view.frame.height/62.46)
            make.width.height.equalTo(idTextField)
        }
        
        forgotButton.snp.makeConstraints { make in
            make.right.equalTo(pwTextField)
            make.top.equalTo(pwTextField.snp.bottom).offset(self.view.frame.height/90.22)
            make.width.equalToSuperview().dividedBy(2.7)
            make.height.equalToSuperview().dividedBy(54.13)
        }
    }

    // MARK: - KeyboardType Setting
    private func keyboardTypeSetting(){
        idTextField.keyboardType = .asciiCapable
        pwTextField.keyboardType = .asciiCapable
    }

    // MARK: - textField Point Set
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

//MARK: - Preview
#if DEBUG
import SwiftUI
struct LoginViewControllerRepresentable: UIViewControllerRepresentable {
    
func updateUIViewController(_ uiView: UIViewController,context: Context) {
        // leave this empty
}
    @available(iOS 13.0.0, *)
    func makeUIViewController(context: Context) -> UIViewController{
        LoginViewController()
    }
}
@available(iOS 13.0, *)
struct ViewControllerRepresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            LoginViewControllerRepresentable()
                .ignoresSafeArea()
                .previewDisplayName(/*@START_MENU_TOKEN@*/"Preview"/*@END_MENU_TOKEN@*/)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
        }
        
    }
} #endif
