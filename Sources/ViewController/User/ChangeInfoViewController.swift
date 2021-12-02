//
//  ChangeInfoViewController.swift
//  SNS
//
//  Created by 김기영 on 2021/12/02.
//  Copyright © 2021 com.AppSoulte. All rights reserved.
//

import UIKit

class ChangeInfoViewController: UIViewController {
    
    private let nameLabel = UILabel().then {
        $0.text = "이름"
        $0.font = .init(name: Font.bold.rawValue, size: 14)
    }
    
    private let name = AuthView().then {
        $0.eyesBtn.isHidden = true
        $0.txtField.placeholder = "이름을 입력해주세요."
        $0.view.layer.borderWidth = 0.5
        $0.txtField.font = .init(name: Font.medium.rawValue, size: 10)
        $0.view.layer.cornerRadius = 10
    }
    
    private let emailLabel = UILabel().then {
        $0.text = "이메일"
        $0.font = .init(name: Font.bold.rawValue, size: 14)
    }
    
    private let email = AuthView().then {
        $0.eyesBtn.isHidden = true
        $0.txtField.placeholder = "이메일을 입력해주세요"
        $0.view.layer.borderWidth = 0.5
        $0.txtField.font = .init(name: Font.medium.rawValue, size: 10)
        $0.view.layer.cornerRadius = 10
    }
    
    private let emailBtn = UIButton(type: .system).then {
        $0.setTitle("인증번호 요청", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = .init(name: Font.bold.rawValue, size: 10)
        $0.backgroundColor = .init(named: Color.btnColor.rawValue)
        $0.layer.cornerRadius = 10
    }
    
    private let numLabel = UILabel().then {
        $0.text = "인증번호"
        $0.font = .init(name: Font.bold.rawValue, size: 14)
    }
    
    private let num = AuthView().then {
        $0.eyesBtn.isHidden = true
        $0.txtField.placeholder = "인증번호를 입력해주세요."
        $0.view.layer.borderWidth = 0.5
        $0.txtField.font = .init(name: Font.medium.rawValue, size: 10)
        $0.view.layer.cornerRadius = 10
    }
    
    private let numBtn = UIButton(type: .system).then {
        $0.setTitle("인증번호 재요청", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .init(named: Color.btnColor.rawValue)
        $0.titleLabel?.font = .init(name: Font.bold.rawValue, size: 10)
        $0.layer.cornerRadius = 10
    }
    
    private let errorLabel = UILabel().then {
        $0.text = "인증번호가 일치하지 않습니다."
        $0.textColor = .red
        $0.font = .init(name: Font.medium.rawValue, size: 8)
    }
    
    private let label = UILabel().then {
        $0.text = "· 인증번호를 발송했습니다. (유효시간 3분)\n· 인증번호가 발송되지 않았으면 입력하신 정보가 정확한지 다시 확인해주세요."
        $0.font = .init(name: Font.regular.rawValue, size: 8)
        $0.numberOfLines = 2
        $0.textColor = .gray
    }
    
    private let changeBtn = UIButton(type: .system).then {
        $0.backgroundColor = .init(named: Color.btnColor.rawValue)
        $0.setTitle("변경", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = .init(name: Font.bold.rawValue, size: 18)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    override func viewDidLayoutSubviews() {
       setup()
    }
    
    
    private func setup() {
        [nameLabel, name, emailLabel, email, emailBtn, numLabel, num, numBtn, errorLabel, label,
         changeBtn].forEach{view.addSubview($0)}
        
        nameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(100)
            $0.leading.equalToSuperview().inset(30)
        }
        
        name.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(5)
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.height.equalTo(40)
        }
        
        emailLabel.snp.makeConstraints {
            $0.top.equalTo(name.snp.bottom).offset(40)
            $0.leading.equalToSuperview().inset(30)
        }
        
        email.snp.makeConstraints {
            $0.top.equalTo(emailLabel.snp.bottom).offset(5)
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.height.equalTo(40)
        }
        
        emailBtn.snp.makeConstraints {
            $0.top.equalTo(email.snp.bottom).offset(10)
            $0.leading.equalToSuperview().inset(30)
            $0.height.equalTo(30)
            $0.width.equalTo(80)
        }
        
        numLabel.snp.makeConstraints {
            $0.top.equalTo(emailBtn.snp.bottom).offset(20)
            $0.leading.equalToSuperview().inset(30)
        }
        
        num.snp.makeConstraints {
            $0.top.equalTo(numLabel.snp.bottom).offset(5)
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.height.equalTo(40)
        }
        
        numBtn.snp.makeConstraints {
            $0.top.equalTo(num.snp.bottom).offset(20)
            $0.leading.equalToSuperview().inset(30)
            $0.height.equalTo(30)
            $0.width.equalTo(90)
        }
        
        errorLabel.snp.makeConstraints {
            $0.top.equalTo(numBtn.snp.bottom).offset(3)
            $0.leading.equalToSuperview().inset(30)
        }
        
        label.snp.makeConstraints {
            $0.top.equalTo(errorLabel.snp.bottom).offset(20)
            $0.leading.equalToSuperview().inset(30)
        }
        
        changeBtn.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(0)
            $0.height.equalTo(50)
            $0.bottom.equalToSuperview().inset(50)
    }
}
}
