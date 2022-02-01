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
        $0.dataSetting(description: "어느 학교에 재학 중인가요?", additionalDescription: "학교 인증이 추후 진행되니 사실대로 골라주세요.")
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
        [descriptionView].forEach { view.addSubview($0)}
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
