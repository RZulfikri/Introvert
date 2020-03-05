//
//  ViewController.swift
//  Introvert
//
//  Created by Rahmat Zulfikri on 03/03/20.
//  Copyright © 2020 Rahmat Zulfikri. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var yesBtn: UIButton!
    @IBOutlet weak var noBtn: UIButton!
    @IBOutlet weak var ulangiBtn: UIButton!
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var imageResult: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var mainView: UIView!
    
    let questions = [
     "Saya lebih menyukai percakapan berhadapan satu lawan satu dalam sebuah kegiatan berkelompok.",
     "Saya lebih menyukai mengekspresikan diri sendiri melalui tulisan.",
     "Saya menikmati kesendirian",
     "Saya sangat peduli tentang kekayaan, ketenaran, dan status kekurangan diri daripada rekan-rekan saya",
     "Saya tidak suka berbasa-basi, tetapi saya senang berbicara secara mendalam tentang topik yang penting bagi saya",
     "Orang lain menganggap saya sebagai pendengar yang baik.",
     "Saya bukan seseorang yang mengambil resiko besar.",
     "Saya menikmati bekerja yang memungkinkan saya untuk menyelaminya lebih dalam dengan sedikit interupsi.",
     "Saya menyukai pesta ulangtahun kecil dengan beberapa orang dan anggota keluarga saja.",
     "Orang-orang menggambarkan diri saya sebagai orang yang sangat lembut ketika berbicara.",
    ]
    
    let colors: [[CGFloat]] = [
    [99,73,255],
    [232,134,100],
    [206,122,255],
    [100,198,232],
    [255,197,61],
    [232,84,132],
    [105,110,255],
    [255,195,92],
    [84,232,170],
    [58,170,232],
    ]

    
    var yesAnswer = 0
    var noAnswer = 0
    var index = 0
    
                
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        prepareScreen()
    }
    
    
    func prepareScreen() {
        
        index = 0
        yesAnswer = 0
        noAnswer = 0
        
        changeBackground(colorIndex: index)

        yesBtn.layer.cornerRadius = 10
        noBtn.layer.cornerRadius = 10
        ulangiBtn.layer.cornerRadius = 10
        yesBtn.isHidden = false
        noBtn.isHidden = false
        mainLabel.isHidden = false
        
        imageResult.isHidden = true
        ulangiBtn.isHidden = true
        resultLabel.isHidden = true
        
        noBtn.layer.shadowColor = UIColor.black.cgColor
        noBtn.layer.shadowOffset = CGSize(width: 1, height: 2)
        noBtn.layer.shadowRadius = 1
        noBtn.layer.shadowOpacity = 0.2
        
        yesBtn.layer.shadowColor = UIColor.black.cgColor
        yesBtn.layer.shadowOffset = CGSize(width: 1, height: 2)
        yesBtn.layer.shadowRadius = 1
        yesBtn.layer.shadowOpacity = 0.2
        
        ulangiBtn.layer.shadowColor = UIColor.black.cgColor
        ulangiBtn.layer.shadowOffset = CGSize(width: 1, height: 2)
        ulangiBtn.layer.shadowRadius = 1
        ulangiBtn.layer.shadowOpacity = 0.2
        
        mainLabel.text = questions[index]
    }
    
    func changeQuestions() {
        index += 1
        mainLabel.text = questions[index]
        changeBackground(colorIndex: index)
    }
    
    func changeBackground(colorIndex: Int) {
        mainView.layer.backgroundColor = UIColor(red: colors[colorIndex][0]/255, green: colors[colorIndex][1]/255, blue: colors[colorIndex][2]/255, alpha: 1).cgColor
    }
 
    func calculateResult() {
        ulangiBtn.isHidden = false
        yesBtn.isHidden = true
        noBtn.isHidden = true
        mainLabel.isHidden = true
        
        if (yesAnswer > noAnswer) {
            resultLabel.text = "\(yesAnswer * 10)%\nIntovert"
            imageResult.image = #imageLiteral(resourceName: "introvert")
        } else if (yesAnswer == noAnswer){
            resultLabel.text = "\(noAnswer * 10)%\nIntovert - Extrovert"
            imageResult.image = #imageLiteral(resourceName: "ambivert")
        } else {
            resultLabel.text = "\(noAnswer * 10)%\nExtrovert"
            imageResult.image = #imageLiteral(resourceName: "extrovert")
        }
        
        changeBackground(colorIndex: 0)

        imageResult.isHidden = false
        resultLabel.isHidden = false
    }
    
    @IBAction func onPressYes(_ sender: UIButton) {
        yesAnswer += 1
        if (index < (questions.count - 1)) {
            changeQuestions()
        } else {
            calculateResult()
        }
    }
    
    @IBAction func onPressNo(_ sender: UIButton) {
        noAnswer += 1
        if (index < (questions.count - 1)) {
            changeQuestions()
        } else {
            calculateResult()
        }
    }
    
    @IBAction func ulangi(_ sender: UIButton) {
        prepareScreen()
    }
}

