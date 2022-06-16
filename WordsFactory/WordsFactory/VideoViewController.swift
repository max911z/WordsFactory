//
//  VideoViewController.swift
//  WordsFactory
//
//  Created by Максим Неверовский on 16.06.2022.
//

import UIKit

import UIKit

class SecondMusicViewController: UIViewController {
    
    let backButton: UIButton = UIButton()
    let likeButton: UIButton = UIButton()
    let downloadButton: UIButton = UIButton()
    let mainLabel: UILabel = UILabel()
    let secondaryLabel: UILabel = UILabel()
    let playButton: UIButton = UIButton()
    let slider: UISlider = UISlider()
    let leftButton: UIButton = UIButton()
    let rightButton: UIButton = UIButton()
    let leftTimeLabel: UILabel = UILabel()
    let rightTimeLabel: UILabel = UILabel()
    
    init(){
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
        view.backgroundColor = UIColor(named: "backgroundPlayer")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        if (self.tabBarController?.tabBar.layer.zPosition == 0.0){
            backButton.isHidden = true
        }
        else
        {
            backButton.isHidden = false
        }
    }
    
    private func setup(){
        setupBackButton()
        setupDownloadButton()
        setupLikeButton()
        setupMainLabel()
        setupSecondaryLabel()
        setupPlayButton()
        setupSlider()
        setupLeftButton()
        setupRightButton()
        setupLeftTimeLabel()
        setupRightTimeLabel()
        
    }
    
    private func setupBackButton(){
        view.addSubview(backButton)
        
        let backButtonBackground = UIImage(named: "backButton")
        backButton.setBackgroundImage(backButtonBackground, for: UIControl.State.normal)
        
        backButton.layer.cornerRadius = 22.5
        
        backButton.snp.makeConstraints({ make in
            
            make.height.width.equalTo(55)
            make.leading.equalToSuperview().inset(20)
            make.top.equalToSuperview().inset(51).priority(250)
            make.top.greaterThanOrEqualToSuperview().inset(37)
        })
        
        backButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
    }
    
    private func setupLikeButton(){
        view.addSubview(likeButton)
        
        let likeButtonBackground = UIImage(named: "like")
        likeButton.setBackgroundImage(likeButtonBackground, for: UIControl.State.normal)
        
        likeButton.layer.cornerRadius = 22.5
        
        likeButton.snp.makeConstraints({ make in
            
            make.height.width.equalTo(55)
            make.trailing.equalTo(downloadButton.snp.leading).offset(-15)
            make.top.equalToSuperview().inset(51).priority(250)
            make.top.greaterThanOrEqualToSuperview().inset(37)
        })
        
    }
    
    private func setupDownloadButton(){
        view.addSubview(downloadButton)
        
        let downloadButtonBackground = UIImage(named: "download")
        downloadButton.setBackgroundImage(downloadButtonBackground, for: UIControl.State.normal)
        
        downloadButton.layer.cornerRadius = 22.5
        
        downloadButton.snp.makeConstraints({ make in
            make.height.width.equalTo(55)
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalToSuperview().inset(51).priority(250)
            make.top.greaterThanOrEqualToSuperview().inset(37)
        })    }
    
    private func setupMainLabel(){
        view.addSubview(mainLabel)
        
        mainLabel.text = "Focus Attention"
        mainLabel.font = UIFont.helveticaHeue(.bold, size: 34)
        mainLabel.textColor = UIColor(named: "textColor")
        mainLabel.textAlignment = .center
        mainLabel.adjustsFontSizeToFitWidth = true
        
        mainLabel.snp.makeConstraints({ make in
            make.leading.trailing.equalToSuperview().inset(75)
            make.top.equalToSuperview().offset(405).priority(250)
            make.top.greaterThanOrEqualToSuperview().offset(220)
        })
        
    }
    
