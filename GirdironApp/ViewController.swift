//
//  ViewController.swift
//  GirdironApp
//
//  Created by Alisher Abdukarimov on 4/24/17.
//  Copyright © 2017 MrAliGorithm. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var addNameView: UIView!
    @IBOutlet weak var teamNameTextField: UITextField!
    @IBOutlet weak var visualEffect: UIVisualEffectView!
    
    var effect: UIVisualEffect!
    
    @IBAction func startButton(_ sender: Any) {
        visualEffect.isHidden = false
        animate()
    }
    
    @IBAction func done(_ sender: Any) {
        animateOut()
        if teamNameTextField.text?.isEmpty == true {
        return
        }
        
        let myVC = self.storyboard?.instantiateViewController(withIdentifier: "VC") as! MainVC
        myVC.stringPassed = teamNameTextField.text
       
        
        self.navigationController?.pushViewController(myVC, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        visualEffect.isHidden = true
        effect = visualEffect.effect
        visualEffect.effect = nil
        
        addNameView.layer.cornerRadius = 6
        
    }
    
    func animate(){
        
        self.view.addSubview(addNameView)
        addNameView.center = self.view.center
        
        addNameView.transform = CGAffineTransform.init(scaleX: 1.5, y: 1.5)
        addNameView.alpha = 0
        
        UIView.animate(withDuration: 0.5) {
            self.visualEffect.effect = self.effect
            self.addNameView.alpha = 1
            self.addNameView.transform = CGAffineTransform.identity
            
        }
        
    }
    
    func animateOut() {
        
        UIView.animate(withDuration: 0.4, animations: {
            self.addNameView.transform = CGAffineTransform.init(scaleX: 1.5, y: 1.5)
            self.visualEffect.effect = nil
            self.visualEffect.alpha = 0
        }) { (succes: Bool) in
            self.addNameView.removeFromSuperview()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
        
    }
    
    
}

