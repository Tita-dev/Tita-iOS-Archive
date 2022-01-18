//
//  LoginViewController.swift
//  Tita
//
//  Created by 혜인 on 2021/12/06.
//

import UIKit
import SnapKit
import Then

class LoginViewController: UIViewController {
    //MARK: - Properties
    private let background = UIImageView().then {
        $0.image = UIImage(named: "Tita-LoginBack")
    }
    
    private let logo = UIImageView().then {
        $0.image = UIImage(named: "Tita-Logo")
    }
    
    private let welcomeLabel = UILabel().then {
        let example = NSAttributedString(string: "어서오세요\nTimeTable입니다").withLineSpacing(5)
        $0.attributedText = example
        $0.numberOfLines = 0
        $0.textAlignment = .center
        $0.textColor = .black
        $0.dynamicFont(fontSize: 20, currentFontName: "AppleSDGothicNeo-Bold")
    }
    
    private let idTextField = LoginTextField().then {
        $0.dataSetting(placeholderText: "아이디")
    }
    
    private let pwTextField = LoginTextField().then {
        $0.dataSetting(placeholderText: "비밀번호")
        $0.loginTextField.isSecureTextEntry = true
    }
    
    private let loginButton = LoginButton().then {
        $0.dataSetting(title: "로그인")
        $0.addTarget(self, action: #selector(onTapLogin(sender:)), for: .touchUpInside)
    }
    
    private let signUpButton = UIButton().then {
        $0.setTitle("회원가입하기", for: .normal)
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-Light")
        $0.setTitleColor(.black, for: .normal)
        $0.backgroundColor = .white
        $0.addTarget(self, action: #selector(onTapSignUp(sender:)), for: .touchUpInside)
    }
    
    private let forgotIdButton = UIButton().then {
        $0.setTitle("아이디를 잊으셨나요?", for: .normal)
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-Light")
        $0.setTitleColor(.black, for: .normal)
        $0.backgroundColor = .white
        $0.addTarget(self, action: #selector(onTapForgotId(sender:)), for: .touchUpInside)
    }
    
    private let forgotPwButton = UIButton().then {
        $0.setTitle("비밀번호를 잊으셨나요?", for: .normal)
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-Light")
        $0.setTitleColor(.black, for: .normal)
        $0.backgroundColor = .white
        $0.addTarget(self, action: #selector(onTapForgotPw(sender:)), for: .touchUpInside)
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
        addView()
        location()
    }
    
    // MARK: - Add View
    private func addView(){
        [background, logo, welcomeLabel, idTextField, pwTextField, loginButton, signUpButton, forgotIdButton, forgotPwButton].forEach{ view.addSubview($0) }
    }
    
    // MARK: - Location
    private func location(){
        background.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        logo.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(self.view.frame.height/7)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().dividedBy(3.46)
            make.height.equalToSuperview().dividedBy(20.12)
        }
        
        welcomeLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(logo.snp.bottom).offset(self.view.frame.height/29.37)
        }
        
        idTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(welcomeLabel.snp.bottom).offset(self.view.frame.height/18.45)
            make.width.equalToSuperview().dividedBy(1.43)
            make.height.equalToSuperview().dividedBy(19.33)
        }
        
        pwTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(idTextField.snp.bottom).offset(self.view.frame.height/19.33)
            make.width.equalToSuperview().dividedBy(1.43)
            make.height.equalToSuperview().dividedBy(19.33)
        }
        
        loginButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(pwTextField.snp.bottom).offset(self.view.frame.height/15.62)
            make.width.equalToSuperview().dividedBy(3.18)
            make.height.equalToSuperview().dividedBy(20.3)
        }
        
        signUpButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(loginButton.snp.bottom).offset(self.view.frame.height/29)
            make.width.equalToSuperview().dividedBy(6)
            make.height.equalToSuperview().dividedBy(60)
        }
        
        forgotIdButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(signUpButton.snp.bottom).offset(self.view.frame.height/8.20)
            make.width.equalToSuperview().dividedBy(4)
            make.height.equalToSuperview().dividedBy(60)
        }
        
        forgotPwButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(forgotIdButton.snp.bottom).offset(self.view.frame.height/62.46)
            make.width.equalToSuperview().dividedBy(3.5)
            make.height.equalToSuperview().dividedBy(60)
        }
    }

    // MARK: - KeyboardType Setting
    private func keyboardTypeSetting(){
        idTextField.loginTextField.keyboardType = .asciiCapable
        pwTextField.loginTextField.keyboardType = .asciiCapable
    }

    // MARK: - textField Point Set
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
