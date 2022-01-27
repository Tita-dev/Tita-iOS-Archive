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
        [descriptionView, allTermsAgreeButton, allTermsLabel].forEach{ view.addSubview($0)}
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
