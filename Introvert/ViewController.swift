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
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var mainView: UIView!
    
    let enumCollection = EnumCollection()
    
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
     "Saya cenderung tidak membicarakan pekerjaan saya dengan orang lain sampai pekerjaan itu benar-benar selesai.",
     "Saya tidak menyukai konflik.",
     "Saya berusaha untuk melakukan pekerjaan sebaik mungkin.",
     "Saya cenderung berfikir sebelum berbicara.",
     "Energi saya merasa terkuras setelah melakukan sesuatu, bahkan ketika menikmati diri sendiri.",
     "Saya sering membiarkan panggilan melalui voicemail.",
     "Jika harus memilih, saya lebih suka menikmati akhir pekan dengan tidak beraktivitas apapun dibandingkan dengan setumpuk jadwal.",
     "Saya tidak menikmati melakukan aktivitas yang berjejal.",
     "Saya bisa berkonsentrasi dengan mudah.",
     "Dalam situasi kelas, saya cenderung lebih suka kuliah dibandingkan seminar.",
    ]
    
    let colors: [[CGFloat]] = [
        [99, 73, 255, 100],
        [203, 146, 232, 91],
        [255, 173, 231, 100],
        [232, 152, 146, 91],
        [166, 150, 255, 100],
        [101, 74, 255, 100],
        [83, 75, 128, 50],
        [81, 59, 204, 80],
        [101, 74, 255, 100],
        [123, 99, 255, 100],
        [90, 63, 255, 100],
        [255, 119, 99, 100],
        [74, 143, 255, 100],
        [199,146,232, 100],
        [206,122,255, 100],
        [100,198,232, 100],
        [255,197,61, 100],
        [232,84,132, 100],
        [105,110,255, 100],
        [255,195,92, 100],
        [166,146,232, 100],
        [58,170,232, 100],
        [255,173,231, 100],
        [167,161,255, 100],
    ]
    
    let maxQuestion = 10
    
    var yesAnswer = 0
    var noAnswer = 0
    var index = 0
    
    var activeQuestions: [String] = []
    var activeColors: [[CGFloat]] = []
                
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        prepareScreen()
    }
    
//    override func viewWillDisappear(_ animated: Bool) {
//        self.navigationController?.setNavigationBarHidden(false, animated: animated);
//        super.viewWillDisappear(animated)
//    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    func prepareScreen() {
        index = 0
        yesAnswer = 0
        noAnswer = 0
        
        yesBtn.layer.cornerRadius = 10
        noBtn.layer.cornerRadius = 10
        
        noBtn.layer.shadowColor = UIColor.black.cgColor
        noBtn.layer.shadowOffset = CGSize(width: 1, height: 2)
        noBtn.layer.shadowRadius = 1
        noBtn.layer.shadowOpacity = 0.2
        
        yesBtn.layer.shadowColor = UIColor.black.cgColor
        yesBtn.layer.shadowOffset = CGSize(width: 1, height: 2)
        yesBtn.layer.shadowRadius = 1
        yesBtn.layer.shadowOpacity = 0.2
        
        prepareQuestion()
        
        changeBackground(colorIndex: index)
        changeQuestions(questionIndex: index)
    }
    
    func prepareQuestion() {
        var leftQuestions = questions
        var leftColors = colors
        
        for _ in 1...maxQuestion {
            let questionIndex = Int.random(in: 0..<leftQuestions.count)
            let colorIndex = Int.random(in: 0..<leftColors.count)
            
            activeQuestions.append(leftQuestions[questionIndex])
            activeColors.append(leftColors[colorIndex])
            
            leftQuestions.remove(at: questionIndex)
            leftColors.remove(at: colorIndex)
        }
    }
    
    
    func nextQuestion() {
        index += 1
        changeBackground(colorIndex: index)
        changeQuestions(questionIndex: index)
    }
    
    func changeBackground(colorIndex: Int) {
        mainView.layer.backgroundColor = UIColor(red: activeColors[colorIndex][0]/255, green: activeColors[colorIndex][1]/255, blue: activeColors[colorIndex][2]/255, alpha: activeColors[colorIndex][3]/100).cgColor
    }
    
    func changeQuestions(questionIndex: Int) {
        mainLabel.text = activeQuestions[questionIndex]
    }
    
    func moveToResult() {
        performSegue(withIdentifier: "resultSegue", sender: self)
    }
        
    
    @IBAction func onPressYes(_ sender: UIButton) {
        yesAnswer += 1
        if (index < maxQuestion - 1) {
            nextQuestion()
        } else {
            moveToResult()
        }
    }
    
    @IBAction func onPressNo(_ sender: UIButton) {
        noAnswer += 1
        if (index < maxQuestion - 1) {
            nextQuestion()
        } else {
            moveToResult()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationView = segue.destination as? ResultViewController
        
        if (yesAnswer == noAnswer) {
            destinationView?.resultType = .ambivert
        } else {
            if (yesAnswer > noAnswer) {
                destinationView?.resultType = .introvert
            } else {
                destinationView?.resultType = .extrovert
            }
        }
    }
    
    
    @IBAction func unwindToMainSegue(segue:UIStoryboardSegue) {
        prepareScreen()
    }

}

