//
//  CardsVC.swift
//  Learning 2
//
//  Created by Jhagruth Palakonda on 18/12/24.
//

import UIKit

class CardsVC: UIViewController {

    @IBOutlet var cardView: UIImageView!

    @IBOutlet var startB: UIButton!
    
    var cards: [UIImage] = Deck.allC
    
    var i=0
    
    var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timer.invalidate()
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(showCard), userInfo: nil, repeats: true)
    }
    
    @objc func showCard() {
        cardView.image = cards.randomElement() ?? UIImage(named: "QH")
    }
    
    @IBAction func StartB(_ sender: Any) {
        if i==0 {
            startTimer()
        }
        if i==1 {
            timer.invalidate()
            startTimer()
            //startB.setTitle(String("Restarted"), for: .normal)
        }
        i=1
    }
    
    @IBAction func StopB(_ sender: Any) {
        timer.invalidate()
    }
}
