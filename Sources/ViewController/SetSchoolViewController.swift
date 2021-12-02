//
//  SetSchoolViewController.swift
//  SNS
//
//  Created by 김기영 on 2021/12/02.
//  Copyright © 2021 com.AppSoulte. All rights reserved.
//

import UIKit
import DropDown
import RxSwift
import RxCocoa

class SetSchoolViewController: UIViewController {
    
    private let disposebag = DisposeBag()

    private let warningLabel = UILabel().then {
        $0.text = "학교 변경 시 1달 간 변경 불가능합니다."
        $0.font = .init(name: Font.bold.rawValue, size: 10)
        $0.textColor = .lightGray
    }
    
    private let schoolLabel = UILabel().then {
        $0.text = "재학중인 학교"
        $0.font = .init(name: Font.bold.rawValue, size: 14)
    }
    
    private let school = AuthView().then {
        $0.eyesBtn.isHidden = true
        $0.view.layer.borderWidth = 0.5
        $0.txtField.font = .init(name: Font.regular.rawValue, size: 10)
        $0.txtField.placeholder = "재학중인 학교를 입력해주세요."
        $0.view.layer.cornerRadius = 10
    }
    
    private let schoolBtn = UIButton(type: .system).then {
        $0.setTitle("수정", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .init(named: Color.btnColor.rawValue)
        $0.titleLabel?.font = .init(name: Font.bold.rawValue, size: 10)
        $0.layer.cornerRadius = 10
    }
    
    private let schoolAddressLabel = UILabel().then {
        $0.text = "재학중인 학교 주소"
        $0.font = .init(name: Font.bold.rawValue, size: 14)
    }
    
    private let schoolAddress = AuthView().then {
        $0.eyesBtn.isHidden = true
        $0.view.layer.borderWidth = 0.5
        $0.txtField.font = .init(name: Font.regular.rawValue, size: 10)
        $0.txtField.placeholder = "재학중인 학교의 주소를 입력해세요"
        $0.view.layer.cornerRadius = 10
    }
    
    private let schoolAddressBtn = UIButton(type: .system).then {
        $0.setTitle("수정", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .init(named: Color.btnColor.rawValue)
        $0.titleLabel?.font = .init(name: Font.bold.rawValue, size: 10)
        $0.layer.cornerRadius = 10
    }
    
    private let gradeBtn = UIButton(type: .system).then {
        $0.setTitle("학년\t", for: .normal)
        $0.setImage(.init(systemName: "arrowtriangle.down.fill",
                          withConfiguration: UIImage.SymbolConfiguration(pointSize: 10,
                                                                         weight: .regular,
                                                                         scale: .small)),
                    for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.tintColor = .black
        $0.semanticContentAttribute = .forceRightToLeft
        $0.layer.borderWidth = 0.5
        $0.layer.cornerRadius = 10
    }
    
    private let classBtn = UIButton(type: .system).then {
        $0.setTitle("반\t", for: .normal)
        $0.setImage(.init(systemName: "arrowtriangle.down.fill",
                          withConfiguration: UIImage.SymbolConfiguration(pointSize: 10,
                                                                         weight: .regular,
                                                                         scale: .small)),
                    for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.tintColor = .black
        $0.semanticContentAttribute = .forceRightToLeft
        $0.layer.borderWidth = 0.5
        $0.layer.cornerRadius = 10
    }
    
    private let numBtn = UIButton(type: .system).then {
        $0.setTitle("번호\t", for: .normal)
        $0.setImage(.init(systemName: "arrowtriangle.down.fill",
                          withConfiguration: UIImage.SymbolConfiguration(pointSize: 10,
                                                                         weight: .regular,
                                                                         scale: .small)),
                    for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.tintColor = .black
        $0.semanticContentAttribute = .forceRightToLeft
        $0.layer.borderWidth = 0.5
        $0.layer.cornerRadius = 10    }
    
    private let modifyBtn = UIButton(type: .system).then {
        $0.setTitle("수정", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .init(named: Color.btnColor.rawValue)
        $0.titleLabel?.font = .init(name: Font.bold.rawValue, size: 10)
        $0.layer.cornerRadius = 10
    }
    
    private let setSchoolBtn = UIButton(type: .system).then {
        $0.setTitle("학교 설정", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .init(named: Color.btnColor.rawValue)
        $0.titleLabel?.font = .init(name: Font.bold.rawValue, size: 18)
    }
    
    private let gradeDrop = DropDown().then {
        $0.width = 70
        $0.dataSource = ["1학년", "2학년", "3학년"]
    }

    private let classDrop = DropDown().then {
        $0.width = 70
        $0.dataSource = ["1반", "2반", "3반", "4반"]
    }
    
    private let numDrop = DropDown().then {
        $0.width = 70
        $0.dataSource = ["1번", "2번", "3번", "4번", "5번", "6번", "7번", "8번", "9번", "10번",
        "11번", "12번", "13번", "14번", "15번", "16번", "17번", "18번", "19번", "20번"]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        gradeBtn.rx.tap.subscribe{ _ in
            self.gradeDrop.show()
        }.disposed(by: disposebag)
        
        classBtn.rx.tap.subscribe{ _ in
            self.classDrop.show()
        }.disposed(by: disposebag)
        
        numBtn.rx.tap.subscribe{ _ in
            self.numDrop.show()
        }.disposed(by: disposebag)
    }
    
    override func viewDidLayoutSubviews() {
        setup()
    }
    
    private func setup() {
        
        gradeDrop.anchorView = gradeBtn
        classDrop.anchorView = classBtn
        numDrop.anchorView = numBtn
        
        [gradeDrop, classDrop, numDrop].forEach{
            $0.bottomOffset = CGPoint(x: 0, y:($0.anchorView?.plainView.bounds.height)!)}
        
        [gradeBtn, classBtn, numBtn].forEach{
            $0.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        }
        
        [warningLabel, schoolLabel, school, schoolBtn, schoolAddressLabel, schoolAddress,
         schoolAddressBtn, gradeBtn, classBtn, numBtn, modifyBtn, setSchoolBtn]
            .forEach{view.addSubview($0)}
        
        warningLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(100)
            $0.centerX.equalToSuperview()
        }
        
        schoolLabel.snp.makeConstraints {
            $0.top.equalTo(warningLabel.snp.bottom).offset(40)
            $0.leading.equalToSuperview().inset(30)
        }
        
        school.snp.makeConstraints {
            $0.top.equalTo(schoolLabel.snp.bottom).offset(8)
            $0.leading.equalToSuperview().inset(30)
            $0.trailing.equalToSuperview().inset(80)
            $0.height.equalTo(40)
        }
        
        schoolBtn.snp.makeConstraints {
            $0.centerY.equalTo(school)
            $0.leading.equalTo(school.snp.trailing).offset(20)
            $0.width.equalTo(40)
            $0.height.equalTo(20)
        }
        
        schoolAddressLabel.snp.makeConstraints {
            $0.top.equalTo(schoolBtn.snp.bottom).offset(30)
            $0.leading.equalToSuperview().inset(30)
        }
        
        schoolAddress.snp.makeConstraints {
            $0.top.equalTo(schoolAddressLabel.snp.bottom).offset(8)
            $0.leading.equalToSuperview().inset(30)
            $0.trailing.equalToSuperview().inset(80)
            $0.height.equalTo(40)
        }
        
        schoolAddressBtn.snp.makeConstraints {
            $0.centerY.equalTo(schoolAddress)
            $0.leading.equalTo(schoolAddress.snp.trailing).offset(20)
            $0.width.equalTo(40)
            $0.height.equalTo(20)
        }
        
        gradeBtn.snp.makeConstraints {
            $0.top.equalTo(schoolAddress.snp.bottom).offset(30)
            $0.leading.equalToSuperview().inset(30)
            $0.width.equalTo(70)
            $0.height.equalTo(30)
        }
        
        classBtn.snp.makeConstraints {
            $0.top.equalTo(gradeBtn.snp.top)
            $0.leading.equalTo(gradeBtn.snp.trailing).offset(30)
            $0.width.equalTo(70)
            $0.height.equalTo(30)
        }
        
        numBtn.snp.makeConstraints {
            $0.top.equalTo(classBtn.snp.top)
            $0.leading.equalTo(classBtn.snp.trailing).offset(30)
            $0.width.equalTo(70)
            $0.height.equalTo(30)
        }
        
        modifyBtn.snp.makeConstraints {
            $0.centerY.equalTo(numBtn)
            $0.leading.equalTo(numBtn.snp.trailing).offset(30)
            $0.width.equalTo(40)
            $0.height.equalTo(20)
        }
        
        setSchoolBtn.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().inset(50)
            $0.height.equalTo(50)
        }
    }
    
}
