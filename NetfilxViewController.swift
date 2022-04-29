//
//  NetfilxViewController.swift
//  SSACMOVIE
//
//  Created by 윤형식 on 2022/04/28.
//

import UIKit

class NetfilxViewController: UIViewController {

        
    @IBOutlet var playBtn: UIButton!
    
    @IBOutlet var image1: UIImageView!
    @IBOutlet var image2: UIImageView!
    @IBOutlet var image3: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initPlayBtn()
        initImage()
    }
    
    
    func initPlayBtn() {
    
    }
    
    func initImage() {
        image1.clipsToBounds = true
        image1.layer.cornerRadius = 30
        
        image2.clipsToBounds = true
        image2.layer.cornerRadius = 30
        
        image3.clipsToBounds = true
        image3.layer.cornerRadius = 30
    }
    

    @IBAction func playBtnClicked(_ sender: UIButton) {
        
        setRandomImage()
    }
    
    
    func setRandomImage() {
        let randomNum1 = Int.random(in: 1...10)
        let randomNum2 = Int.random(in: 1...10)
        let randomNum3 = Int.random(in: 1...10)
        
        image1.image = UIImage(named: "poster\(randomNum1)")
        image2.image = UIImage(named: "poster\(randomNum2)")
        image3.image = UIImage(named: "poster\(randomNum3)")
    }
}
