//
//  ViewController.swift
//  UIPlayer
//
//  Build music player
//
//  Created by rezra on 01.05.2022.
//
 
import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    //MARK: - Outlet
    var player = AVAudioPlayer()
    let playButton = UIButton(frame: CGRect(x: 120, y: 350, width: 60, height: 60))
    let pauseButton = UIButton(frame: CGRect(x: 220, y: 350, width: 60, height: 60))
    let sliderDuration = UISlider(frame: CGRect(x: 120, y: 300, width: 160, height: 10))
    let sliderVolume = UISlider(frame: CGRect(x: 120, y: 450, width: 160, height: 10))
    let volumeLabel = UILabel(frame: CGRect(x: 160, y: 480, width: 100, height: 25))
    let durationLabel = UILabel(frame: CGRect(x: 150, y: 250, width: 150, height: 25))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        var prefersStatusBarHidden: Bool {
            return true
        }
        
        // Auidio player
        let path = Bundle.main.path(forResource:"Yamakasi", ofType: "mp3")
 
          do{
              try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: path!))
          } catch {
              print("File is not Loaded")
          }
          let session = AVAudioSession.sharedInstance()
          do{
              try session.setCategory(AVAudioSession.Category.playback)
          }
          catch{
          }
        
          player.play()
            // Play button
        playButton.setImage(UIImage(named: "play"), for: .normal)
        playButton.addTarget(self, action: #selector(pressPlay), for: .touchUpInside)
        self.view.addSubview(playButton)
            // Pause button
        pauseButton.addTarget(self, action: #selector(pressPause), for: .touchUpInside)
        pauseButton.setImage(UIImage(named: "pause"), for: .normal)
        self.view.addSubview(pauseButton)
            // Duration slider
        sliderDuration.minimumValue = 0
        sliderDuration.maximumValue = Float(player.duration)
        sliderDuration.thumbTintColor = .red
        sliderDuration.addTarget(self, action: #selector(slideDuration), for: .valueChanged)
        self.view.addSubview(sliderDuration)
            // Volume slider
        sliderVolume.minimumValue = 0
        sliderVolume.maximumValue = 100
        sliderVolume.thumbTintColor = .green
        sliderVolume.addTarget(self, action: #selector(slideVolume), for: .valueChanged)
        self.view.addSubview(sliderVolume)
            //Volume label
        volumeLabel.text = "Громкость"
        volumeLabel.font = .systemFont(ofSize: 20)
        volumeLabel.textColor = .white
        self.view.addSubview(volumeLabel)
            //Duration label
        durationLabel.text = "Перемотать"
        durationLabel.font = .systemFont(ofSize: 20)
        durationLabel.textColor = .yellow
        self.view.addSubview(durationLabel)
  }
    
    //MARK: - Method
    @objc func slideDuration(sender: UISlider) {
        if sender == sliderDuration {
            player.currentTime = TimeInterval(sender.value)
            }
        }
    @objc func slideVolume(sender: UISlider) {
        player.volume = sliderVolume.value
    }
    
    //MARK: - Action
    @objc func pressPlay(sender: UIButton) {
        player.play()
    }
    @objc func pressPause(sender: UIButton) {
        player.pause()
    }
 }
                                

