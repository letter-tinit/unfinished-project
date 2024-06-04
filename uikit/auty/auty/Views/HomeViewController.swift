//
//  HomeViewController.swift
//  auty
//
//  Created by Tin on 23/01/2024.
//

import UIKit
import SwiftUI

class HomeViewController: UIViewController, UIFactory {
    // -MARK: Create UI Components
    lazy var subProfileView: UIView = makeView()
    lazy var sampleAvatarImageView: UIImageView = makeImageView(imageName: "SampleAvatar", size: 70)
    lazy var levelLabel: UILabel = makeLabel()
    lazy var nameLabel: UILabel = makeLabel()
    lazy var expIcon: UIImageView = makeImageView(imageName: "ExpIcon", size: 20)
    lazy var expLabel: UILabel = makeLabel()
    lazy var awardIcon: UIImageView = makeImageView(imageName: "AwardIcon", size: 20)
    lazy var awardLabel: UILabel = makeLabel()
    let progressView = UIProgressView(progressViewStyle: .default)
    //    let progressView = GradientProgressView(frame: CGRect(x: 0, y: 0, width: 400, height: 30))
    //    let progressView = GradientProgressView()
    
    // -MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // -MARK: Setup BaseView
    
    // -MARK: SetupUI
    private func setupUI() {
        view.backgroundColor = .homeBackground
        
        view.addSubview(subProfileView)
        configSubProfileView()
    }
    
    private func configSubProfileView() {
        subProfileView.backgroundColor = .systemBackground
        subProfileView.layer.cornerRadius = 15
        customizeTabBarAppearance()
        NSLayoutConstraint.activate([
            subProfileView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            subProfileView.widthAnchor.constraint(equalToConstant: view.bounds.width - 60),
            subProfileView.heightAnchor.constraint(equalToConstant: 122 * (view.bounds.width - 60) / 367),
            subProfileView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        print("\(subProfileView.bounds.width) & \(subProfileView.frame.width) & \(view.bounds.width)")
        
        subProfileView.addSubview(sampleAvatarImageView)
        configSampleAvatarImageView()
        
        subProfileView.addSubview(levelLabel)
        configLevelLabel()
        
        subProfileView.addSubview(nameLabel)
        configNameLabel()
        
        subProfileView.addSubview(expIcon)
        subProfileView.addSubview(expLabel)
        configExp()
        
        subProfileView.addSubview(awardIcon)
        subProfileView.addSubview(awardLabel)
        configAward()
        
        
        view.addSubview(progressView)
        configProgressView()
    }
    
    private func configSampleAvatarImageView() {
        NSLayoutConstraint.activate([
            sampleAvatarImageView.topAnchor.constraint(equalTo: subProfileView.topAnchor, constant: 10),
            sampleAvatarImageView.leadingAnchor.constraint(equalTo: subProfileView.leadingAnchor, constant: 10),
        ])
    }
    
    private func configLevelLabel() {
        levelLabel.setupTitle(text: "Level 10", fontName: "Avenir", size: 11, textColor: .white)
        levelLabel.setBoldText()
        levelLabel.backgroundColor = .levelLabel
        levelLabel.cornerRadius(cornerRadius: 2)
        NSLayoutConstraint.activate([
            levelLabel.topAnchor.constraint(equalTo: sampleAvatarImageView.bottomAnchor, constant: -10),
            levelLabel.centerXAnchor.constraint(equalTo: sampleAvatarImageView.centerXAnchor),
            levelLabel.widthAnchor.constraint(equalToConstant: 70)
        ])
    }
    
    private func configNameLabel() {
        nameLabel.setupTitle(text: "John Doe", fontName: "Avenir", size: 26, textColor: .darkGray)
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: sampleAvatarImageView.topAnchor, constant: 5),
            nameLabel.leadingAnchor.constraint(equalTo: sampleAvatarImageView.trailingAnchor, constant: 10)
        ])
    }
    
    private func configExp() {
        NSLayoutConstraint.activate([
            expIcon.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            expIcon.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor, constant: 10)
        ])
        
        expLabel.setupTitle(text: "240 XP", fontName: "Avenir", size: 10, textColor: .black)
        NSLayoutConstraint.activate([
            expLabel.topAnchor.constraint(equalTo: expIcon.bottomAnchor, constant: 3),
            expLabel.centerXAnchor.constraint(equalTo: expIcon.centerXAnchor)
        ])
    }
    
    private func configAward() {
        NSLayoutConstraint.activate([
            awardIcon.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            awardIcon.leadingAnchor.constraint(equalTo: expIcon.trailingAnchor, constant: 40)
        ])
        
        awardLabel.setupTitle(text: "400 Gold", fontName: "Avenir", size: 10, textColor: .black)
        NSLayoutConstraint.activate([
            awardLabel.topAnchor.constraint(equalTo: awardIcon.bottomAnchor, constant: 3),
            awardLabel.centerXAnchor.constraint(equalTo: awardIcon.centerXAnchor)
        ])
    }
    
    private func configProgressView() {
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.progress = 0.83
        progressView.progressViewStyle = .bar
        progressView.layer.cornerRadius = 5
        progressView.layer.masksToBounds = true
        
        progressView.progressImage = UIImage.gradientImage(with: progressView.frame,
                                                           colors: [
                                                                UIColor.darkOrange.cgColor,
                                                                UIColor.lightOrange.cgColor],
                                                           locations: nil)
        NSLayoutConstraint.activate([
            progressView.leadingAnchor.constraint(equalTo: subProfileView.leadingAnchor, constant: 10),
            progressView.trailingAnchor.constraint(equalTo: subProfileView.trailingAnchor, constant: -10),
            progressView.bottomAnchor.constraint(equalTo: subProfileView.bottomAnchor, constant: -10),
            progressView.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    // -MARK: Setup Action
    
    // -MARK: Catch Action
    private func convertPixel(pixel: Int) -> CGFloat {
        let scale = UIScreen.main.scale
        let point = CGFloat(pixel) / scale
        return point
    }
    
    private func customizeTabBarAppearance() {
        subProfileView.layer.shadowColor = UIColor.black.cgColor
        subProfileView.layer.shadowOpacity = 0.3
        subProfileView.layer.shadowOffset = CGSize(width: 0, height: 0)
        subProfileView.layer.shadowRadius = 4
        subProfileView.layer.masksToBounds = false
    }
    
}

// -MARK: Preview
struct HomeViewControllerPreview: PreviewProvider {
    static var previews: some View {
        VCPreview {
            let homeViewController = HomeViewController()
            return homeViewController
        }
    }
}
