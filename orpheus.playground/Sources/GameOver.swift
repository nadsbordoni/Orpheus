import Foundation
import UIKit
import PlaygroundSupport

let overBackground = UIImage(named: "background.png")
let overScriptBackground = UIImage(named: "artemis1_chat.png")
let artemisName = UIImage(named: "artemisName.png")
let house = UIImage(named: "house.png")
let replayImage = UIImage(named: "retake.png")

public class GameOverController: UIViewController {
    let overBackgroundImageView = UIImageView(image: overBackground)
    let overScriptBackgroundImageView = UIImageView(image: overScriptBackground)
    let overLabel = UILabel()
    let artemisNameImageView = UIImageView(image: artemisName)
    let replay = UIButton()
    let home = UIButton()
    public override func viewDidLoad() {
        self.view = view
        view.backgroundColor = .white
        view.frame = CGRect(x: 0, y: 0, width: 1024, height: 768)
        overBackgroundImageView.frame = CGRect(x: 0, y: 0, width: 1024, height: 768)
        overScriptBackgroundImageView.frame = CGRect(x: 0, y: 80, width: 1024, height: 492.603093)
        artemisNameImageView.frame = CGRect(x: 440, y: 290, width: 160.96, height: 51.48)
        
        overLabel.frame = CGRect (x: 290, y: 350, width: 466.21, height: 143.01)
        overLabel.text = "Sorry Orpheus, but I can't let You go to the underworld."
        overLabel.textAlignment = .justified
        overLabel.textColor = UIColor(.darkBlue)
        overLabel.font = UIFont(name: "BebasNeue-Regular", size: 37)
        overLabel.numberOfLines = 0
        overLabel.lineBreakMode = .byWordWrapping
        overLabel.sizeToFit()
        
        home.frame = CGRect(x: 517, y: 425, width: 100, height: 110)
        home.setImage(house, for: .normal)
        home.addTarget(self, action: #selector(self.callMenu), for: .touchUpInside)
        
        replay.frame = CGRect(x: 417, y: 425, width: 100, height: 110)
        replay.setImage(replayImage, for: .normal)
        replay.addTarget(self, action: #selector(self.tryAgain), for: .touchUpInside)
        //dois botoes: menu e refazer
        addChilds()
        
    }
    @objc func callMenu() {
        let menu = MenuViewController()
        navigationController?.pushViewController(menu, animated: true)
        navigationController?.navigationBar.isHidden = true
    }
    
    @objc func tryAgain() {
        let gameView = GameViewController()
        navigationController?.pushViewController(gameView, animated: false)
        navigationController?.navigationBar.isHidden = true
    }
    
    
    func addChilds() {
        view.addSubview(overBackgroundImageView)
        view.addSubview(overScriptBackgroundImageView)
        view.addSubview(overLabel)
        view.addSubview(artemisNameImageView)
        view.addSubview(home)
        view.addSubview(replay)
    }
}
