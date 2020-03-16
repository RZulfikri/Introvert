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
    
    let maxQuestion = 10
    
    var yesAnswer = 0
    var noAnswer = 0
    var index = 0
    var leftQuestion: [String] = []
                
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
        leftQuestion = questions
        
        index = 0
        yesAnswer = 0
        noAnswer = 0
        
        changeBackground(colorIndex: index)

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
        
        getQuestion()
    }
    
    func getQuestion() {
        let index = Int(arc4random_uniform(UInt32(leftQuestion.count)))
        mainLabel.text = questions[index]
        leftQuestion.remove(at: index)
    }
    
    func changeQuestions() {
        index += 1
        getQuestion()
        changeBackground(colorIndex: index)
    }
    
    func changeBackground(colorIndex: Int) {
        mainView.layer.backgroundColor = UIColor(red: colors[colorIndex][0]/255, green: colors[colorIndex][1]/255, blue: colors[colorIndex][2]/255, alpha: 1).cgColor
    }
    
    func moveToResult() {
        performSegue(withIdentifier: "resultSegue", sender: self)
    }
        
    
    @IBAction func onPressYes(_ sender: UIButton) {
        yesAnswer += 1
        if (index < maxQuestion - 1) {
            changeQuestions()
        } else {
            moveToResult()
        }
    }
    
    @IBAction func onPressNo(_ sender: UIButton) {
        noAnswer += 1
        if (index < maxQuestion - 1) {
            changeQuestions()
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

