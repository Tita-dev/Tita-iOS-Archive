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
    
    //MARK: - Cell Data Lists
    private let collectionViewImgList = ["Tita-Cafeteria", "Tita-Edit", "Tita-Globe", "Tita-Pin"]
    private let collectionViewTitleList = ["오늘의 급식", "게시글 쓰러가기", "자유게시판", "공지게시판"]
    private let collectionViewSubTitleList = ["제일 중요한 급식을 보러가요", "당신의 이야기를 학생들과 공유해요", "다양한 이야기를 자유롭게 나눠요", "학교의 다양한 공지를 만나봐요"]
    
    private let noticeTableViewTitleList = [String]()
    private let noticeTableViewTextList = [String]()
    private let noticeTableViewWriterList = [String]()
    private let noticeTableViewIconList = [String]()
    
    private let bestTableViewTitleList = [String]()
    private let bestTableViewTextList = ["다들 뭐야?? 나는 일단 취업하기랑 코로나 없어져서 여행가기....", "급식 파업으로 인해 목요일 점심 급식이 제공되지 않습니다. 이점 유의하여 주시기 바랍니다.\n급식 파업으로 인해 목요일 점심 급식이 제공되지 않습니다. 이점 유의하여 주시기 바랍니다.", "고교 익명 커뮤니티 서비스 TITA의 1학년 FE를 모집합니다. 관심이 있는 학생은 디스코드 #3128로 연락주시기 바랍니다. 자세한 사항은 하단의 노션 링크를 참고하여 주시기..."]
    private let bestTableViewWriterList = ["취뽀하자", "익명", "익명"]
    private let bestTableViewIconList = ["Tita-Globe", "Tita-Pin", "Tita-Globe"]
    
    //MARK: - Properties
    private let topView = MainTopView().then {
        $0.bellButton.addTarget(self, action: #selector(tapBellButton(_:)), for: .touchUpInside)
        $0.profileButton.addTarget(self, action: #selector(tapProfileButton(_:)), for: .touchUpInside)
    }
    
    private let menuLabel = UILabel().then {
        $0.text = "어디로 갈까요?"
        $0.dynamicFont(fontSize: 20, currentFontName: "AppleSDGothicNeo-Bold")
    }
    
    private let menuCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = UIScreen.main.bounds.width/43
        layout.scrollDirection = .horizontal
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.collectionViewLayout = layout
        $0.showsHorizontalScrollIndicator = false
    }
    
    private let noticeLabel = NoticeLabelView().then {
        $0.button.addTarget(self, action: #selector(tapNoticeMoreButton(_:)), for: .touchUpInside)
    }
    
    private let noticePostTableView = UITableView().then {
        $0.showsVerticalScrollIndicator = false
        $0.separatorStyle = .none
    }
    
    private let noticeEmptyView = EmptyPostView().then {
        $0.isHidden = true
    }
    
    private let bestLabel = NoticeLabelView().then {
        $0.label.text = "BEST 게시글"
        $0.button.addTarget(self, action: #selector(tapBestMoreButton(_:)), for: .touchUpInside)
    }

    private let bestPostTableView = UITableView().then {
        $0.showsVerticalScrollIndicator = false
        $0.separatorStyle = .none
    }
    
    private let bestEmptyView = EmptyPostView().then {
        $0.noticeText.text = "아직 BEST 게시글이 없어요!"
        $0.isHidden = true
    }
    

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    //MARK: - Selectors
    @objc func tapBellButton(_ sender: UIButton) {
        print("Tap Bell Button")
    }
    
    @objc func tapProfileButton(_ sender: UIButton) {
        print("Tap Profile Button")
    }
    
    @objc func tapNoticeMoreButton(_ sender: UIButton) {
        print("Tap Notice MoreButton")
    }
    
    @objc func tapBestMoreButton(_ sender: UIButton) {
        print("Tap Best MoreButton")
    }
    
    //MARK: - Helpers
    private func configureUI(){
        view.backgroundColor = .white
        addView()
        location()
        collectionViewSetting()
        NoticeTableViewSetting()
    }
    
    // MARK: - Add View
    private func addView(){
        [topView, menuLabel, menuCollectionView, noticeLabel, noticePostTableView, noticeEmptyView, bestLabel, bestPostTableView, bestEmptyView].forEach { view.addSubview($0) }
    }
    
    //MARK: - collectionViewSetting
    private func collectionViewSetting() {
        menuCollectionView.register(MenuCollectionViewCell.self, forCellWithReuseIdentifier:MenuCollectionViewCell.identifier)
        menuCollectionView.dataSource = self
        menuCollectionView.delegate = self
        menuCollectionView.contentInset = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = menuCollectionView.dequeueReusableCell(withReuseIdentifier: "MenuCollectionViewCell", for: indexPath) as! MenuCollectionViewCell
        cell.dataSetting(Image: collectionViewImgList[indexPath.row], titleText: collectionViewTitleList[indexPath.row], subTitleText: collectionViewSubTitleList[indexPath.row])

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.frame.width/2.88, height: view.frame.height/6.25)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0{
            print("오늘의 급식")
            let nextVC = CafeteriaViewController()
            self.navigationController?.pushViewController(nextVC, animated: true)
        }

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
            if noticeTableViewTitleList.isEmpty{
                noticeEmptyView.isHidden = false
                noticeLabel.button.isHidden = true
            }
            return noticeTableViewTitleList.count
        }
        if tableView == bestPostTableView {
            if bestTableViewTitleList.isEmpty{
                bestEmptyView.isHidden = false
                bestLabel.button.isHidden = true
            }
            return bestTableViewTitleList.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MainPostTableViewCell.identifier) as! MainPostTableViewCell
        cell.selectionStyle = .none
        
        if tableView == noticePostTableView {
            cell.dataSetting(postTitle: noticeTableViewTitleList[indexPath.row], postText: noticeTableViewTextList[indexPath.row], postWriter: noticeTableViewWriterList[indexPath.row], postIcon: noticeTableViewIconList[indexPath.row])
        }
        
        if tableView == bestPostTableView {
            cell.dataSetting(postTitle: bestTableViewTitleList[indexPath.row], postText: bestTableViewTextList[indexPath.row], postWriter: bestTableViewWriterList[indexPath.row], postIcon: bestTableViewIconList[indexPath.row])
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.frame.height/10.28
    }
    
    // MARK: - Location
    private func location(){
        topView.snp.makeConstraints { make in
            make.height.equalToSuperview().dividedBy(11.28)
            make.width.equalToSuperview()
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        menuLabel.snp.makeConstraints { make in
            make.top.equalTo(topView.snp.bottom).offset(self.view.frame.height/35.3)
            make.left.equalToSuperview().offset(self.view.frame.width/26.79)
            
        }
        
        menuCollectionView.snp.makeConstraints { make in
            make.height.equalToSuperview().dividedBy(6)
            make.width.equalToSuperview().dividedBy(1.04)
            make.top.equalToSuperview().offset(self.view.frame.height/5.93)
            make.right.equalToSuperview()
        }
        
        noticeLabel.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalToSuperview().dividedBy(29)
            make.top.equalTo(menuCollectionView.snp.bottom).offset(self.view.frame.height/33.83)
            make.centerX.equalToSuperview()
        }
        
        noticePostTableView.snp.makeConstraints { make in
            make.height.equalToSuperview().dividedBy(5.4)
            make.width.equalToSuperview()
            make.top.equalTo(noticeLabel.snp.bottom).offset(self.view.frame.height/50.75)
            make.centerX.equalToSuperview()
        }
        
        noticeEmptyView.snp.makeConstraints { make in
            make.height.equalToSuperview().dividedBy(5.14)
            make.width.equalToSuperview().dividedBy(1.09)
            make.top.equalTo(noticeLabel.label.snp.bottom).offset(self.view.frame.height/101.5)
            make.centerX.equalToSuperview()
        }
        
        bestLabel.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(noticeLabel)
            make.top.equalTo(noticeLabel.snp.bottom).offset(self.view.frame.height/4.34)
        }
        
        bestPostTableView.snp.makeConstraints { make in
            make.height.equalToSuperview().dividedBy(3.6)
            make.width.equalTo(noticePostTableView)
            make.top.equalTo(bestLabel.snp.bottom).offset(self.view.frame.height/50.75)
            make.centerX.equalToSuperview()
        }
        
        bestEmptyView.snp.makeConstraints { make in
            make.height.equalToSuperview().dividedBy(3.41)
            make.width.equalTo(noticeEmptyView)
            make.top.equalTo(bestLabel.label.snp.bottom).offset(self.view.frame.height/101.5)
            make.centerX.equalToSuperview()
        }
    }
    
}
