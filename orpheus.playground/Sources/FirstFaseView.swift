import Foundation
import PlaygroundSupport
import UIKit

var script: [String] = ["Son of Apollo, you know that this forest is not for you. Go back home!", "Auntie, please let me through! I just want to bring Eurydice back...","Hades never releases a soul and no living being passes through Charon.", "But I can convince them all with my music! You know I’ve done this before.", "You may even be able to get through all the challenges...", "But I don't think you would convince Hades. I can't let you take such a risk.", "Auntie, please ... I really can't live without Euryrice.", "OK! But only if you prove that you can charm a god. You can try it on me."]
var scriptBackground: [String] = ["artemis1_chat", "orpheus2_chat","artemis1_chat", "orpheus1_chat", "artemis1_chat", "artemis2_chat", "orpheus2_chat", "artemis3_chat"]
var characterName: [String] = ["artemisName", "orpheusName", "artemisName", "orpheusName", "artemisName", "artemisName", "orpheusName", "artemisName"]

let firstFaseBackground = UIImage(named:"background.png")
let rightArrowImage = UIImage(named: "rightButton.png")
let leftArrowImage = UIImage(named: "leftButton.png")

let scriptBackgroundImagesView = UIImageView()
let nameImageView = UIImageView()
let scriptLabel = UILabel()
let rightArrow = UIButton()
let leftArrow = UIButton()

public class FirstFaseViewController: UIViewController {
    var counter = 0
    
    let firstFaseBackgroundImageView = UIImageView(image: firstFaseBackground)
    
    public override func viewDidLoad() {
        self.view = view
        view.backgroundColor = .white
        view.frame = CGRect(x: 0, y: 0, width: 1024, height: 768)
        
        firstFaseBackgroundImageView.frame = CGRect(x: 0, y: 0, width: 1024, height: 768)
        
        scriptBackgroundImagesView.image = UIImage(named: scriptBackground[0])
        scriptBackgroundImagesView.frame = CGRect(x: 0, y: 80, width: 1024, height: 492.603093)
        
        nameImageView.image = UIImage(named: characterName[0])
        nameImageView.frame = CGRect(x: 440, y: 290, width: 160.96, height: 51.48)
        
        scriptLabel.frame = CGRect (x: 290, y: 350, width: 466.21, height: 143.01)
        scriptLabel.text = script[0]
        scriptLabel.textAlignment = .justified
        scriptLabel.textColor = UIColor(.darkBlue)
        scriptLabel.font = UIFont(name: "BebasNeue-Regular", size: 37)
        scriptLabel.numberOfLines = 0
        scriptLabel.lineBreakMode = .byWordWrapping
        scriptLabel.sizeToFit()
        
        rightArrow.frame = CGRect(x: 517, y: 440, width: 90, height: 85)
        rightArrow.setImage(rightArrowImage, for: .normal)
        rightArrow.addTarget(self, action: #selector(self.rightButton), for: .touchUpInside)
        
        leftArrow.frame = CGRect(x: 417, y: 440, width: 90, height: 85)
        leftArrow.setImage(leftArrowImage, for: .normal)
        leftArrow.addTarget(self, action: #selector(self.leftButton), for: .touchUpInside)
        leftArrow.isHidden = true
        addChilds()
    }
    @objc func rightButton(){
        if counter >= 0 {
            counter += 1
            if counter < script.count && counter >= 1 {
                leftArrow.isHidden = false
                scriptBackgroundImagesView.image = UIImage(named: scriptBackground[counter])
                scriptLabel.text = script[counter]
                nameImageView.image = UIImage(named: characterName[counter])
                
            } else if counter == script.count {
                let gameView = GameViewController()
                 navigationController?.pushViewController(gameView, animated: false)
                 navigationController?.navigationBar.isHidden = true
            }
        }
    }
    @objc func leftButton(){
        if counter >= 0 {
            counter -= 1
            if counter < script.count && counter >= 1 {
                scriptBackgroundImagesView.image = UIImage(named: scriptBackground[counter])
                scriptLabel.text = script[counter]
                nameImageView.image = UIImage(named: characterName[counter])
                leftArrow.isHidden = false
                
            } else if counter == 0 {
                scriptBackgroundImagesView.image = UIImage(named: scriptBackground[counter])
                scriptLabel.text = script[counter]
                nameImageView.image = UIImage(named: characterName[counter])
                leftArrow.isHidden = true
            }
        }
    }
    func addChilds() {
        view.addSubview(firstFaseBackgroundImageView)
        view.addSubview(scriptBackgroundImagesView)
        view.addSubview(nameImageView)
        view.addSubview(scriptLabel)
        view.addSubview(leftArrow)
        view.addSubview(rightArrow)
    }
}

