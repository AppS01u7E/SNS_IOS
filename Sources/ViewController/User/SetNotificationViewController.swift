//
//  SetNotificationViewController.swift
//  SNS
//
//  Created by 김기영 on 2021/12/02.
//  Copyright © 2021 com.AppSoulte. All rights reserved.
//

import UIKit
import DropDown
import RxSwift
import RxCocoa

class SetNotificationViewController: UIViewController {
    
    private let disposebag = DisposeBag()
    
    private let notificationLabel = UILabel().then {
        $0.text = "알림"
        $0.font = .init(name: Font.regular.rawValue, size: 10)
    }
    
    private let controlNoti = NotificationView().then {
        $0.label.text = "알림 켜기"
    }
    
    private let notiTimer = NotificationView().then {
        $0.label.text = "알림 타이머"
        $0.controlSwitch.isHidden = true
    }
    
    private let timer = UIButton(type: .system).then {
        $0.layer.borderWidth = 0.5
        $0.tintColor = .lightGray
        $0.layer.borderColor = UIColor.lightGray.cgColor
        $0.setImage(.init(systemName: "arrowtriangle.down.fill",
                          withConfiguration: UIImage.SymbolConfiguration(pointSize: 10,
                                                                         weight: .regular,
                                                                         scale: .small)),
                    for: .normal)
    }
    
    private let soomLabel = UILabel().then {
        $0.text = "SOOM 알림"
        $0.font = .init(name: Font.regular.rawValue, size: 10)
    }
    
    private let teachNoti = NotificationView().then {
        $0.label.text = "선생님 공지 알림"
    }
    
    private let commentNoti = NotificationView().then {
        $0.label.text = "댓글알림"
    }
    
    private let commentNoti2 = NotificationView().then {
        $0.label.text = "대댓글알림"
    }
    
    private let newPostNoti = NotificationView().then {
        $0.label.text = "새 글 알림"
    }
    
    private let chatLabel = UILabel().then {
        $0.text = "Chat 알림"
        $0.font = .init(name: Font.regular.rawValue, size: 10)
    }
    
    private let chatNoti = NotificationView().then {
        $0.label.text = "전체 채팅 알림"
    }
    
    private let timeDrop = DropDown().then {
        $0.width = 120
        $0.dataSource = ["5분", "10분", "30분", "1시간", "6시간", "12시간", "24시간", "다시 켤 때까지"]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        timer.rx.tap.subscribe{ _ in
            self.timeDrop.show()
        }.disposed(by: disposebag)
    }
    
    override func viewDidLayoutSubviews() {
        setup()
    }
    
    private func setup() {
        
        timeDrop.anchorView = timer
        timeDrop.bottomOffset = CGPoint(x: 0, y:(timeDrop.anchorView?.plainView.bounds.height)!)
        
        [notificationLabel, controlNoti, notiTimer, timer, soomLabel, teachNoti, commentNoti,
         commentNoti2, newPostNoti, chatLabel, chatNoti].forEach{view.addSubview($0)}
        
        notificationLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(90)
            $0.leading.equalToSuperview().inset(30)
        }
        
        controlNoti.snp.makeConstraints {
            $0.top.equalTo(notificationLabel.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview().inset(30)
        }
        
        notiTimer.snp.makeConstraints {
            $0.top.equalTo(controlNoti.snp.bottom).offset(30)
            $0.leading.trailing.equalToSuperview().inset(30)
        }
        
        timer.snp.makeConstraints {
            $0.centerY.equalTo(notiTimer)
            $0.height.equalTo(30)
            $0.width.equalTo(120)
            $0.trailing.equalToSuperview().inset(20)
        }
        
        soomLabel.snp.makeConstraints {
            $0.top.equalTo(timer.snp.bottom).offset(50)
            $0.leading.equalToSuperview().inset(30)
        }
        
        teachNoti.snp.makeConstraints {
            $0.top.equalTo(soomLabel.snp.bottom).offset(30)
            $0.leading.trailing.equalToSuperview().inset(30)
        }
        
        commentNoti.snp.makeConstraints {
            $0.top.equalTo(teachNoti.snp.bottom).offset(30)
            $0.leading.trailing.equalToSuperview().inset(30)
        }
        
        commentNoti2.snp.makeConstraints {
            $0.top.equalTo(commentNoti.snp.bottom).offset(30)
            $0.leading.trailing.equalToSuperview().inset(30)
        }
        
        newPostNoti.snp.makeConstraints {
            $0.top.equalTo(commentNoti2.snp.bottom).offset(30)
            $0.leading.trailing.equalToSuperview().inset(30)
        }
        
        chatLabel.snp.makeConstraints {
            $0.top.equalTo(newPostNoti.snp.bottom).offset(50)
            $0.leading.equalToSuperview().inset(30)
        }
        
        chatNoti.snp.makeConstraints {
            $0.top.equalTo(chatLabel.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(30)
        }
    }
    
}

class NotificationView: UIView {
    let label = UILabel().then {
        $0.font = .init(name: Font.regular.rawValue, size: 12)
    }
    
    let controlSwitch = UISwitch().then {
        $0.isOn = true
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    private func setup() {
        self.addSubview(label)
        self.addSubview(controlSwitch)
        
        label.snp.makeConstraints {
            $0.centerY.equalTo(controlSwitch)
            $0.leading.equalToSuperview()
        }
        
        controlSwitch.snp.makeConstraints {
            $0.top.bottom.equalTo(5)
            $0.trailing.equalToSuperview()
            $0.width.equalTo(40)
        }
        
    }
}
