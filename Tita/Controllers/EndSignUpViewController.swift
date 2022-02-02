//
//  EndSignUpViewController.swift
//  Tita
//
//  Created by 혜인 on 2022/02/03.
//

import UIKit
import SnapKit
import Then

class EndSignUpViewController: UIViewController {
    //MARK: - Properties
    private let descriptionView = SignUpDescriptionView().then {
        $0.dataSetting(description: "우리만의 공간에 들어갈\n준비가 모두 끝났어요!", additionalDescription: "Ti-Ta는 무분별한 욕설, 비방 등에 대해 제재를 가하고 있습니다.\n커뮤니티 가이드를 지키며 Ti-Ta 이용 부탁드립니다.")
        $0.previousButton.addTarget(self, action: #selector(tapPrevious(_:)), for: .touchUpInside)
    }
    
    private let mainLabel = UILabel().then {
        $0.text = "지금 바로 들어가 볼까요?"
        $0.dynamicFont(fontSize: 11, currentFontName: "AppleSDGothicNeo-Regular")
        $0.textColor = .rgb(red: 57, green: 117, blue: 172)
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
        [descriptionView, mainLabel].forEach { view.addSubview($0)}
    }
    
    // MARK: - Corner Radius
    private func cornerRadius(){
        
    }
    
    // MARK: - Location
    private func location(){
        descriptionView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalToSuperview().dividedBy(3.37)
            make.top.equalToSuperview().offset(self.view.frame.height/13.1)
            make.centerX.equalToSuperview()
        }
        
        mainLabel.snp.makeConstraints { make in
            make.top.equalTo(descriptionView.snp.bottom).offset(self.view.frame.height/2.04)
            make.centerX.equalToSuperview()
        }
    }
    
}

//MARK: - Preview
#if DEBUG
import SwiftUI
struct EndSignUpViewControllerRepresentable: UIViewControllerRepresentable {
    
func updateUIViewController(_ uiView: UIViewController,context: Context) {
        // leave this empty
}
    @available(iOS 13.0.0, *)
    func makeUIViewController(context: Context) -> UIViewController{
        EndSignUpViewController()
    }
}
@available(iOS 13.0, *)
struct EndSignUpViewControllerRepresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            EndSignUpViewControllerRepresentable()
                .ignoresSafeArea()
                .previewDisplayName(/*@START_MENU_TOKEN@*/"Preview"/*@END_MENU_TOKEN@*/)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
        }
        
    }
} #endif
