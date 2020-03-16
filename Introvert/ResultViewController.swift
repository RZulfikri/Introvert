//
//  ResultViewController.swift
//  Introvert
//
//  Created by Rahmat Zulfikri on 12/03/20.
//  Copyright © 2020 Rahmat Zulfikri. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var imageResult: UIImageView!
    @IBOutlet weak var labelResult: UILabel!
    @IBOutlet weak var ulangiBtn: UIButton!
    @IBOutlet weak var labelInfo: UILabel!

    var resultType: EnumCollection.ResultTypeEnum = .introvert
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        prepareScreen()
    }
    
    func prepareScreen() {
        prepareButton()
        prepareResult()
    }
    
    func prepareButton() {
        ulangiBtn.layer.cornerRadius = 10
        ulangiBtn.layer.shadowColor = UIColor.black.cgColor
        ulangiBtn.layer.shadowOffset = CGSize(width: 1, height: 2)
        ulangiBtn.layer.shadowRadius = 1
        ulangiBtn.layer.shadowOpacity = 0.2
    }
    
    func prepareResult() {
        switch resultType {
        case .introvert:
            imageResult.image = #imageLiteral(resourceName: "introvert")
            labelResult.text = "Introvert"
            labelInfo.text = "Apa itu Introvert?"
            break
        case .extrovert:
            imageResult.image = #imageLiteral(resourceName: "ambivert")
            labelResult.text = "Extrovert"
            labelInfo.text = "Apa itu Extrovert?"
            break
        case .ambivert:
            imageResult.image = #imageLiteral(resourceName: "extrovert")
            labelResult.text = "Ambivert"
            labelInfo.text = "Apa itu Ambivert?"
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
        
    @IBAction func ulangiAction(_ sender: UIButton) {
        performSegue(withIdentifier: "unwindToMainSegue", sender: self)
    }
    
    @IBAction func klikDetailAction(_ sender: UIButton) {
        performSegue(withIdentifier: "detailSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationView = segue.destination as? NewViewController
        
        destinationView?.resultType = resultType
    }
    
}
