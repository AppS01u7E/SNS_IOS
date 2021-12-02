//
//  SetInformationViewController.swift
//  SNS
//
//  Created by 김기영 on 2021/11/29.
//  Copyright © 2021 com.AppSoulte. All rights reserved.
//

import UIKit

class SetInformationViewController: UIViewController {
    
    private let setInformation = UILabel().then {
        $0.text = "개인 정보 입력 페이지"
    }
    
    private let profile = UIImageView().then {
        $0.image = .init(named: "ProfileImg")
    }

    private let birth = AuthView().then {
        $0.view.backgroundColor = .init(named: Color.textFieldColor.rawValue)
        $0.view.layer.cornerRadius = 10
        $0.txtField.placeholder = "생년월일 Ex) xxxx-xx-xx"
        $0.eyesBtn.isHidden = true
    }
    
    private let name = AuthView().then {
        $0.view.backgroundColor = .init(named: Color.textFieldColor.rawValue)
        $0.view.layer.cornerRadius = 10
        $0.txtField.placeholder = "이름"
        $0.eyesBtn.isHidden = true
    }
    
    private let nick = AuthView().then {
        $0.view.backgroundColor = .init(named: Color.textFieldColor.rawValue)
        $0.view.layer.cornerRadius = 10
        $0.txtField.placeholder = "닉네임"
        $0.eyesBtn.isHidden = true
    }
    
    private let nickLabel = UILabel().then {
        $0.text = "· 10자 이내로 입력해주세요"
        $0.font = .systemFont(ofSize: 12)
    }
    
    private let grade = AuthView().then {
        $0.view.backgroundColor = .init(named: Color.textFieldColor.rawValue)
        $0.view.layer.cornerRadius = 10
        $0.txtField.placeholder = "학년"
        $0.eyesBtn.isHidden = true
    }
    
    private let classNum = AuthView().then {
        $0.view.backgroundColor = .init(named: Color.textFieldColor.rawValue)
        $0.view.layer.cornerRadius = 10
        $0.txtField.placeholder = "반"
        $0.eyesBtn.isHidden = true
    }
    
    private let num = AuthView().then {
        $0.view.backgroundColor = .init(named: Color.textFieldColor.rawValue)
        $0.view.layer.cornerRadius = 10
        $0.txtField.placeholder = "번호"
        $0.eyesBtn.isHidden = true
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
        nextBtn.layer.cornerRadius = 20
        profile.layer.cornerRadius = 50
        [setInformation, profile, birth, name, nick, nickLabel, grade, classNum,
         num, nextBtn].forEach{view.addSubview($0)}
        
        setInformation.snp.makeConstraints {
            $0.top.equalToSuperview().offset(100)
            $0.centerX.equalToSuperview()
        }
        
        profile.snp.makeConstraints {
            $0.top.equalTo(setInformation.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(100)
        }
        
        birth.snp.makeConstraints {
            $0.top.equalTo(profile.snp.bottom).offset(50)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(40)
        }
        
        name.snp.makeConstraints {
            $0.top.equalTo(birth.snp.bottom).offset(50)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(40)
        }
        
        nick.snp.makeConstraints {
            $0.top.equalTo(name.snp.bottom).offset(50)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(40)
        }
        
        nickLabel.snp.makeConstraints {
            $0.top.equalTo(nick.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(20)
        }
        
        grade.snp.makeConstraints {
            $0.top.equalTo(nickLabel.snp.bottom).offset(25)
            $0.leading.equalToSuperview().inset(50)
            $0.height.equalTo(40)
            $0.width.equalTo(70)
        }
        
        classNum.snp.makeConstraints {
            $0.centerY.equalTo(grade)
            $0.leading.equalTo(grade.snp.trailing).offset(40)
            $0.height.equalTo(40)
            $0.width.equalTo(70)
        }
        
        num.snp.makeConstraints {
            $0.centerY.equalTo(grade)
            $0.leading.equalTo(classNum.snp.trailing).offset(40)
            $0.height.equalTo(40)
            $0.width.equalTo(70)
        }
        
        nextBtn.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(50)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
    }

}
