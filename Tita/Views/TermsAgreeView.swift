//
//  AgreeTermsView.swift
//  Tita
//
//  Created by 혜인 on 2022/02/15.
//

import UIKit

class TermsAgreeView: UIView {
    private let viewBounds = UIScreen.main.bounds
    
    let termsButton = UIButton().then {
        $0.setImage(UIImage(named: "Tita-UncheckedBox"), for: .normal)
    }

    private let termsLabel = UILabel().then {
        $0.dynamicFont(fontSize: 17, currentFontName: "AppleSDGothicNeo-Light")
    }
    
    private let checkingTheTerms = UIButton().then {
        $0.setImage(UIImage(named: "Tita-ChevronDown"), for: .normal)
    }
    
// MARK: - LifeCycles
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
            
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    override func layoutSubviews() {
        super.layoutSubviews()
        configureUI()
    }
        
    // MARK: - Helpers
    private func configureUI(){
        addView()
        location()
    }
        
    // MARK: - addView
    private func addView(){
        [termsLabel, termsButton, checkingTheTerms].forEach { addSubview($0) }
    }
            
    // MARK: - location
    private func location(){
        termsButton.snp.makeConstraints { make in
            make.width.equalTo(viewBounds.width/23.44)
            make.height.equalTo(viewBounds.height/50.75)
            make.top.equalToSuperview()
            make.left.equalToSuperview()
        }
        
        termsLabel.snp.makeConstraints { make in
            make.centerY.equalTo(termsButton)
            make.left.equalTo(termsButton.snp.right).offset(viewBounds.width/53.57)
        }
        
        checkingTheTerms.snp.makeConstraints { make in
            make.width.equalTo(viewBounds.width/13.89)
            make.height.equalTo(viewBounds.height/30.07)
            make.left.equalTo(termsButton.snp.right).offset(viewBounds.width/1.34)
        }
    }
    
    // MARK: - dataSetting
    func dataSetting(termsText: String){
        termsLabel.text = termsText
    }
}
