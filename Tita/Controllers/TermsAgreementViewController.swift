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
    private let descriptionView = SignUpDescriptionView().then {
        $0.previousButton.addTarget(self, action: #selector(tapPrevious(_:)), for: .touchUpInside)
    }
    
    private let allTermsAgreeButton = UIButton().then {
        $0.setImage(UIImage(named: "Tita-UncheckedBox"), for: .normal)
        $0.addTarget(self, action: #selector(tapAllButton(_:)), for: .touchUpInside)
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
        $0.addTarget(self, action: #selector(tapButton1), for: .touchUpInside)
    }
    
    private let subTermsLabel1 = UILabel().then {
        $0.text = "서비스 이용약관 동의(필수)"
        $0.dynamicFont(fontSize: 17, currentFontName: "AppleSDGothicNeo-Light")
    }
    
    private let subTermsButton2 = UIButton().then {
        $0.setImage(UIImage(named: "Tita-UncheckedBox"), for: .normal)
        $0.addTarget(self, action: #selector(tapButton2), for: .touchUpInside)
    }
    
    private let subTermsLabel2 = UILabel().then {
        $0.text = "개인정보처리방침 동의(필수)"
        $0.dynamicFont(fontSize: 17, currentFontName: "AppleSDGothicNeo-Light")
    }
    
    private let subTermsButton3 = UIButton().then {
        $0.setImage(UIImage(named: "Tita-UncheckedBox"), for: .normal)
        $0.addTarget(self, action: #selector(tapButton3), for: .touchUpInside)
    }
    
    private let subTermsLabel3 = UILabel().then {
        $0.text = "커뮤니티이용규칙 동의(필수)"
        $0.dynamicFont(fontSize: 17, currentFontName: "AppleSDGothicNeo-Light")
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
    
    lazy var allFlag = false
    lazy var flag1 = false
    lazy var flag2 = false
    lazy var flag3 = false
    
    @objc private func tapPrevious(_ sender: UIButton){
        navigationController?.popViewController(animated: true)
        print("previous")
    }
    
    @objc private func tapAllButton(_ sender: UIButton){
        if allFlag == false {
            allTermsAgreeButton.setImage(UIImage(named: "Tita-CheckedBox"), for: .normal)
            subTermsButton1.setImage(UIImage(named: "Tita-CheckedBox"), for: .normal)
            subTermsButton2.setImage(UIImage(named: "Tita-CheckedBox"), for: .normal)
            subTermsButton3.setImage(UIImage(named: "Tita-CheckedBox"), for: .normal)
            flag1 = true
            flag2 = true
            flag3 = true
            allFlag = true
        } else if allFlag == true {
            allTermsAgreeButton.setImage(UIImage(named: "Tita-UncheckedBox"), for: .normal)
            subTermsButton1.setImage(UIImage(named: "Tita-UncheckedBox"), for: .normal)
            subTermsButton2.setImage(UIImage(named: "Tita-UncheckedBox"), for: .normal)
            subTermsButton3.setImage(UIImage(named: "Tita-UncheckedBox"), for: .normal)
            flag1 = false
            flag2 = false
            flag3 = false
            allFlag = false
        }
    }
    
    @objc private func tapButton1(){
        if flag1 == false {
            subTermsButton1.setImage(UIImage(named: "Tita-CheckedBox"), for: .normal)
            flag1 = true
            if flag2 == true && flag3 == true {
                allTermsAgreeButton.setImage(UIImage(named: "Tita-CheckedBox"), for: .normal)
                allFlag = true
            }
        } else if flag1 == true {
            subTermsButton1.setImage(UIImage(named: "Tita-UncheckedBox"), for: .normal)
            allTermsAgreeButton.setImage(UIImage(named: "Tita-UncheckedBox"), for: .normal)
            allFlag = false
            flag1 = false
        }
    }
    
    @objc private func tapButton2(){
        if flag2 == false {
            subTermsButton2.setImage(UIImage(named: "Tita-CheckedBox"), for: .normal)
            flag2 = true
            if flag1 == true && flag3 == true {
                allTermsAgreeButton.setImage(UIImage(named: "Tita-CheckedBox"), for: .normal)
                allFlag = true
            }
        } else if flag2 == true {
            subTermsButton2.setImage(UIImage(named: "Tita-UncheckedBox"), for: .normal)
            allTermsAgreeButton.setImage(UIImage(named: "Tita-UncheckedBox"), for: .normal)
            allFlag = false
            flag2 = false
        }
    }
    
    @objc private func tapButton3(){
        if flag3 == false {
            subTermsButton3.setImage(UIImage(named: "Tita-CheckedBox"), for: .normal)
            flag3 = true
            if flag1 == true && flag2 == true {
                allTermsAgreeButton.setImage(UIImage(named: "Tita-CheckedBox"), for: .normal)
                allFlag = true
            }
        } else if flag3 == true {
            subTermsButton3.setImage(UIImage(named: "Tita-UncheckedBox"), for: .normal)
            allTermsAgreeButton.setImage(UIImage(named: "Tita-UncheckedBox"), for: .normal)
            allFlag = false
            flag3 = false
        }
    }
    
    @objc private func tapNextButton(_ sender: UIButton){
        if allFlag == true {
            print("next")
            let nextVC = BirthDateViewController()
            self.navigationController?.pushViewController(nextVC, animated: true)
        }else{
            print("fail")
        }
    }
    
    //MARK: - Helpers
    private func configureUI(){
        view.backgroundColor = .white
        addView()
        location()
    }
    
    // MARK: - Add View
    private func addView(){
        [descriptionView, allTermsAgreeButton, allTermsLabel, line, subTermsButton1, subTermsLabel1, subTermsButton2, subTermsLabel2, subTermsButton3, subTermsLabel3, nextButton].forEach{ view.addSubview($0)}
    }
    
    // MARK: - Location
    private func location(){
        descriptionView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalToSuperview().dividedBy(3.98)
            make.top.equalToSuperview().offset(self.view.frame.height/13.1)
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
        
        nextButton.snp.makeConstraints { make in
            make.width.equalToSuperview().dividedBy(1.15)
            make.height.equalToSuperview().dividedBy(16.24)
            make.bottom.equalToSuperview().inset(self.view.frame.height/25.38)
            make.centerX.equalToSuperview()
        }

    }
    
}
