//
//  BirthDateViewController.swift
//  Tita
//
//  Created by 혜인 on 2022/01/28.
//

import UIKit
import SnapKit
import Then

class BirthDateViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    
    //MARK: - Properties
    let yearList = ["2003", "2004", "2005"]
    let monthList = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"]
    let dateList = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31"]
    
    private let descriptionView = DescriptionView().then {
        $0.dataSetting(description: "당신의 생일은 언제인가요?", additionalDescription: "생일은 공개되지 않아요!")
        $0.previousButton.addTarget(self, action: #selector(tapPrevious(_:)), for: .touchUpInside)
    }
    
    private let yearPickerView = UIPickerView()
    private let monthPickerView = UIPickerView()
    private let datePickerView = UIPickerView()
    
    private let upLine = LineView()
    private let underLine = LineView()
            
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
    
    @objc private func tapNextButton(_ sender: UIButton){
        print("next")
        let nextVC = SignUpIDViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    //MARK: - Helpers
    private func configureUI(){
        view.backgroundColor = .white
        addView()
        location()
        pickerViewSetting()
    }
    
    // MARK: - Add View
    private func addView(){
        [descriptionView,yearPickerView, monthPickerView, datePickerView, upLine, underLine, nextButton].forEach{view.addSubview($0)}
    }
    
    // MARK: - PickerViewSetting
    private func pickerViewSetting(){
        yearPickerView.dataSource = self
        yearPickerView.delegate = self
        
        monthPickerView.dataSource = self
        monthPickerView.delegate = self
        
        datePickerView.dataSource = self
        datePickerView.delegate = self
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView{
        case yearPickerView :
            return yearList.count
        case monthPickerView:
            return monthList.count
        case datePickerView:
            return dateList.count
        default:
            return 0
        }
    }

    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return self.view.frame.height/14.68
    }

    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return self.view.frame.width/4.5
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        pickerView.subviews.forEach {
            $0.backgroundColor = .clear
        }
   
        let numberLabel = UILabel()
        numberLabel.textAlignment = .center
        numberLabel.dynamicFont(fontSize: 18, currentFontName: "AppleSDGothicNeo-Bold")
        
        switch pickerView{
        case yearPickerView:
            numberLabel.text = "\(yearList[row])"
        case monthPickerView:
            numberLabel.text = "\(monthList[row])"
        case datePickerView:
            numberLabel.text = "\(dateList[row])"
        default:
            numberLabel.text = ""
        }
        return numberLabel
    }
    
    // 선택된 달에 따른 행 개수 변경

    // MARK: - Location
    private func location(){
        descriptionView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalToSuperview().dividedBy(3.98)
            make.top.equalToSuperview().offset(self.view.frame.height/13.1)
            make.centerX.equalToSuperview()
        }
        
        yearPickerView.snp.makeConstraints { make in
            make.width.equalToSuperview().dividedBy(4.98)
            make.height.equalToSuperview().dividedBy(6.01)
            make.left.equalToSuperview().offset(self.view.frame.width/6.06)
            make.centerY.equalToSuperview()
        }
        
        monthPickerView.snp.makeConstraints { make in
            make.width.height.equalTo(yearPickerView)
            make.center.equalToSuperview()
        }
        
        datePickerView.snp.makeConstraints { make in
            make.width.height.centerY.equalTo(yearPickerView)
            make.right.equalToSuperview().inset(self.view.frame.width/6.06)
        }
        
        upLine.snp.makeConstraints { make in
            make.width.equalToSuperview().dividedBy(1.5)
            make.height.equalToSuperview().dividedBy(812)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(self.view.frame.height/2.15)
        }
        
        underLine.snp.makeConstraints { make in
            make.width.equalToSuperview().dividedBy(1.5)
            make.height.equalToSuperview().dividedBy(812)
            make.centerX.equalToSuperview()
            make.top.equalTo(upLine.snp.bottom).offset(self.view.frame.height/14.68)
        }
        
        nextButton.snp.makeConstraints { make in
            make.width.equalToSuperview().dividedBy(1.15)
            make.height.equalToSuperview().dividedBy(16.24)
            make.bottom.equalToSuperview().inset(self.view.frame.height/25.38)
            make.centerX.equalToSuperview()
        }
    }
    
}
