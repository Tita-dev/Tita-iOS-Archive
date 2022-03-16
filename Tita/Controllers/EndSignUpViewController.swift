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
    private let descriptionView = DescriptionView().then {
        $0.dataSetting(description: "우리만의 공간에 들어갈\n준비가 모두 끝났어요!", additionalDescription: "Ti-Ta는 무분별한 욕설, 비방 등에 대해 제재를 가하고 있습니다.\n커뮤니티 가이드를 지키며 Ti-Ta 이용 부탁드립니다.")
        $0.previousButton.addTarget(self, action: #selector(tapPrevious(_:)), for: .touchUpInside)
    }
    
    private let mainLabel = UILabel().then {
        $0.text = "지금 바로 들어가 볼까요?"
        $0.dynamicFont(fontSize: 11, currentFontName: "AppleSDGothicNeo-Regular")
        $0.textColor = .rgb(red: 57, green: 117, blue: 172)
    }
    
    private let mainButton = LoginButton().then {
        $0.dataSetting(title: "메인으로")
        $0.addTarget(self, action: #selector(tapMainButton(_:)), for: .touchUpInside)
    }
    
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
    
    @objc private func tapMainButton(_ sender: UIButton){
        let nextVC = MainViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
       print("complete sign up")
    }
    
    //MARK: - Helpers
    private func configureUI(){
        view.backgroundColor = .white
        addView()
        location()
    }
    
    // MARK: - Add View
    private func addView(){
        [descriptionView, mainLabel, mainButton].forEach { view.addSubview($0)}
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
        
        mainButton.snp.makeConstraints { make in
            make.width.equalToSuperview().dividedBy(1.15)
            make.height.equalToSuperview().dividedBy(16.24)
            make.bottom.equalToSuperview().inset(self.view.frame.height/25.38)
            make.centerX.equalToSuperview()
        }
    }
    
}
