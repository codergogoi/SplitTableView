//
//  ViewController.swift
//  SplitTableView
//
//  Created by MAC01 on 11/12/17.
//  Copyright © 2017 Jayanta Gogoi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet weak var nestedView: UIView!
    @IBOutlet weak var onwardTableView : UITableView!
    @IBOutlet weak var returnTableView : UITableView!
    
    @IBOutlet weak var onwardNestView : UIView!
    @IBOutlet weak var returnNestView : UIView!
    
    @IBOutlet weak var topView: UIView!
    
 
    var identifier = "cell"
    var minSwipeValue : CGFloat = 0
    var maxSwipeValue : CGFloat = 0
    
    @IBOutlet weak var topViewHeightConst: NSLayoutConstraint!
    @IBOutlet weak var widthConst: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       let owNibFile = UINib(nibName: "AirLinesCell", bundle: nil)
        self.onwardTableView.register(owNibFile, forCellReuseIdentifier: identifier)
        self.onwardTableView.separatorInset = .zero

        let retNibFile = UINib(nibName: "AirLinesCell", bundle: nil)
        self.returnTableView.register(retNibFile, forCellReuseIdentifier: identifier)
        self.returnTableView.separatorInset = .zero
        
        let gesture = UIPanGestureRecognizer(target: self, action: #selector(self.swipePerform(_:)))
        self.nestedView.addGestureRecognizer(gesture)
        gesture.delegate = self
      
        self.minSwipeValue = (self.nestedView.frame.size.width / 3.5)
        self.maxSwipeValue = (self.nestedView.frame.size.width - minSwipeValue)
        
        self.onwardTableView.estimatedRowHeight = 120
        self.onwardTableView.rowHeight = UITableViewAutomaticDimension
 
     }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.performSlideFlip(true)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
 
    }
    
    //MARK: - onTap Actions
    @IBAction func onTapContinue(_ sender: UIButton){
        
        sender.onTapAnimation()
        
        //perform pricing API
        
    }
    

    @objc func swipePerform(_ sender: UIPanGestureRecognizer){
        
        let velocity = sender.velocity(in: self.nestedView)
 
         if sender.state == .changed {
            let translate = sender.translation(in: self.nestedView)
            UIView.animate(withDuration: 0.5) {
                DispatchQueue.main.async {
                   let xPos = translate.x
                  
                    if xPos > self.minSwipeValue && xPos < self.maxSwipeValue {
                        self.widthConst.constant = translate.x;
                        
                    }
                }
            }
        
         }else if sender.state == .ended{
            
            DispatchQueue.main.async {
            
                if velocity.x > 0 { // right
                     self.widthConst.constant = self.maxSwipeValue;
                     self.view.commitAnimation()
                }else{ // left
                     self.widthConst.constant = self.minSwipeValue;
                     self.view.commitAnimation()
                }
            }
            
         }else{
            sender.setTranslation(CGPoint(x: self.onwardTableView.frame.size.width, y:0), in: self.nestedView)

         }
        
    }
    
    
    func performSlideFlip(_ isLeft: Bool){
        
        DispatchQueue.main.async {
            
            if isLeft { // right
                
                self.widthConst.constant = self.maxSwipeValue;
                self.view.commitAnimation()
                
            }else{ // left
                
                self.widthConst.constant = self.minSwipeValue;
                self.view.commitAnimation()
                
            }
        }
        
        
    }


}

extension ViewController : UITableViewDataSource, UITableViewDelegate {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 120
    
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
 
        if tableView.tag == 11 {
            let cell = self.onwardTableView.dequeueReusableCell(withIdentifier: identifier) as! AirLinesCell
            return cell
        }else{
            
            let cell = self.returnTableView.dequeueReusableCell(withIdentifier: identifier) as! AirLinesCell
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
 
        let cell = tableView.cellForRow(at: indexPath)
        cell?.onSelectAnimation()
        
        if tableView.tag > 11 {
             if tableView.frame.size.width < 200 {
                self.performSlideFlip(false)
            }
            
        }else{
             if tableView.frame.size.width < 200 {
                self.performSlideFlip(true)
            }
        }

    }
    
}

