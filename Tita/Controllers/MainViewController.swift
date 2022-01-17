//
//  MainViewController.swift
//  Tita
//
//  Created by 혜인 on 2022/01/10.
//

import UIKit
import SnapKit
import Then

class MainViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UITableViewDelegate, UITableViewDataSource {
    
    //MARK: - Properties
    private let collectionViewImgList = ["Tita-Cafeteria", "Tita-Edit", "Tita-Globe", "Tita-Pin"]
    private let collectionViewTitleList = ["오늘의 급식", "게시글 쓰러가기", "자유게시판", "공지게시판"]
    private let collectionViewSubTitleList = ["제일 중요한 급식을 보러가요", "당신의 이야기를 학생들과 공유해요", "다양한 이야기를 자유롭게 나눠요", "학교의 다양한 공지를 만나봐요"]
    
    private let tableViewTitleList = ["2022년 새해 소원", "12월 30일 급식 공지사항", "TITA 1학년 FE를 모집합니다"]
    private let tableViewTextList = ["다들 뭐야?? 나는 일단 취업하기랑 코로나 없어져서 여행가기....", "급식 파업으로 인해 목요일 점심 급식이 제공되지 않습니다. 이점 유의하여 주시기 바랍니다.\n급식 파업으로 인해 목요일 점심 급식이 제공되지 않습니다. 이점 유의하여 주시기 바랍니다.", "고교 익명 커뮤니티 서비스 TITA의 1학년 FE를 모집합니다. 관심이 있는 학생은 디스코드 #3128로 연락주시기 바랍니다. 자세한 사항은 하단의 노션 링크를 참고하여 주시기..."]
    private let tableViewWriterList = ["취뽀하자", "익명", "익명"]
    private let tableViewIconList = ["Tita-Globe", "Tita-Pin", "Tita-Globe"]
    
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
    
    private let noticeLabel = NoticeLabelView()
    
    private let bestLabel = NoticeLabelView().then {
        $0.label.text = "BEST 게시글"
    }
    
    private let noticePostTableView = UITableView()
    
    private let bestPostTableView = UITableView()

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
        NoticeTableViewSetting()
    }
    
    // MARK: - Add View
    private func addView(){
        [topView, whereGoLabel, whereGoCollectionView, noticeLabel, noticePostTableView, bestLabel, bestPostTableView].forEach { view.addSubview($0) }
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
    
    //MARK: - TableViewSetting
    private func NoticeTableViewSetting(){
        noticePostTableView.dataSource = self
        noticePostTableView.delegate = self
        noticePostTableView.register(MainPostTableViewCell.self, forCellReuseIdentifier: MainPostTableViewCell.identifier)
        
        bestPostTableView.dataSource = self
        bestPostTableView.delegate = self
        bestPostTableView.register(MainPostTableViewCell.self, forCellReuseIdentifier: MainPostTableViewCell.identifier)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == noticePostTableView {
            return 2
        }
        if tableView == bestPostTableView {
            return 3
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MainPostTableViewCell.identifier) as! MainPostTableViewCell
        cell.selectionStyle = .none
        
        if tableView == bestPostTableView {
            cell.dataSetting(postTitle: tableViewTitleList[indexPath.row], postText: tableViewTextList[indexPath.row], postWriter: tableViewWriterList[indexPath.row], postIcon: tableViewIconList[indexPath.row])
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.frame.height/12.4
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
        
        noticeLabel.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalToSuperview().dividedBy(29)
            make.top.equalTo(whereGoCollectionView.snp.bottom).offset(self.view.frame.height/33.83)
            make.centerX.equalToSuperview()
        }
        
        noticePostTableView.snp.makeConstraints { make in
            make.height.equalToSuperview().dividedBy(5.64)
            make.width.equalToSuperview()
            make.top.equalTo(noticeLabel.snp.bottom).offset(self.view.frame.height/50.75)
            make.centerX.equalToSuperview()
        }
        
        bestLabel.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(noticeLabel)
            make.top.equalTo(noticeLabel.snp.bottom).offset(self.view.frame.height/4.34)
        }
        
        bestPostTableView.snp.makeConstraints { make in
            make.height.equalToSuperview().dividedBy(3.64)
            make.width.equalTo(noticePostTableView)
            make.top.equalTo(bestLabel.snp.bottom).offset(self.view.frame.height/50.75)
            make.centerX.equalToSuperview()
        }


//        noticePost.snp.makeConstraints { make in
//            make.height.equalToSuperview().dividedBy(5.14)
//            make.width.equalToSuperview().dividedBy(1.09)
//            make.top.equalTo(noticeLabel.snp.bottom).offset(self.view.frame.height/101.5)
//            make.centerX.equalToSuperview()
//        }
        
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
