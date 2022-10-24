//
//  ViewController.swift
//  proj1
//
//  Created by William Zeng on 10/18/22.
//

import UIKit
import AudioToolbox
class ViewController: UIViewController {
    var userOutput: [String] = []
    
//    Loading View
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBlue
        
        let gestureView = UIView(frame: CGRect(x:0, y:0, width:400, height:500))
        gestureView.backgroundColor = .red
        gestureView.center = view.center
        gestureView.isUserInteractionEnabled = true
        view.addSubview(gestureView)
        
        let rightGesture = UISwipeGestureRecognizer(target: self, action: #selector(happySwipe(gesture:)))
        rightGesture.direction = .right
        rightGesture.numberOfTouchesRequired = 1
        let leftGesture = UISwipeGestureRecognizer(target: self, action: #selector(loveSwipe(gesture:)))
        leftGesture.direction = .left
        leftGesture.numberOfTouchesRequired = 1
        let upGesture = UISwipeGestureRecognizer(target: self, action: #selector(upSwipe(gesture:)))
        upGesture.direction = .up
        upGesture.numberOfTouchesRequired = 1
        let downGesture = UISwipeGestureRecognizer(target: self, action: #selector(sadSwipe(gesture:)))
        downGesture.direction = .down
        downGesture.numberOfTouchesRequired = 1
        let laughGesture = UISwipeGestureRecognizer(target: self, action: #selector(laughSwipe(gesture:)))
        laughGesture.direction = .up
        laughGesture.numberOfTouchesRequired = 2
        let madGesture = UISwipeGestureRecognizer(target: self, action: #selector(madSwipe(gesture:)))
        madGesture.direction = .down
        madGesture.numberOfTouchesRequired = 2
        
        
        
        gestureView.addGestureRecognizer(rightGesture)
        gestureView.addGestureRecognizer(leftGesture)
        gestureView.addGestureRecognizer(upGesture)
        gestureView.addGestureRecognizer(downGesture)
        gestureView.addGestureRecognizer(laughGesture)
        gestureView.addGestureRecognizer(madGesture)
        
        view.addSubview(button2)
        button2.addTarget(self, action: #selector(didTapButton2), for: .touchUpInside)
    }
    
    @objc func happySwipe(gesture: UITapGestureRecognizer) {
        userOutput.append("happy")
        print(userOutput)
    }
    @objc func loveSwipe(gesture: UITapGestureRecognizer) {
//        userOutput = userOutput.dropLast(1)
        userOutput.append("love")
        print(userOutput)
    }
    @objc func upSwipe(gesture: UITapGestureRecognizer) {
//        userOutput = userOutput.dropLast(1)
        userOutput.append("thumbs up")
        print(userOutput)
    }
    @objc func sadSwipe(gesture: UITapGestureRecognizer) {
//        userOutput = userOutput.dropLast(1)
        userOutput.append("thumbs down")
        print(userOutput)
    }
    @objc func laughSwipe(gesture: UITapGestureRecognizer) {
//        userOutput = userOutput.dropLast(1)
        userOutput.append("laugh")
        print(userOutput)
    }
    @objc func madSwipe(gesture: UITapGestureRecognizer) {
//        userOutput = userOutput.dropLast(1)
        userOutput.append("mad")
        print(userOutput)
    }

    private let button2: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.setTitle("Start Set 2", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        return button
        }()
    @objc func didTapButton2() {
        set2(numTrials: 6)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        button2.frame = CGRect(x: 200,
                                y: view.frame.size.height - 150 - view.safeAreaInsets.bottom,
                                width: view.frame.size.width - 260,
                                height: 55
                )
    }
    
//    Screen Colors for every emotions
    let colors: [UIColor] = [
        .systemBlue,
        .systemRed,
        .systemGreen,
        .systemMint,
        .systemYellow,
        .systemPurple
    ]
    
//    Trial 2 with different vibrations each representing a different Emotion
        func set2(numTrials: Int) -> Void {
            let seconds = 4.0
            var val = 0
            var frequency = [4095, 1304, 1321, 1519, 1350, 1521]
            
            // 4095 = normal, 1521 = 3 little booms, 1321 = two
            // need to change 1350, also 1519 is very close to 1521

            while (val < numTrials) {
                let randomName = frequency.randomElement()!
                AudioServicesPlaySystemSound(SystemSoundID(randomName))
                
                if let index = frequency.firstIndex(of: randomName) {
                    frequency.remove(at: index)
//                view.backgroundColor = colors[index]
                    print("Index of '\(randomName)' is \(index).")
                }
                Thread.sleep(forTimeInterval: seconds)
                val += 1
            }
        }
}
