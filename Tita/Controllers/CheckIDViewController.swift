//
//  CheckIDViewController.swift
//  Tita
//
//  Created by 혜인 on 2022/03/14.
//


import UIKit
import SnapKit
import Then

class CheckIDViewController: UIViewController {
    //MARK: - Properties
    private let descriptionView = SignUpDescriptionView().then {
        $0.dataSetting(description: "Ti-Ta가 아이디를 찾았어요!\n이제 다시 로그인을 시도해 봐요!", additionalDescription: nil)
        $0.previousButton.addTarget(self, action: #selector(tapPrevious(_:)), for: .touchUpInside)
    }
    
    private let checkID = UILabel().then {
        let userName = "OOO"
        let userID = "extita0129"
        
        let str = NSMutableAttributedString(string: "\(userName)님의 아이디는\n\(userID) 입니다.")
        str.setFontForText(textToFind: userID, fontSize: 25, currentFontName: "AppleSDGothicNeo-Bold")
        str.setFontForText(textToFind: "입니다.", fontSize: 25, currentFontName: "AppleSDGothicNeo-Light")
        $0.dynamicFont(fontSize: 22, currentFontName: "AppleSDGothicNeo-Light")
        
        $0.textAlignment = .center
        $0.numberOfLines = 0
        $0.attributedText = str
        
    }
    
    private let findPW = UIButton().then {
        $0.setTitle("혹시 비밀번호도 기억나지 않나요?", for: .normal)
        $0.dynamicFont(fontSize: 11, currentFontName: "AppleSDGothicNeo-Regular")
        $0.setTitleColor(.rgb(red: 219, green: 64, blue: 64), for: .normal)
        $0.addTarget(self, action: #selector(tapFindPW(_:)), for: .touchUpInside)
    }
    
    private let mainButton = LoginButton().then {
        $0.dataSetting(title: "메인으로")
        $0.addTarget(self, action: #selector(tapMainButton(_:)), for: .touchUpInside)
    }

    private var userName: String = ""
    private var userID: String = ""

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    //MARK: - Selectors
    @objc private func tapPrevious(_ sender: UIButton){
        navigationController?.popViewController(animated: true)
        print("previous")
    }
    
    @objc private func tapFindPW(_ sender: UIButton){
        print("find PW")
    }
    
    @objc private func tapMainButton(_ sender: UIButton){
        let nextVC = LoginViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
       print("log in")
    }
    //MARK: - Helpers
    private func configureUI(){
        view.backgroundColor = .white
        addView()
        location()
    }
    
    // MARK: - Add View
    private func addView(){
        [descriptionView, findPW, mainButton, checkID].forEach { view.addSubview($0)}
    }
    
    // MARK: - Location
    private func location(){
        descriptionView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalToSuperview().dividedBy(3.37)
            make.top.equalToSuperview().offset(self.view.frame.height/13.1)
            make.centerX.equalToSuperview()
        }
        
        checkID.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
            
        findPW.snp.makeConstraints { make in
            make.top.equalTo(descriptionView.snp.bottom).offset(self.view.frame.height/2.04)
            make.centerX.equalToSuperview()
        }
        
        mainButton.snp.makeConstraints { make in
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
struct CheckIDViewControllerRepresentable: UIViewControllerRepresentable {
    
func updateUIViewController(_ uiView: UIViewController,context: Context) {
        // leave this empty
}
    @available(iOS 13.0.0, *)
    func makeUIViewController(context: Context) -> UIViewController{
        CheckIDViewController()
    }
}
@available(iOS 13.0, *)
struct CheckIDViewControllerRepresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            CheckIDViewControllerRepresentable()
                .ignoresSafeArea()
                .previewDisplayName(/*@START_MENU_TOKEN@*/"Preview"/*@END_MENU_TOKEN@*/)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
        }
        
    }
} #endif
