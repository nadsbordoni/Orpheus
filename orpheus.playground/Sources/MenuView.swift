import Foundation
import PlaygroundSupport
import UIKit

let menuBackground = UIImage(named: "background.png")
let gameTitle = UIImage(named: "title.png")
let menuButtonImage = UIImage(named: "startButton.png")
let menuStartButton = UIButton()

public class MenuViewController: UIViewController {
    let menuBackgroundImageView =  UIImageView(image: menuBackground)
    let orpheusGameTitle = UIImageView(image: gameTitle )
    
    public override func viewDidLoad() {
        view.backgroundColor = .white
        view.frame = CGRect(x: 0, y: 0, width: 1024, height: 768)
        menuBackgroundImageView.frame = CGRect(x: 0, y: 0, width: 1024, height: 768)
        
        orpheusGameTitle.frame = CGRect(x: 95 , y: 80 , width: 847.3839, height: 240.4989)
        
        menuStartButton.frame = CGRect(x: 403, y: 300, width: 240, height: 160)
        menuStartButton.setImage(menuButtonImage, for: .normal)
        menuStartButton.addTarget(self, action: #selector(self.startMenu), for: .touchUpInside)

        addChilds()
    }
    @objc func startMenu() {
        let prologueView = PrologueViewController()
        navigationController?.pushViewController(prologueView, animated: false)
        navigationController?.navigationBar.isHidden = true
        
    }
    
    func addChilds() {
        view.addSubview(menuBackgroundImageView)
        view.addSubview(orpheusGameTitle)
        view.addSubview(menuStartButton)
    }
}
