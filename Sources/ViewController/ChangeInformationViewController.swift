//
//  ChangeInformationViewController.swift
//  SNS
//
//  Created by 김기영 on 2021/12/02.
//  Copyright © 2021 com.AppSoulte. All rights reserved.
//

import UIKit
import SnapKit
import Then

class ChangeInformationViewController: UIViewController {
    
    private let profile = UIImageView().then {
        $0.image = .init(named: "ProfileImg")
        $0.layer.cornerRadius = 40
    }
    
    private let changeImgBtn = UIButton(type: .system).then {
        $0.setTitle("프로필 사진 수정", for: .normal)
        $0.titleLabel?.font = .init(name: Font.bold.rawValue, size: 12)
    }
    
    private let nameView = UIView().then {
        $0.backgroundColor = .white
    }
    
    private let name = UITextField().then {
        $0.placeholder = "별명을 설정해주세요 (최대 10글자)"
    }
    
    private let emailLabel = UILabel().then {
        $0.text = "이메일"
        $0.font = .init(name: Font.regular.rawValue, size: 8)
    }
    
    private let emailView = UIView().then {
        $0.backgroundColor = .white
    }
    
    private let email = UITextField().then {
        $0.placeholder = "이메일을 입력해주세요"
    }
    
    private let modifyBtn = UIButton(type: .system).then {
        $0.setTitle("수정", for: .normal)
        $0.backgroundColor = .init(named: Color.btnColor.rawValue)
        $0.setTitleColor(.white, for: .normal)
        $0.layer.cornerRadius = 10
        $0.titleLabel?.font = .init(name: Font.bold.rawValue, size: 10)
    }
    
    private let passwordBtn = UIButton(type: .system).then {
        $0.setTitle("\t\t비밀번호", for: .normal)
        $0.setTitleColor(.lightGray, for: .normal)
        $0.titleLabel?.font = .init(name: Font.regular.rawValue, size: 13)
        $0.setImage(.init(systemName: "lock"), for: .normal)
        $0.tintColor = .lightGray
        $0.imageEdgeInsets = UIEdgeInsets(top: $0.frame.size.height - 10/2, left: $0.frame.size.width    - 10/2, bottom: $0.frame.size.height - 10/2, right: $0.frame.size.width - 10/2)
    }
    
    private let generalBtn = UIButton(type: .system).then {
        $0.setTitle("설정", for: .normal)
        $0.titleLabel?.font = .init(name: Font.regular.rawValue, size: 13)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    override func viewDidLayoutSubviews() {
        setup()
    }
    
    private func setup() {
        
        nameView.layer.addBorder([.bottom], color: .lightGray, width: 1)
        emailView.layer.addBorder([.bottom], color: .lightGray, width: 1)
        
        [profile, changeImgBtn, nameView, name, emailLabel, emailView, email, modifyBtn, passwordBtn, generalBtn].forEach{view.addSubview($0)}
        
        profile.snp.makeConstraints {
            $0.top.equalToSuperview().inset(100)
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(80)
        }
        
        changeImgBtn.snp.makeConstraints {
            $0.top.equalTo(profile.snp.bottom).offset(15)
            $0.centerX.equalToSuperview()
        }
        
        nameView.snp.makeConstraints {
            $0.top.equalTo(changeImgBtn.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.bottom.equalTo(name.snp.bottom).offset(5)
        }
        
        name.snp.makeConstraints {
            $0.top.equalTo(changeImgBtn.snp.bottom).offset(30)
            $0.leading.trailing.equalToSuperview().inset(30)
        }
        
        emailLabel.snp.makeConstraints {
            $0.top.equalTo(name.snp.bottom).offset(30)
            $0.leading.equalToSuperview().inset(30)
        }
        
        emailView.snp.makeConstraints {
            $0.top.equalTo(name.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.bottom.equalTo(email.snp.bottom).offset(5)
        }
        
        email.snp.makeConstraints {
            $0.top.equalTo(emailLabel.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(30)
        }
        
        modifyBtn.snp.makeConstraints {
            $0.centerY.equalTo(email)
            $0.trailing.equalTo(email.snp.trailing)
            $0.height.equalTo(20)
            $0.width.equalTo(40)
        }
        
        passwordBtn.snp.makeConstraints {
            $0.top.equalTo(email.snp.bottom).offset(40)
            $0.leading.equalToSuperview().inset(30)
        }
        
        generalBtn.snp.makeConstraints {
            $0.top.equalTo(email.snp.bottom).offset(35)
            $0.leading.equalTo(passwordBtn.snp.trailing).offset(20)
        }
    }

}
