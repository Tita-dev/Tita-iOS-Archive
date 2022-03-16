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
    private let descriptionView = DescriptionView().then {
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
    
    private let subTermsView1 = TermsAgreeView().then {
        $0.dataSetting(termsText: "서비스 이용약관 동의(필수)")
        $0.termsButton.addTarget(self, action: #selector(tapButton1), for: .touchUpInside)
    }
    
    private let subTermsView2 = TermsAgreeView().then {
        $0.dataSetting(termsText: "개인정보처리방침 동의(필수)")
        $0.termsButton.addTarget(self, action: #selector(tapButton2), for: .touchUpInside)
    }
    
    private let subTermsView3 = TermsAgreeView().then {
        $0.dataSetting(termsText: "커뮤니티이용규칙 동의(필수)")
        $0.termsButton.addTarget(self, action: #selector(tapButton3), for: .touchUpInside)
    }
    
    lazy var stackView = UIStackView(arrangedSubviews: [subTermsView1, subTermsView2, subTermsView3]).then {
        $0.axis = .vertical
        $0.distribution = .fillEqually
        $0.spacing = self.view.frame.height/50.75
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

    @objc private func tapPrevious(_ sender: UIButton){
        navigationController?.popViewController(animated: true)
        print("previous")
    }
    
    @objc private func tapAllButton(_ sender: UIButton){
        if allTermsAgreeButton.isSelected == false {
            allTermsAgreeButton.setImage(UIImage(named: "Tita-CheckedBox"), for: .normal)
            subTermsView1.termsButton.setImage(UIImage(named: "Tita-CheckedBox"), for: .normal)
            subTermsView2.termsButton.setImage(UIImage(named: "Tita-CheckedBox"), for: .normal)
            subTermsView3.termsButton.setImage(UIImage(named: "Tita-CheckedBox"), for: .normal)
            
            allTermsAgreeButton.isSelected = true
            subTermsView1.termsButton.isSelected = true
            subTermsView2.termsButton.isSelected = true
            subTermsView3.termsButton.isSelected = true
            
        } else if allTermsAgreeButton.isSelected == true {
            allTermsAgreeButton.setImage(UIImage(named: "Tita-UncheckedBox"), for: .normal)
            subTermsView1.termsButton.setImage(UIImage(named: "Tita-UncheckedBox"), for: .normal)
            subTermsView2.termsButton.setImage(UIImage(named: "Tita-UncheckedBox"), for: .normal)
            subTermsView3.termsButton.setImage(UIImage(named: "Tita-UncheckedBox"), for: .normal)
            
            allTermsAgreeButton.isSelected = false
            subTermsView1.termsButton.isSelected = false
            subTermsView2.termsButton.isSelected = false
            subTermsView3.termsButton.isSelected = false
        }
    }

    @objc private func tapButton1(){
        if subTermsView1.termsButton.isSelected == false {
            subTermsView1.termsButton.setImage(UIImage(named: "Tita-CheckedBox"), for: .normal)
            subTermsView1.termsButton.isSelected = true
            
            if subTermsView2.termsButton.isSelected == true && subTermsView3.termsButton.isSelected == true {
                allTermsAgreeButton.setImage(UIImage(named: "Tita-CheckedBox"), for: .normal)
                allTermsAgreeButton.isSelected = true
            }
        } else if subTermsView1.termsButton.isSelected == true {
            subTermsView1.termsButton.setImage(UIImage(named: "Tita-UncheckedBox"), for: .normal)
            allTermsAgreeButton.setImage(UIImage(named: "Tita-UncheckedBox"), for: .normal)
            allTermsAgreeButton.isSelected = false
            subTermsView1.termsButton.isSelected = false
        }
    }
    
    @objc private func tapButton2(){
        if subTermsView2.termsButton.isSelected == false {
            subTermsView2.termsButton.setImage(UIImage(named: "Tita-CheckedBox"), for: .normal)
            subTermsView2.termsButton.isSelected = true
            
            if subTermsView1.termsButton.isSelected == true && subTermsView3.termsButton.isSelected == true {
                allTermsAgreeButton.setImage(UIImage(named: "Tita-CheckedBox"), for: .normal)
                allTermsAgreeButton.isSelected = true
            }
        } else if subTermsView2.termsButton.isSelected == true {
            subTermsView2.termsButton.setImage(UIImage(named: "Tita-UncheckedBox"), for: .normal)
            allTermsAgreeButton.setImage(UIImage(named: "Tita-UncheckedBox"), for: .normal)
            allTermsAgreeButton.isSelected = false
            subTermsView2.termsButton.isSelected = false
        }
    }

    @objc private func tapButton3(){
        if subTermsView3.termsButton.isSelected == false {
            subTermsView3.termsButton.setImage(UIImage(named: "Tita-CheckedBox"), for: .normal)
            subTermsView3.termsButton.isSelected = true
            
            if subTermsView1.termsButton.isSelected == true && subTermsView2.termsButton.isSelected == true {
                allTermsAgreeButton.setImage(UIImage(named: "Tita-CheckedBox"), for: .normal)
                allTermsAgreeButton.isSelected = true
            }
        } else if subTermsView3.termsButton.isSelected == true {
            subTermsView3.termsButton.setImage(UIImage(named: "Tita-UncheckedBox"), for: .normal)
            allTermsAgreeButton.setImage(UIImage(named: "Tita-UncheckedBox"), for: .normal)
            allTermsAgreeButton.isSelected = false
            subTermsView3.termsButton.isSelected = false
        }
    }
    
    @objc private func tapNextButton(_ sender: UIButton){
        if allTermsAgreeButton.isSelected == true {
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
        [descriptionView, allTermsAgreeButton, allTermsLabel, line, stackView, nextButton].forEach{ view.addSubview($0)}
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

        stackView.snp.makeConstraints { make in
            make.width.equalToSuperview().dividedBy(1.16)
            make.height.equalToSuperview().dividedBy(7.19)
            make.top.equalToSuperview().offset(self.view.frame.height/2.09)
            make.left.equalTo(allTermsAgreeButton)
        }
        
        nextButton.snp.makeConstraints { make in
            make.width.equalToSuperview().dividedBy(1.15)
            make.height.equalToSuperview().dividedBy(16.24)
            make.bottom.equalToSuperview().inset(self.view.frame.height/25.38)
            make.centerX.equalToSuperview()
        }
    }
    
}
