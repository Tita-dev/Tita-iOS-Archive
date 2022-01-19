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
        [].forEach{ view.addSubview($0) }
    }
    
    // MARK: - Location
    private func location(){
        
    }

    // MARK: - KeyboardType Setting
    private func keyboardTypeSetting(){
        
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
