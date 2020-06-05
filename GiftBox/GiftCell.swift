//
//  GiftCell.swift
//  GiftBox
//
//  Created by 김도영 on 2020/06/05.
//  Copyright © 2020 김도영. All rights reserved.
//

import UIKit
import ScalingCarousel

class GiftCell: ScalingCarouselCell {
    static let identifier = "GiftCell"

    private let imageView = UIImageView()
    private let cardNoLabel = UILabel()
    private let productName = UILabel()
    private let seeProductButton = UIButton()


    override init(frame: CGRect) {
        super.init(frame: frame)

        configure()
        setAutolayout()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configure() {
        mainView = UIView(frame: contentView.bounds)
        mainView.backgroundColor = .white
//        mainView.layer.cornerRadius = 12
        mainView.layer.borderColor = UIColor(red: 0.90, green: 0.90, blue: 0.90, alpha: 1.00).cgColor
        mainView.layer.borderWidth = 1
        mainView.layer.makeShadow(color: .black, alpha: 0.1, x: 0, y: 5, blur: 10)
        contentView.addSubview(mainView)

        imageView.layer.cornerRadius = 20
        imageView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        mainView.addSubview(imageView)

        cardNoLabel.textColor = UIColor(red: 0.20, green: 0.20, blue: 0.20, alpha: 1.00)
        cardNoLabel.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 15)
        mainView.addSubview(cardNoLabel)

        productName.textColor = UIColor(red: 0.20, green: 0.20, blue: 0.20, alpha: 1.00)
        productName.font = UIFont(name: "UIColor(red: 0.20, green: 0.20, blue: 0.20, alpha: 1.00)", size: 16)
        productName.lineBreakMode = .byTruncatingTail
        mainView.addSubview(productName)

        seeProductButton.setTitle("선물보러가기", for: .normal)
        seeProductButton.setTitleColor(UIColor(red: 0.29, green: 0.39, blue: 0.65, alpha: 1.00), for: .normal)
        seeProductButton.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 12)
        seeProductButton.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.00)
        seeProductButton.layer.cornerRadius = 13
        mainView.addSubview(seeProductButton)
    }

    private func setAutolayout() {
        mainView.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalToSuperview()
            make.bottom.equalTo(-10)
        }

        imageView.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(mainView.snp.width)
        }

        cardNoLabel.snp.makeConstraints { (make) in
            make.top.equalTo(imageView.snp.bottom).offset(19)
            make.leading.equalTo(20)
        }

        productName.snp.makeConstraints { (make) in
            make.top.equalTo(cardNoLabel.snp.bottom).offset(4)
            make.leading.equalTo(20)
            make.trailing.equalTo(-46)
        }

        seeProductButton.snp.makeConstraints { (make) in
            make.top.equalTo(productName.snp.bottom).offset(15)
            make.leading.equalTo(20)
            make.width.equalTo(90)
            make.height.equalTo(26)
        }
    }

    func setData(gift: GiftList, numString: String) {
        imageView.image = UIImage(named: gift.image)
        cardNoLabel.text = numString
        productName.text = gift.name
    }
}

extension CALayer {
    func makeShadow(color: UIColor, alpha: Float, x: CGFloat, y: CGFloat, blur: CGFloat, spread: CGFloat = 0) {
        self.shadowColor = color.cgColor
        self.shadowOpacity = alpha
        self.shadowOffset = CGSize(width: x, height: y)
        self.shadowRadius = blur / 2.0
    }
}
