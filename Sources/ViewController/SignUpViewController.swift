//
//  SignUpViewController.swift
//  SNS
//
//  Created by 김기영 on 2021/11/29.
//  Copyright © 2021 com.AppSoulte. All rights reserved.
//

import UIKit
import SnapKit
import Then
import RxSwift
import RxCocoa

class SignUpViewController: UIViewController {
    
    private let postPage = UILabel().then {
        $0.text = "아이디 및 비밀번호 입력 페이지"
        $0.font = .init(name: Font.regular.rawValue, size: 15)
    }
    
    private let email = AuthView().then {
        $0.eyesBtn.isHidden = true
        $0.txtField.placeholder = "ID or Email"
        $0.view.layer.cornerRadius = 10
        $0.view.backgroundColor = .init(named: Color.textFieldColor.rawValue)
    }
    
    private let requestBtn = UIButton(type: .system).then {
        $0.backgroundColor = .init(named: Color.btnColor.rawValue)
        $0.setTitle("요청", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = .init(name: Font.bold.rawValue, size: 15)
    }
    
    private let num = AuthView().then {
        $0.eyesBtn.isHidden = true
        $0.txtField.placeholder = "인증번호"
        $0.view.backgroundColor = .init(named: Color.textFieldColor.rawValue)
        $0.view.layer.cornerRadius = 10
    }
    
    private let password = AuthView().then {
        $0.txtField.placeholder = "Password"
        $0.view.backgroundColor = .init(named: Color.textFieldColor.rawValue)
        $0.view.layer.cornerRadius = 10
    }
    
    private let passwordLabel = UILabel().then {
        $0.text = "· 영어와 숫자를 조합한 6자 이상 20자 이하로 입력해주세요."
        $0.textColor = .lightGray
        $0.font = .init(name: Font.medium.rawValue, size: 12)
    }
    
    private let checkPw = AuthView().then {
        $0.txtField.placeholder = "비밀번호를 한 번 더 입력해주세요."
        $0.view.backgroundColor = .init(named: Color.textFieldColor.rawValue)
        $0.view.layer.cornerRadius = 10
    }
    
    private let genderLabel = UILabel().then {
        $0.text = "성별"
        $0.textColor = .gray
        $0.font = .init(name: Font.medium.rawValue, size: 12)
    }
    
    private let gender = UISegmentedControl(items: ["남자", "여자"]).then {
        $0.backgroundColor = .init(named: Color.textFieldColor.rawValue)
    }
    
    private let nextBtn = UIButton(type: .system).then {
        $0.setTitle("계속", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .init(named: Color.mainColor.rawValue)
        $0.titleLabel?.font = .init(name: Font.bold.rawValue, size: 20)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    override func viewDidLayoutSubviews() {
        setup()
    }
    
    private func setup() {
        
        nextBtn.layer.cornerRadius = 15
        requestBtn.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        requestBtn.layer.cornerRadius = 15
        requestBtn.layer.masksToBounds = true
        
        [postPage, email, requestBtn, num, password, passwordLabel, checkPw, genderLabel,
         gender, nextBtn].forEach{view.addSubview($0)}
        
        postPage.snp.makeConstraints {
            $0.top.equalToSuperview().offset(100)
            $0.centerX.equalToSuperview()
        }
        
        email.snp.makeConstraints {
            $0.top.equalTo(postPage.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(40)
        }
        
        requestBtn.snp.makeConstraints {
            $0.top.equalTo(email)
            $0.trailing.equalTo(email.snp.trailing)
            $0.bottom.equalTo(email.snp.bottom)
            $0.width.equalTo(70)
        }
        
        num.snp.makeConstraints {
            $0.top.equalTo(email.snp.bottom).offset(50)
            $0.trailing.leading.equalToSuperview().inset(20)
            $0.height.equalTo(40)
        }
        
        password.snp.makeConstraints {
            $0.top.equalTo(num.snp.bottom).offset(50)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(40)
        }
        
        passwordLabel.snp.makeConstraints {
            $0.top.equalTo(password.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
        }
        
        checkPw.snp.makeConstraints {
            $0.top.equalTo(passwordLabel.snp.bottom).offset(25)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        genderLabel.snp.makeConstraints {
            $0.top.equalTo(checkPw.snp.bottom).offset(20)
            $0.leading.equalToSuperview().inset(20)
        }
        
        gender.snp.makeConstraints {
            $0.top.equalTo(genderLabel.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(40)
        }
        
        nextBtn.snp.makeConstraints {
            $0.top.equalTo(gender.snp.bottom).offset(150)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
    }

}
