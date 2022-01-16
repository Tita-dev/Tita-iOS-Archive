//
//  MainViewController.swift
//  Tita
//
//  Created by 혜인 on 2022/01/10.
//

import UIKit
import SnapKit
import Then

class MainViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    //MARK: - Properties
    private let collectionViewImgList = ["Tita-Cafeteria", "Tita-Edit", "Tita-Globe", "Tita-Pin"]
    private let collectionViewTitleList = ["오늘의 급식", "게시글 쓰러가기", "자유게시판", "공지게시판"]
    private let collectionViewSubTitleList = ["제일 중요한 급식을 보러가요", "당신의 이야기를 학생들과 공유해요", "다양한 이야기를 자유롭게 나눠요", "학교의 다양한 공지를 만나봐요"]
    
    private let topView = MainTopView()
    
    private let whereGoLabel = UILabel().then {
        $0.text = "어디로 갈까요?"
        $0.dynamicFont(fontSize: 20, currentFontName: "AppleSDGothicNeo-Bold")
    }
    
    private let whereGoCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = UIScreen.main.bounds.width/43
        layout.scrollDirection = .horizontal
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.collectionViewLayout = layout
        $0.showsHorizontalScrollIndicator = false
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
        collectionViewSetting()
    }
    
    // MARK: - Add View
    private func addView(){
        [topView, whereGoLabel, whereGoCollectionView].forEach { view.addSubview($0) }
    }
    
    //MARK: - collectionViewSetting
    private func collectionViewSetting() {
        whereGoCollectionView.register(WhereGoCollectionViewCell.self, forCellWithReuseIdentifier:WhereGoCollectionViewCell.identifier)
        whereGoCollectionView.dataSource = self
        whereGoCollectionView.delegate = self
        whereGoCollectionView.contentInset = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = whereGoCollectionView.dequeueReusableCell(withReuseIdentifier: "WhereGoCollectionViewCell", for: indexPath) as! WhereGoCollectionViewCell
        cell.dataSetting(Image: collectionViewImgList[indexPath.row], titleText: collectionViewTitleList[indexPath.row], subTitleText: collectionViewSubTitleList[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.frame.width/2.88, height: view.frame.height/6.25)
    }
    
    // MARK: - Corner Radius
    private func cornerRadius(){
        
    }
    
    // MARK: - Location
    private func location(){
        topView.snp.makeConstraints { make in
            make.height.equalToSuperview().dividedBy(11.28)
            make.width.equalToSuperview()
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        whereGoLabel.snp.makeConstraints { make in
            make.top.equalTo(topView.snp.bottom).offset(self.view.frame.height/35.3)
            make.left.equalToSuperview().offset(self.view.frame.width/26.79)
            
        }
        
        whereGoCollectionView.snp.makeConstraints { make in
            make.height.equalToSuperview().dividedBy(6)
            make.width.equalToSuperview().dividedBy(1.04)
            make.top.equalToSuperview().offset(self.view.frame.height/5.93)
            make.right.equalToSuperview()
        }
        
    }
    
}

//MARK: - Preview
#if DEBUG
import SwiftUI
struct MainViewControllerRepresentable: UIViewControllerRepresentable {
    
func updateUIViewController(_ uiView: UIViewController,context: Context) {
        // leave this empty
}
    @available(iOS 13.0.0, *)
    func makeUIViewController(context: Context) -> UIViewController{
        MainViewController()
    }
}
@available(iOS 13.0, *)
struct MainControllerRepresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            MainViewControllerRepresentable()
                .ignoresSafeArea()
                .previewDisplayName(/*@START_MENU_TOKEN@*/"Preview"/*@END_MENU_TOKEN@*/)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
        }
        
    }
} #endif
