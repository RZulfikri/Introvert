//
//  NewViewController.swift
//  Introvert
//
//  Created by Rahmat Zulfikri on 12/03/20.
//  Copyright © 2020 Rahmat Zulfikri. All rights reserved.
//

import UIKit

class NewViewController: UIViewController {
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDesc: UILabel!
    
    let resultDetail: [EnumCollection.ResultTypeEnum: String] = [
        EnumCollection.ResultTypeEnum.introvert: "Secara garis besar, pribadi introvert dapat dikategorikan bagi orang yang lebih merasakan kenyamanan saat sendirian daripada saat bersama dengan orang lain. Bagi kepribadian introvert, ide dan konsep lebih menarik dibandingkan dengan orang lain maupun kegiatan sosial.\nKelebihan dari kepribadian introvert pada umumnya adalah mampu menjadi pendengar yang baik, mampu memperhatikan detail, serta lebih terarah sebab betul-betul memikirkan dengan matang sebelum melakukan sesuatu.\nSementara itu, kekurangan yang mungkin dimiliki orang introvert ialah cenderung kikuk saat harus bersosialisasi—apalagi terus-menerus, serta rasa percaya diri yang dapat dikatakan lebih rendah daripada kepribadian ekstrovert.",
        EnumCollection.ResultTypeEnum.extrovert: "Kepribadian ekstrovert lebih nyaman saat bersama dengan orang lain karena mereka mendapat asupan energi pada saat berinteraksi dan berdekatan dengan orang lain. Menurut GoodTherapy, kepribadian ekstrovert lebih sering dijumpai daripada kepribadian introvert—dalam populasi secara general, dapat dikatakan bahwa perbandingan orang ekstrovert dan introvert adalah tiga banding satu.\nKelebihan yang mungkin dimiliki orang ekstrovert pada umumnya ialah kemampuannya untuk berpikir cepat pada saat mengambil keputusan, keberanian dalam mengambil resiko, dan tentu saja lebih mudah bersosialisasi dan mendapatkan teman-teman baru.\nSementara itu, kekurangan yang mungkin menjadi masalah orang ekstrovert ialah agak sulit menjaga rahasia dan cukup ceroboh karena tidak berpikir panjang sebelum memutuskan sesuatu.",
        EnumCollection.ResultTypeEnum.ambivert: "Orang dengan kepribadian ambivert berada di tengah-tengah introvert dan ekstrovert, orang ambivert dapat dikatakan fleksibel, alias mampu menyesuaikan diri dengan mudah.\nOrang ambivert biasanya mudah bersosialisasi, namun tetap memiliki ruang waktu sendiri. Mereka memiliki sisi intuitif yang lebih tinggi hingga tau kapan harus diam dan kapan harus berbicara.\nKelebihan pada kepribadian ambivert ialah mandiri, mudah beradaptasi, dan memiliki intuisi yang tajam. Sementara itu, kekurangannya ialah lebih moody dan sulit membuat perencanaan ataupun keputusan.",
    ]
    
    var resultType: EnumCollection.ResultTypeEnum = .extrovert
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        prepareScreen()
    }
    
    func prepareScreen() {
        switch resultType {
        case .introvert:
            labelTitle.text = "Introvert"
            break
        case .ambivert:
            labelTitle.text = "Ambivert"
            break
        case .extrovert:
            labelTitle.text = "Extrover"
            break
        }
        
        labelDesc.text = resultDetail[resultType]
        labelDesc.sizeToFit()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func tutupAction(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