    private func setupSecondaryLabel(){
        view.addSubview(secondaryLabel)
        
        secondaryLabel.text = "7 DAYS OF CALM"
        secondaryLabel.font = UIFont.helveticaHeue(.medium, size: 14)
        secondaryLabel.textColor = UIColor(named: "seconfTextColor")
        secondaryLabel.textAlignment = .center
        secondaryLabel.adjustsFontSizeToFitWidth = true
        
        secondaryLabel.snp.makeConstraints({ make in
            make.leading.trailing.equalToSuperview().inset(141)
            make.top.equalTo(mainLabel.snp.bottom).offset(16)
        })
    }
    
    private func setupPlayButton(){
        view.addSubview(playButton)
        
        let playButtonBackground = UIImage(named: "play")
        playButton.setBackgroundImage(playButtonBackground, for: UIControl.State.normal)
        
        playButton.layer.cornerRadius = 54.5
        
        playButton.snp.makeConstraints({ make in
            make.width.height.equalTo(109)
            make.top.equalTo(secondaryLabel.snp.bottom).offset(72).priority(250)
            make.top.greaterThanOrEqualTo(secondaryLabel.snp.bottom).offset(52)
            make.centerX.equalToSuperview()
        })
        
    }
    
    private func setupSlider(){
        view.addSubview(slider)
        
        slider.tintColor = UIColor(named: "textColor")
        slider.thumbTintColor = UIColor(named: "textColor")
        slider.minimumValue = 5
        slider.maximumValue = 45
        slider.value = 10
        
        slider.snp.makeConstraints({ make in
            make.top.equalTo(playButton.snp.bottom).offset(59)
            make.top.greaterThanOrEqualTo(playButton.snp.bottom).offset(43)
            make.leading.trailing.equalToSuperview().inset(40)
            make.bottom.equalToSuperview().inset(206).priority(250)
            make.bottom.greaterThanOrEqualToSuperview().inset(190)
        })
    }
    
    private func setupLeftButton(){
        view.addSubview(leftButton)
        
        let backButtonBackground = UIImage(named: "back")
        leftButton.setBackgroundImage(backButtonBackground, for: UIControl.State.normal)
        
        leftButton.layer.cornerRadius = 20
        
        leftButton.snp.makeConstraints({make in
            make.height.width.equalTo(40)
            make.trailing.equalTo(playButton.snp.leading).offset(-50)
            make.centerY.equalTo(playButton.snp.centerY)
            
        })
    }
    
    private func setupRightButton(){
        view.addSubview(rightButton)
        
        let forwardButtonBackground = UIImage(named: "forward")
        rightButton.setBackgroundImage(forwardButtonBackground, for: UIControl.State.normal)
        
        rightButton.layer.cornerRadius = 20
        
        rightButton.snp.makeConstraints({make in
            make.height.width.equalTo(40)
            make.leading.equalTo(playButton.snp.trailing).offset(50)
            make.centerY.equalTo(playButton.snp.centerY)
            
        })
    }
    
    private func setupLeftTimeLabel(){
        view.addSubview(leftTimeLabel)
        
        leftTimeLabel.text = "01:30"
        leftTimeLabel.font = UIFont.helveticaHeue(.medium, size: 16)
        leftTimeLabel.textColor = UIColor(named: "textColor")
        
        leftTimeLabel.snp.makeConstraints({ make in
            make.leading.equalToSuperview().inset(20)
            make.top.equalTo(slider.snp.bottom).offset(20)
        })    }
    
    private func setupRightTimeLabel(){
        view.addSubview(rightTimeLabel)
        
        rightTimeLabel.text = "45:00"
        rightTimeLabel.font = UIFont.helveticaHeue(.medium, size: 16)
        rightTimeLabel.textColor = UIColor(named: "textColor")
        
        rightTimeLabel.snp.makeConstraints({ make in
            make.trailing.equalToSuperview().inset(20)
            make.top.equalTo(slider.snp.bottom).offset(20)
        })
    }
    
    @objc private func goBack(sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
