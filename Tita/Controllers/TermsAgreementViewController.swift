//
//  SignUpViewController.swift
//  Tita
//
//  Created by 혜인 on 2022/01/27.
//

import UIKit
import SnapKit
import Then

class TermsAgreementViewController: UIViewController {
    
    //MARK: - Properties
    private let descriptionView = SignUpDescriptionView()
    
    private let allTermsAgreeButton = UIButton().then {
        $0.setImage(UIImage(named: "Tita-UncheckedBox"), for: .normal)
    }
    
    private let allTermsLabel = UILabel().then {
        $0.text = "약관 전체 동의"
        $0.dynamicFont(fontSize: 20, currentFontName: "AppleSDGothicNeo-Light")
    }
    
    private let line = UIView().then {
        $0.backgroundColor = .rgb(red: 201, green: 201, blue: 201)
    }
    
    private let subTermsButton1 = UIButton().then {
        $0.setImage(UIImage(named: "Tita-UncheckedBox"), for: .normal)
    }
    
    private let subTermsLabel1 = UILabel().then {
        $0.text = "서비스 이용약관 동의(필수)"
        $0.dynamicFont(fontSize: 17, currentFontName: "AppleSDGothicNeo-Light")
    }
    
    private let subTermsButton2 = UIButton().then {
        $0.setImage(UIImage(named: "Tita-UncheckedBox"), for: .normal)
    }
    
    private let subTermsLabel2 = UILabel().then {
        $0.text = "개인정보처리방침 동의(필수)"
        $0.dynamicFont(fontSize: 17, currentFontName: "AppleSDGothicNeo-Light")
    }
    
    private let subTermsButton3 = UIButton().then {
        $0.setImage(UIImage(named: "Tita-UncheckedBox"), for: .normal)
    }
    
    private let subTermsLabel3 = UILabel().then {
        $0.text = "커뮤니티이용규칙 동의(필수)"
        $0.dynamicFont(fontSize: 17, currentFontName: "AppleSDGothicNeo-Light")
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    //MARK: - Selectors
    
    //MARK: - Helpers
    private func configureUI(){
        view.backgroundColor = .white
        addView()
        cornerRadius()
        location()
    }
    
    // MARK: - Add View
    private func addView(){
        [descriptionView, allTermsAgreeButton, allTermsLabel, line, subTermsButton1, subTermsLabel1, subTermsButton2, subTermsLabel2, subTermsButton3, subTermsLabel3].forEach{ view.addSubview($0)}
    }
    
    // MARK: - Corner Radius
    private func cornerRadius(){
        
    }
    
    // MARK: - Location
    private func location(){
        descriptionView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalToSuperview().dividedBy(6.66)
            make.top.equalToSuperview().offset(self.view.frame.height/5.64)
            make.centerX.equalToSuperview()
        }
        
        allTermsAgreeButton.snp.makeConstraints { make in
            make.width.equalToSuperview().dividedBy(20.83)
            make.height.equalToSuperview().dividedBy(45.11)
            make.top.equalTo(descriptionView.snp.bottom).offset(self.view.frame.height/14)
            make.left.equalToSuperview().offset(self.view.frame.width/15.63)
        }
        
        allTermsLabel.snp.makeConstraints { make in
            make.centerY.equalTo(allTermsAgreeButton)
            make.left.equalTo(allTermsAgreeButton.snp.right).offset(self.view.frame.width/41.67)
        }
        
        line.snp.makeConstraints { make in
            make.width.equalToSuperview().dividedBy(1.15)
            make.height.equalToSuperview().dividedBy(812)
            make.top.equalTo(allTermsLabel.snp.bottom).offset(self.view.frame.height/35.3)
            make.centerX.equalToSuperview()
        }
        
        subTermsButton1.snp.makeConstraints { make in
            make.width.equalToSuperview().dividedBy(23.44)
            make.height.equalToSuperview().dividedBy(50.75)
            make.top.equalTo(line.snp.bottom).offset(self.view.frame.height/31.23)
            make.left.equalTo(allTermsAgreeButton)
        }
        
        subTermsLabel1.snp.makeConstraints { make in
            make.centerY.equalTo(subTermsButton1)
            make.left.equalTo(subTermsButton1.snp.right).offset(self.view.frame.width/53.57)
        }
        
        subTermsButton2.snp.makeConstraints { make in
            make.width.height.left.equalTo(subTermsButton1)
            make.top.equalTo(subTermsButton1.snp.bottom).offset(self.view.frame.height/30.07)
        }
    
        subTermsLabel2.snp.makeConstraints { make in
            make.centerY.equalTo(subTermsButton2)
            make.left.equalTo(subTermsLabel1)
        }
        
        subTermsButton3.snp.makeConstraints { make in
            make.width.height.left.equalTo(subTermsButton2)
            make.top.equalTo(subTermsButton2.snp.bottom).offset(self.view.frame.height/30.07)
        }
        
        subTermsLabel3.snp.makeConstraints { make in
            make.centerY.equalTo(subTermsButton3)
            make.left.equalTo(subTermsLabel1)
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
        TermsAgreementViewController()
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
