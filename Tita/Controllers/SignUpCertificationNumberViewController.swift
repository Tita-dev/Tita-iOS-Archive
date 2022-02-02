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
        $0.dataSetting(description: "이메일을 열어 Ti-Ta가 남긴\n인증번호를 확인해주세요!")
        $0.previousButton.addTarget(self, action: #selector(tapPrevious(_:)), for: .touchUpInside)
    }
    
    private let textFieldView = SignUpTextFieldView().then {
        $0.dataSetting(labelText: "인증번호")
    }
    
    private let doNotReceiveButton = UIButton().then {
        $0.setTitle("인증번호가 오지 않았나요?", for: .normal)
        $0.setTitleColor(.rgb(red: 57, green: 117, blue: 172), for: .normal)
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-Regular")
    }
    
    private let reSendButton = UIButton().then {
        $0.setTitle("인증번호 재전송", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-Regular")
        $0.isHidden = true
    }
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    //MARK: - Selectors
    @objc
    private func tapPrevious(_ sender: UIButton){
        navigationController?.popViewController(animated: true)
        print("previous")
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
        [descriptionView, textFieldView, doNotReceiveButton, reSendButton].forEach { view.addSubview($0)}
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
    }
    
}

//MARK: - Preview
#if DEBUG
import SwiftUI
struct ViewControllerRepresentable: UIViewControllerRepresentable {
    
func updateUIViewController(_ uiView: UIViewController,context: Context) {
        // leave this empty
}
    @available(iOS 13.0.0, *)
    func makeUIViewController(context: Context) -> UIViewController{
        SignUpCertificationNumberViewController()
    }
}
@available(iOS 13.0, *)
struct ViewControllerRepresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            ViewControllerRepresentable()
                .ignoresSafeArea()
                .previewDisplayName(/*@START_MENU_TOKEN@*/"Preview"/*@END_MENU_TOKEN@*/)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
        }
        
    }
} #endif
