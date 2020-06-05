//
//  ViewController.swift
//  GiftBox
//
//  Created by 김도영 on 2020/06/05.
//  Copyright © 2020 김도영. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    private let receiveBtn = UIButton()
    private let receivedBtn = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        receiveBtn.setTitle("선물받기", for: .normal)
        receiveBtn.setTitleColor(.black, for: .normal)
        receiveBtn.addTarget(self, action: #selector(receiveBtnDidTapped(_:)), for: .touchUpInside)
        view.addSubview(receiveBtn)

        receivedBtn.setTitle("받은선물", for: .normal)
        receivedBtn.setTitleColor(.black, for: .normal)
        receivedBtn.addTarget(self, action: #selector(receivedBtnDidTapped(_:)), for: .touchUpInside)
        view.addSubview(receivedBtn)

        receiveBtn.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview().offset(-50)
        }

        receivedBtn.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview().offset(50)
        }
    }

    @objc private func receiveBtnDidTapped(_ sender: UIButton) {
        let receiveVC = ReceiveViewController()
        present(receiveVC, animated: true, completion: nil)
    }

    @objc private func receivedBtnDidTapped(_ sender: UIButton) {
        let receivedVC = ReceivedViewController()
        present(receivedVC, animated: true, completion: nil)
    }
}

