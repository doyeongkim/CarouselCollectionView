//
//  ReceiveViewController.swift
//  GiftBox
//
//  Created by 김도영 on 2020/06/05.
//  Copyright © 2020 김도영. All rights reserved.
//

import UIKit
import SnapKit
import ScalingCarousel

class ReceiveViewController: UIViewController {

    private let topLabel = UILabel()
    private var carouselCollectionView: ScalingCarouselView!

    private let sentAmountTitle = UILabel()
    private let sentAmountLabel = UILabel()
    private let currencyLabel = UILabel()
    private let separator1 = UIView()
    private let receiverTitle = UILabel()
    private let receiverLabel = UILabel()
    private let mobileLabel = UILabel()
    private let separator2 = UIView()
    private let sentDateTitle = UILabel()
    private let dateLabel = UILabel()
    private let messegeIcon = UIImageView()
    private let receiveButton = UIButton()

    private let cardNumberLabels = ["김주다님의 추천 선물, 첫번째 💝", "김주다님의 추천 선물, 두번째 🥳", "김주다님의 추천 선물, 세번째 💖"]
    private var giftList = [GiftList(name: "모찌모찌 시바 허스키 바디형 핫팩인형"), GiftList(name: "밀토스트 몽블랑 토스트"), GiftList(name: "사층빵집 마카롱 10종 중 택2")]


    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
        setAutolayout()
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
         if carouselCollectionView != nil {
            carouselCollectionView.deviceRotated()
         }
    }

    private func configure() {
        view.backgroundColor = .white

        let attributedString = NSMutableAttributedString(string: "추천선물 3개와 10,000원을 \n김주다님이 선물하셨습니다.", attributes: [
          .font: UIFont(name: "AppleSDGothicNeo-Regular", size: 21.0)!,
          .foregroundColor: UIColor(white: 51.0 / 255.0, alpha: 1.0),
          .kern: 0.0
        ])
        attributedString.addAttribute(.font, value: UIFont(name: "AppleSDGothicNeo-Bold", size: 21.0)!, range: NSRange(location: 19, length: 14))

        topLabel.attributedText = attributedString
        topLabel.numberOfLines = 2
        view.addSubview(topLabel)

        carouselCollectionView = ScalingCarouselView(withFrame: .zero, andInset: 35)
        carouselCollectionView.dataSource = self
        carouselCollectionView.delegate = self
        carouselCollectionView.backgroundColor = .clear
        carouselCollectionView.register(GiftCell.self, forCellWithReuseIdentifier: GiftCell.identifier)
        view.addSubview(carouselCollectionView)
    }

    private func setAutolayout() {
        topLabel.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(59)
            make.leading.equalTo(35)
        }

        carouselCollectionView.snp.makeConstraints { (make) in
            make.top.equalTo(topLabel.snp.bottom).offset(35)
            make.leading.width.equalToSuperview()
            make.height.equalTo((UIScreen.main.bounds.width - 70) * 1.426 + 10)
        }
    }
}

extension ReceiveViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return giftList.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GiftCell.identifier, for: indexPath) as! GiftCell

        cell.setData(gift: giftList[indexPath.row], numString: cardNumberLabels[indexPath.row])

        DispatchQueue.main.async {
            cell.setNeedsLayout()
            cell.layoutIfNeeded()
        }

        return cell
    }
}

extension ReceiveViewController: UICollectionViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        carouselCollectionView.didScroll()
    }
}

struct GiftList {
    let image: String = "productImage280"
    let name: String
}
