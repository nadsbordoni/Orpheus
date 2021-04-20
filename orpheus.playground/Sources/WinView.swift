import Foundation
import PlaygroundSupport
import UIKit

var script2: [String] = ["Orpheus, You have proven that You are ready to go to the underworld.", "Take this flute to help you in \nyour other challenges!", "Hello! We don't have any new phases yet.", "But I hope you enjoyed getting to know Orpheus and his story a little!"]
var scriptBackground2: [String] = ["artemis3_chat.png", "artemis5_chat.png", "nadia1_chat.png", "nadia1_chat.png" ]
var characterName2: [String] = ["artemisName.png", "artemisName.png", "nadiaName.png", "nadiaName.png"]

let winGameBackground = UIImage(named:"background.png")
let rightArrowImage2 = UIImage(named: "rightButton.png")
let leftArrowImage2 = UIImage(named: "leftButton.png")
let houseImage = UIImage(named: "house.png")

let winScriptBackgroundImagesView = UIImageView()
let characterNameImageView = UIImageView()
let winScriptLabel = UILabel()
let rArrow = UIButton()

public class WinViewController: UIViewController {
    var counter = 0
    let winBackgroundImageView = UIImageView(image: winGameBackground)
    let home = UIButton()
    
    public override func viewDidLoad() {
        self.view = view
        view.backgroundColor = .white
        view.frame = CGRect(x: 0, y: 0, width: 1024, height: 768)
        
        winBackgroundImageView.frame = CGRect(x: 0, y: 0, width: 1024, height: 768)
        winScriptBackgroundImagesView.image = UIImage(named: scriptBackground2[0])
        winScriptBackgroundImagesView.frame = CGRect(x: 0, y: 80, width: 1024, height: 492.603093)
        
        characterNameImageView.image = UIImage(named: characterName2[0])
        characterNameImageView.frame = CGRect(x: 440, y: 290, width: 160.96, height: 51.48)
        
        winScriptLabel.frame = CGRect (x: 290, y: 350, width: 466.21, height: 143.01)
        winScriptLabel.text = script2[0]
        winScriptLabel.textAlignment = .justified
        winScriptLabel.textColor = UIColor(.darkBlue)
        winScriptLabel.font = UIFont(name: "BebasNeue-Regular", size: 37)
        winScriptLabel.numberOfLines = 0
        winScriptLabel.lineBreakMode = .byWordWrapping
        winScriptLabel.sizeToFit()
        
        rArrow.frame = CGRect(x: 467, y: 425, width: 100, height: 110)
        rArrow.setImage(rightArrowImage2, for: .normal)
        rArrow.addTarget(self, action: #selector(self.rightButton), for: .touchUpInside)
        
        addChilds()
    }
    
    @objc func rightButton(){
            counter += 1
            if counter < script2.count && counter >= 1 {
                winScriptBackgroundImagesView.image = UIImage(named: scriptBackground2[counter])
                winScriptLabel.text = script2[counter]
                characterNameImageView.image = UIImage(named: characterName2[counter])
                
            }
            if counter == 3 {
                changeImage()
            }
        
            if counter == script2.count {
                let menu = MenuViewController()
                 navigationController?.pushViewController(menu, animated: true)
                 navigationController?.navigationBar.isHidden = true
                rArrow.removeFromSuperview()
            }
    }
    
    func changeImage(){
        rArrow.setImage(houseImage, for: .normal)
    }
    func addChilds() {
        view.addSubview(winBackgroundImageView)
        view.addSubview(winScriptBackgroundImagesView)
        view.addSubview(characterNameImageView)
        view.addSubview(winScriptLabel)
        view.addSubview(rArrow)
    }
}
