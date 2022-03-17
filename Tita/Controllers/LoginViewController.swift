//
//  LoginViewController.swift
//  Tita
//
//  Created by 노연주 on 2022/01/19.
//

import UIKit
import SnapKit
import Then
import Alamofire

class LoginViewController: UIViewController, UITextFieldDelegate {
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
        $0.addTarget(self, action: #selector(onTapForgot(sender:)), for: .touchUpInside)
    }
    
    private let loginButton = LoginButton().then {
        $0.dataSetting(title: "로그인")
        $0.addTarget(self, action: #selector(onTapLogin(sender:)), for: .touchUpInside)
    }
    
    private let signUpLabel = UILabel().then {
        $0.text = "혹시 아직 회원이 아니신가요?"
        $0.textColor = .black
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-Light")
    }

    private let signUpButton = UIButton().then {
        $0.setTitle("회원가입", for: .normal)
        $0.setTitleColor(.rgb(red: 53, green: 117, blue: 172), for: .normal)
        $0.backgroundColor = .white
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-Bold")
        $0.addTarget(self, action: #selector(onTapSignUp(sender:)), for: .touchUpInside)
    }
    
    private let errorAlert = UIAlertController(title: "로그인 오류", message: "입력한 아이디 혹은 비밀번호가 올바르지 않습니다.\n다시 시도하세요.", preferredStyle: .alert).then {
        $0.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
    }
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    //MARK: - Selectors
    @objc private func onTapLogin(sender:UIButton){
        print("Login")
        // 로그인 오류 시 Alert
//        present(errorAlert, animated: true, completion: nil)
        
        // VC 이동
        let nextVC = MainViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @objc private func onTapSignUp(sender:UIButton){
        print("SignUP")
        let nextVC = TermsAgreementViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }

    @objc private func onTapForgot(sender:UIButton){
        print("Forgot")
        let nextVC = LoginViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    //MARK: - Helpers
    private func configureUI(){
        view.backgroundColor = .white
        keyboardTypeSetting()
        textFieldDeleageSetting()
        addNotificationCenter()
        addView()
        location()
    }
    
    // MARK: - Add View
    private func addView(){
        [logo, aboutTita, idTextField, pwTextField, forgotButton, loginButton, signUpLabel, signUpButton].forEach{ view.addSubview($0) }
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
        loginButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(forgotButton.snp.bottom).offset(self.view.frame.height/29)
            make.width.equalToSuperview().dividedBy(1.43)
            make.height.equalToSuperview().dividedBy(20.3)
        }
        signUpLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(self.view.frame.width/3.44)
            make.top.equalTo(loginButton.snp.bottom).offset(self.view.frame.height/29)
        }
        signUpButton.snp.makeConstraints { make in
            make.left.equalTo(signUpLabel.snp.right).offset(self.view.frame.width/75)
            make.centerY.equalTo(signUpLabel)
            make.width.equalToSuperview().dividedBy(10.3)
            make.height.equalToSuperview().dividedBy(50.75)
        }
    }

    // MARK: - KeyboardType Setting
    private func keyboardTypeSetting(){
        idTextField.keyboardType = .asciiCapable
        pwTextField.keyboardType = .asciiCapable
    }
    
    // MARK: - textField delegate Setting
    private func textFieldDeleageSetting(){
        idTextField.delegate = self
        pwTextField.delegate = self
    }

    // MARK: - textField Point Set
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //MARK: - Add NotificationCenter
    private func addNotificationCenter(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name:UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    //MARK: - KeyboardWillShow -> self.view Up
    @objc private func keyboardWillShow(_ sender: Notification) {
        self.view.frame.origin.y = -self.view.frame.height/13.1
    }
    
    //MARK: - KeyboardWillHide -> self.view Down
    @objc private func keyboardWillHide(_ sender: Notification) {
        self.view.frame.origin.y = 0
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == idTextField {
            idTextField.layer.borderColor = UIColor.black.cgColor
        } else if textField == pwTextField {
            pwTextField.layer.borderColor = UIColor.black.cgColor
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == idTextField {
            idTextField.layer.borderColor = UIColor.rgb(red: 205, green: 205, blue: 205).cgColor
        } else if textField == pwTextField {
            pwTextField.layer.borderColor = UIColor.rgb(red: 205, green: 205, blue: 205).cgColor
        }
    }
}
