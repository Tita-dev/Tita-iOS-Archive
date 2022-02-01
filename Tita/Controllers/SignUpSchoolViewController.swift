//
//  SignUpSchoolViewController.swift
//  Tita
//
//  Created by 혜인 on 2022/02/01.
//

import UIKit
import SnapKit
import Then

class SignUpSchoolViewController: UIViewController {
    //MARK: - Properties
    private let descriptionView = SignUpDescriptionView().then {
        $0.dataSetting(description: "어느 학교에 재학 중인가요?", additionalDescription: "학교 인증이 추후 진행되니 사실대로 골라주세요.")
    }
    
    private let textFieldView = SignUpTextFieldView().then {
        $0.dataSetting(labelText: "학교")
    }
    
    private let searchButton = LoginButton().then {
        $0.dataSetting(title: "검색")
        $0.addTarget(self, action: #selector(tapSearchButton(_:)), for: .touchUpInside)
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
    private func tapSearchButton(_ sender: UIButton){
        print("search")
    }
    
    @objc
    private func tapNextButton(_ sender: UIButton){
        print("next")
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
        [descriptionView, textFieldView, searchButton, nextButton].forEach { view.addSubview($0)}
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
        
        textFieldView.line.snp.makeConstraints { make in
            make.width.equalToSuperview().dividedBy(1.31)
        }
        
        textFieldView.textField.snp.makeConstraints { make in
            make.width.equalToSuperview().dividedBy(1.31)
        }
        
        searchButton.snp.makeConstraints { make in
            make.width.equalToSuperview().dividedBy(5.36)
            make.height.equalToSuperview().dividedBy(16.24)
            make.left.equalTo(textFieldView.line.snp.right).offset(self.view.frame.width/23.44)
            make.top.equalTo(descriptionView.snp.bottom).offset(self.view.frame.height/16.92)
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
struct SignUpSchoolViewControllerRepresentable: UIViewControllerRepresentable {
    
func updateUIViewController(_ uiView: UIViewController,context: Context) {
        // leave this empty
}
    @available(iOS 13.0.0, *)
    func makeUIViewController(context: Context) -> UIViewController{
        SignUpSchoolViewController()
    }
}
@available(iOS 13.0, *)
struct SignUpSchoolViewControllerRepresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            SignUpSchoolViewControllerRepresentable()
                .ignoresSafeArea()
                .previewDisplayName(/*@START_MENU_TOKEN@*/"Preview"/*@END_MENU_TOKEN@*/)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
        }
        
    }
} #endif
