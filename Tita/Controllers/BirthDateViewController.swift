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
    
    private let descriptionView = SignUpDescriptionView().then {
        $0.dataSetting(description: "당신의 생일은 언제인가요?", additionalDescription: "생일은 공개되지 않아요!")
        $0.previousButton.addTarget(self, action: #selector(tapPrevious(_:)), for: .touchUpInside)
    }
    
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
        [descriptionView, datePickerView, upLine, nextButton].forEach{view.addSubview($0)}
    }
    
    // MARK: - PickerViewSetting
    private func pickerViewSetting(){
        datePickerView.dataSource = self
        datePickerView.delegate = self
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component{
        case 0 :
            return yearList.count
        case 1:
            return monthList.count
        case 2:
            return dateList.count
        default:
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component{
        case 0 :
            return yearList[row]
        case 1:
            return monthList[row]
        case 2:
            return dateList[row]
        default:
            return ""
        }
        
    }

    // MARK: - Location
    private func location(){
        descriptionView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalToSuperview().dividedBy(3.98)
            make.top.equalToSuperview().offset(self.view.frame.height/13.1)
            make.centerX.equalToSuperview()
        }
        
        datePickerView.snp.makeConstraints { make in
            make.width.equalToSuperview().dividedBy(1.5)
            make.height.equalToSuperview().dividedBy(6.01)
            make.center.equalToSuperview()
        }
        
        upLine.snp.makeConstraints { make in
            make.width.equalToSuperview().dividedBy(1.5)
            make.height.equalToSuperview().dividedBy(812)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(self.view.frame.height/2.15)
        }
        
        nextButton.snp.makeConstraints { make in
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
struct BirthDateViewControllerRepresentable: UIViewControllerRepresentable {
    
func updateUIViewController(_ uiView: UIViewController,context: Context) {
        // leave this empty
}
    @available(iOS 13.0.0, *)
    func makeUIViewController(context: Context) -> UIViewController{
        BirthDateViewController()
    }
}
@available(iOS 13.0, *)
struct BirthDateViewControllerRepresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            BirthDateViewControllerRepresentable()
                .ignoresSafeArea()
                .previewDisplayName(/*@START_MENU_TOKEN@*/"Preview"/*@END_MENU_TOKEN@*/)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
        }
        
    }
} #endif
