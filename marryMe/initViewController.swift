//
//  ViewController.swift
//  marryMe
//
//  Created by Lakr Sakura on 2018/6/16.
//  Copyright © 2018 Lakr Sakura. All rights reserved.
//

import UIKit

var random_section:Int = 0
var string_lenth = 0
var last_section_is = 0
let this_is_two_line = false
let answer_string_format = ["""
房子写你名字
""","""
银行卡给你
""","""
孩子想尽办法救不然保你
""","""
我妈游泳国家级
""","""
"""]

var already_have_a_label = false

class initViewController: UIViewController {
  
    @IBOutlet weak var welcome_image_main: UIImageView!
    @IBOutlet weak var welcome_tilt: UILabel!
    @IBOutlet weak var BigTilt: UILabel!
    @IBOutlet weak var promise_label: UILabel!
    @IBOutlet weak var dislike_button: UIButton!
    @IBOutlet weak var yeslike_button: UIButton!
    @IBOutlet weak var headicon: UIImageView!
    @IBOutlet weak var like_image: UIImageView!
    @IBOutlet weak var user_control_Agent: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        user_control_Agent.isHidden = true
        like_image.isHidden = true
        
        //Get lenth of string offset.
        while answer_string_format[string_lenth] != ""{
            print("Got promise string here:", answer_string_format[string_lenth])
            string_lenth += 1
        }
        print("There is", string_lenth, "promises in our database.")
        print("Database read compeleted. Have fun.")
        
        like_image.center = CGPoint(x: (UIScreen.main.bounds.size.width / 2), y: (UIScreen.main.bounds.size.height / 2))
        
    }
    
    @IBAction func dislike_button_pushed(_ sender: Any) {
        if !already_have_a_label {
            random_section = Int(Int(arc4random())%string_lenth)
            if random_section == last_section_is {random_section += 1}
            last_section_is = random_section
            print("This time we spwn a promise in database of section", random_section, ".")
            create_Label_with_promise_string(promise_String: answer_string_format[random_section])
        }else{
            already_have_a_label = true
            
        }
    }
    @IBAction func like_me_push(_ sender: Any) {
        
        like_image.alpha = 0
        like_image.isHidden = false
        user_control_Agent.isHidden = true
        let left_Anchor_offset:CGFloat = 66
        let gobal_UI_animate_time = 0.8

        
        DispatchQueue.main.async {
            UIView.animate(withDuration: TimeInterval(gobal_UI_animate_time), animations: {
                self.welcome_image_main.alpha = 0
                self.promise_label.alpha = 0
                self.dislike_button.alpha = 0
                self.dislike_button.alpha = 0
                self.yeslike_button.alpha = 0
            })
        }

        DispatchQueue.main.async {
            UIView.animate(withDuration: TimeInterval(gobal_UI_animate_time), animations: {
                self.welcome_tilt.fadeTransition(0.8)
                self.welcome_tilt.text = "既然同意了就别回头哟！"
            })
        }
        DispatchQueue.main.async {
            UIView.animate(withDuration: TimeInterval(gobal_UI_animate_time), animations: {
                self.BigTilt.fadeTransition(0.8)
                self.BigTilt.text = "真是爱死你了！"
            })
        }
        DispatchQueue.main.async {
            UIView.animate(withDuration: TimeInterval(gobal_UI_animate_time), animations: {
            })
            self.BigTilt.center = CGPoint(x: (UIScreen.main.bounds.size.width / 2) - left_Anchor_offset, y: (UIScreen.main.bounds.size.height / 2))
            self.welcome_tilt.center = CGPoint(x: self.BigTilt.center.x, y: self.BigTilt.center.y - 40)
        }
        DispatchQueue.main.async {
            UIView.animate(withDuration: 1, animations: {
                self.headicon.center = CGPoint(x: self.BigTilt.center.x - 180, y: self.BigTilt.center.y - 14)
                self.like_image.center = CGPoint(x: self.BigTilt.center.x + 233, y: self.BigTilt.center.y - 14)
            })
        }
        DispatchQueue.main.async {
            UIView.animate(withDuration: 1, animations: {
                self.like_image.alpha = 1
        })
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        exit(666)
    }
    
    func create_Label_with_promise_string(promise_String:String){
        print("Going to spwn text:", promise_String, ".")
            DispatchQueue.main.async {
                self.promise_label.fadeTransition(0.2)
                self.promise_label.text = promise_String
            }
    }


}

extension UIView {
    func fadeTransition(_ duration:CFTimeInterval) {
        let animation = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name:
            kCAMediaTimingFunctionEaseInEaseOut)
        animation.type = kCATransitionFade
        animation.duration = duration
        layer.add(animation, forKey: kCATransitionFade)
    }
}
