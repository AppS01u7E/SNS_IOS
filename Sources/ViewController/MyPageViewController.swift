//
//  MyPageViewController.swift
//  SNS
//
//  Created by 김기영 on 2021/12/01.
//  Copyright © 2021 com.AppSoulte. All rights reserved.
//

import UIKit
import SocketIO

class MyPageViewController: UIViewController {
    
    private let profile = UIImageView().then {
        $0.image = .init(named: "ProfileImg")
    }
    
    private let name = UILabel().then {
        $0.text = "장석연"
        $0.font = .init(name: Font.bold.rawValue, size: 13)
    }
    
    private let position = UILabel().then {
        $0.text = "학생"
        $0.layer.cornerRadius = 8
        $0.textAlignment = .center
        $0.backgroundColor = .init(named: Color.btnColor.rawValue)
        $0.textColor = .white
        $0.font = .init(name: Font.bold.rawValue, size: 10)
    }
    
    private let school = UILabel().then {
        $0.text = "대덕소프트웨어마이스터고등학교"
        $0.font = .init(name: Font.bold.rawValue, size: 12)
    }
    
    private let classLabel = UILabel().then {
        $0.text = "1학년 3반"
        $0.font = .init(name: Font.bold.rawValue, size: 12)
    }
    
    private let accountView = UIView().then {
        $0.backgroundColor = .white
    }
    
    private let accountBtn = UIButton(type: .system).then {
        $0.setTitle("  계정 설정\t\t\t\t\t\t\t\t\t", for: .normal)
        $0.setTitleColor(.gray, for: .normal)
        $0.titleLabel?.font = .init(name: Font.bold.rawValue, size: 17)
        $0.contentHorizontalAlignment = .left
        $0.setImage(.init(systemName: "chevron.right"), for: .normal)
        $0.tintColor = .gray
        $0.semanticContentAttribute = .forceRightToLeft
    }
    
    private let schoolView = UIView().then {
        $0.backgroundColor = .white
    }
    
    private let schoolBtn = UIButton(type: .system).then {
        $0.setTitle("  학교 설정\t\t\t\t\t\t\t\t\t", for: .normal)
        $0.setTitleColor(.gray, for: .normal)
        $0.titleLabel?.font = .init(name: Font.bold.rawValue, size: 17)
        $0.contentHorizontalAlignment = .left
        $0.setImage(.init(systemName: "chevron.right"), for: .normal)
        $0.tintColor = .gray
        $0.semanticContentAttribute = .forceRightToLeft
    }
    
    private let notificationView = UIView().then {
        $0.backgroundColor = .white
    }
    
    private let notificationBtn = UIButton(type: .system).then {
        $0.setTitle("  알림 설정\t\t\t\t\t\t\t\t\t", for: .normal)
        $0.setTitleColor(.gray, for: .normal)
        $0.titleLabel?.font = .init(name: Font.bold.rawValue, size: 17)
        $0.contentHorizontalAlignment = .left
        $0.setImage(.init(systemName: "chevron.right"), for: .normal)
        $0.tintColor = .gray
        $0.semanticContentAttribute = .forceRightToLeft
    }
    
    private let logoutView = UIView().then {
        $0.backgroundColor = .white
    }
    
    private let logoutBtn = UIButton(type: .system).then {
        $0.setTitle("  계정 설정\t\t\t\t\t\t\t\t\t", for: .normal)
        $0.setTitleColor(.red, for: .normal)
        $0.titleLabel?.font = .init(name: Font.bold.rawValue, size: 17)
        $0.contentHorizontalAlignment = .left
        $0.setImage(.init(systemName: "chevron.right"), for: .normal)
        $0.tintColor = .gray
        $0.semanticContentAttribute = .forceRightToLeft
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    override func viewDidLayoutSubviews() {
        setup()
    }
    
    private func setup() {
        
        position.clipsToBounds = true
        
        [accountView, schoolView, notificationView, logoutView].forEach{$0.addShadow(location: .bottom)}
        [accountView, schoolView, notificationView, logoutView].forEach{$0.layer.cornerRadius = 15}
        
        [profile, name, position, school, classLabel, accountView, accountBtn, schoolView, schoolBtn, notificationView, notificationBtn, logoutView, logoutBtn].forEach{view.addSubview($0)}
        
        profile.snp.makeConstraints {
            $0.top.equalToSuperview().inset(100)
            $0.leading.equalToSuperview().inset(30)
            $0.width.height.equalTo(60)
        }
        
        name.snp.makeConstraints {
            $0.top.equalTo(profile)
            $0.leading.equalTo(profile.snp.trailing).offset(7)
        }
        
        position.snp.makeConstraints {
            $0.top.equalTo(profile)
            $0.leading.equalTo(name.snp.trailing).offset(10)
            $0.width.equalTo(35)
        }
        
        school.snp.makeConstraints {
            $0.centerY.equalTo(profile)
            $0.leading.equalTo(name.snp.leading)
        }
        
        classLabel.snp.makeConstraints {
            $0.top.equalTo(school.snp.bottom).offset(10)
            $0.leading.equalTo(name.snp.leading)
        }
        
        accountView.snp.makeConstraints {
            $0.top.equalTo(classLabel.snp.bottom).offset(60)
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.height.equalTo(50)
        }
        
        accountBtn.snp.makeConstraints {
            $0.top.equalTo(classLabel.snp.bottom).offset(60)
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.height.equalTo(50)
        }
        
        schoolView.snp.makeConstraints {
            $0.top.equalTo(accountBtn.snp.bottom).offset(30)
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.height.equalTo(50)
        }
        
        schoolBtn.snp.makeConstraints {
            $0.top.equalTo(accountBtn.snp.bottom).offset(30)
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.height.equalTo(40)
        }
        
        notificationView.snp.makeConstraints {
            $0.top.equalTo(schoolBtn.snp.bottom).offset(30)
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.height.equalTo(50)
        }
        
        notificationBtn.snp.makeConstraints {
            $0.top.equalTo(schoolBtn.snp.bottom).offset(30)
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.height.equalTo(50)
        }
        
        logoutView.snp.makeConstraints {
            $0.top.equalTo(notificationBtn.snp.bottom).offset(30)
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.height.equalTo(50)
        }
        
        logoutBtn.snp.makeConstraints {
            $0.top.equalTo(notificationBtn.snp.bottom).offset(30)
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.height.equalTo(50)
        }
    }

}
