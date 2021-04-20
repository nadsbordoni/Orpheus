import Foundation
import UIKit
import AVFoundation
import SwiftUI

private var faPlayer: AVAudioPlayer!
private var solPlayer: AVAudioPlayer!
private var laPlayer: AVAudioPlayer!
private var siPlayer: AVAudioPlayer!


//UI inits

//images variables
let gameBackground = UIImage(named:"bookBackground.png")
let artemis = UIImage(named: "artemis.png")
let lyra = UIImage(named:"lyra1.png")
let lyraSlice1 = UIImage(named: "lyra2.png")
let lyraSlice2 = UIImage(named: "lyra3.png")
let startButton = UIImage(named: "rightButton.png")
let normalString = UIImage(named: "normalChord.png")
let blueString = UIImage(named: "blueChord.png")
let purpleString = UIImage(named: "purpleChord.png")
let redString = UIImage(named: "redChord.png")
let greenString = UIImage(named: "greenChord.png")


public class GameViewController: UIViewController, AVAudioPlayerDelegate {
    let artemisImageView = UIImageView(image: artemis)
    let backgroundImageView = UIImageView(image: gameBackground)
    let lyraImageView = UIImageView(image: lyra)
    let lyra2ImageView = UIImageView(image: lyraSlice1)
    var musicalScore = [Int]()
    var currentItem = 0
    var timesPlayerTapped = 0
    var readyForUser = false
    var level = 1
    var maxlevel = 4
    let faString = UIButton()
    let solString = UIButton()
    let laString = UIButton()
    let siString = UIButton()
    let start = UIButton()
    let label = UILabel()
    
   public override func viewDidLoad() {
        playSound()
        
        view.backgroundColor = .blue
        view.frame = CGRect(x: 0, y: 0, width: 1024, height: 768)
        
        label.frame = CGRect (x: 250, y: 250, width: 252, height: 265)
        label.text = "Pay attention to the musical notes!\nSoon after, You must repeat them in the right sequence. Are you ready?"
        label.textAlignment = .justified
        label.textColor = UIColor(.darkBlue)
        label.font = UIFont(name: "BebasNeue-Regular", size: 37)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.sizeToFit()
        //label.isHidden = true
        
        backgroundImageView.frame = CGRect(x: 0, y: 0, width: 1024, height: 768)
        artemisImageView.frame = CGRect(x: 0, y: 220, width: 250.9665, height: 480.5136)
        lyraImageView.frame = CGRect(x: 576, y: 120, width: 389.6526, height: 545.237638)
        lyra2ImageView.frame = CGRect(x: 690, y: 130, width: 147, height: 86.4442)
        
        //start button
        start.setImage(startButton, for: .normal)
        start.frame = CGRect(x: 288, y: 500, width: 100, height: 100)
        start.addTarget(self, action: #selector(self.startGame), for: .touchUpInside)
        
        //fabutton
        faString.tag = 1
        faString.frame = CGRect(x: 700, y: 170, width: 28.602, height: 400)
        faString.setImage(normalString, for: .normal)
        faString.isUserInteractionEnabled = false
        faString.addTarget(self, action: #selector(self.ButtonPressed), for: .touchUpInside)
        
        
        //solbutton
        solString.tag = 2
        solString.frame = CGRect(x: 730, y: 170, width: 28.602, height: 400)
        solString.setImage(normalString, for: .normal)
        solString.addTarget(self, action: #selector(self.ButtonPressed), for: .touchUpInside)
        faString.isUserInteractionEnabled = false
        //labutton
        laString.tag = 3
        laString.frame = CGRect(x: 760, y: 170, width: 28.602, height: 400)
        laString.setImage(normalString, for: .normal)
        laString.addTarget(self, action: #selector(self.ButtonPressed), for: .touchUpInside)
        faString.isUserInteractionEnabled = false
        //sibutton
        siString.tag = 4
        siString.frame = CGRect(x: 790, y: 170, width: 28.602, height: 400)
        siString.setImage(normalString, for: .normal)
        siString.addTarget(self, action: #selector(self.ButtonPressed), for: .touchUpInside)
        faString.isUserInteractionEnabled = false
        addChilds()
        
        
    }
    
    @objc func startGame(){
        start.isHidden = true
        label.removeFromSuperview()
        artemisImageView.removeFromSuperview()
        
        UIView.animate(withDuration: 0.4, delay: 0, options: .curveEaseOut, animations: {
            self.lyraImageView.frame = CGRect(x: 330, y: 120, width: 389.6526, height: 545.237638)
            self.faString.frame = CGRect(x: 454, y: 170, width: 28.602, height: 400)
            self.solString.frame = CGRect(x: 484, y: 170, width: 28.602, height: 400)
            self.laString.frame = CGRect(x: 514, y: 170, width: 28.602, height: 400)
            self.siString.frame = CGRect(x: 544, y: 170, width: 28.602, height: 400)
            self.lyra2ImageView.frame = CGRect(x: 444, y: 130, width: 147, height: 86.4442)
        }, completion: { finished in
            print("Lyra has moved")
        })
        
        
        disableButtons()
        let randomNumber = Int(arc4random_uniform(4) + 1)
        musicalScore.append(randomNumber)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.3) {
            self.playCurrentLevel()
        }
        
        
    }
    
    @objc func ButtonPressed(sender: AnyObject) {
        if readyForUser {
            print("usuario apertou o botao")
            print(readyForUser)
            let button = sender as! UIButton
            switch button.tag {
            case 1:
                faPlayer.play()
                changeButtonsColor(tag: 1)
                isCorrect(buttonPressed: 1)
                break
            case 2:
                solPlayer.play()
                changeButtonsColor(tag: 2)
                isCorrect(buttonPressed: 2)
                break
            case 3:
                laPlayer.play()
                changeButtonsColor(tag: 3)
                isCorrect(buttonPressed: 3)
                break
            case 4:
                siPlayer.play()
                changeButtonsColor(tag: 4)
                isCorrect(buttonPressed: 4)
                break
            default:
                break
            }
        }
        
    }
    
    func playCurrentLevel() {
        let selectedItem = musicalScore[currentItem]
        switch selectedItem {
        case 1:
            changeButtonsColor(tag: 1)
            faPlayer.play()
            break
        case 2:
            changeButtonsColor(tag: 2)
            solPlayer.play()
            break
        case 3:
            changeButtonsColor(tag: 3)
            laPlayer.play()
            break
        case 4:
            changeButtonsColor(tag: 4)
            siPlayer.play()
            break
        default:
            break;
        }
        
        currentItem += 1
    }
    func isCorrect(buttonPressed: Int) {
        if buttonPressed == musicalScore[timesPlayerTapped] {
            if timesPlayerTapped == musicalScore.count - 1 {
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(2)) {
                    self.nextLevel()
                }
                return
            }
            timesPlayerTapped += 1
        } else {
            GameOver()
        }
        
    }
    func nextLevel() {
        level += 1
        if level > maxlevel{
            start.isHidden = false
            readyForUser = false
            level = 1
            timesPlayerTapped = 0
            currentItem = 0
            musicalScore = []
            disableButtons()
            let win = WinViewController()
            navigationController?.pushViewController(win, animated: false)
            navigationController?.navigationBar.isHidden = true
           
            
        } else {
            readyForUser = false
            timesPlayerTapped = 0
            currentItem = 0
            disableButtons()
            
            var randomNumber = Int(arc4random_uniform(4) + 1)
            if musicalScore.isEmpty {
                musicalScore.append(randomNumber)
            } else {
                while musicalScore.last == randomNumber {
                    randomNumber = Int(arc4random_uniform(4) + 1)
                }
                musicalScore.append(randomNumber)
            }
            playCurrentLevel()
        }
    }
    func GameOver() {
        readyForUser = false
        print("cheguei no fim")
        print(readyForUser)
        disableButtons()
        level = 1
        timesPlayerTapped = 0
        currentItem = 0
        musicalScore = []
        start.isHidden = false
        view.addSubview(label)
        view.addSubview(artemisImageView)
        let over = GameOverController()
        navigationController?.pushViewController(over, animated: false)
        navigationController?.navigationBar.isHidden = true
    }
    
    
    func disableButtons(){
        faString.isUserInteractionEnabled = false
        solString.isUserInteractionEnabled = false
        laString.isUserInteractionEnabled = false
        siString.isUserInteractionEnabled = false
        //porque nao ta desabilitando depois que perde? essa é a pergunta do seculo
    }
    func enableButtons(){
        faString.isUserInteractionEnabled = true
        solString.isUserInteractionEnabled = true
        laString.isUserInteractionEnabled = true
        siString.isUserInteractionEnabled = true
    }
    func changeButtonsColor (tag: Int) {
        switch tag {
        case 1:
            resetButtonImage()
            faString.setImage(blueString, for: .normal)
        case 2:
            resetButtonImage()
            solString.setImage(purpleString, for: .normal)
        case 3:
            resetButtonImage()
            laString.setImage(redString, for: .normal)
        case 4:
            resetButtonImage()
            siString.setImage(greenString, for: .normal)
        default:
            break
        }
    }
    func resetButtonImage() {
        faString.setImage(normalString, for: .normal)
        solString.setImage(normalString, for: .normal)
        laString.setImage(normalString, for: .normal)
        siString.setImage(normalString, for: .normal)
    }
    public func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        if currentItem <= musicalScore.count - 1{
            playCurrentLevel()
        } else {
            readyForUser = true
            resetButtonImage()
            enableButtons()
        }
    }
    func addChilds() {
        view.addSubview(backgroundImageView)
        view.addSubview(artemisImageView)
        view.addSubview(label)
        view.addSubview(start)
        view.addSubview(lyraImageView)
        view.addSubview(faString)
        view.addSubview(solString)
        view.addSubview(laString)
        view.addSubview(siString)
        view.addSubview(lyra2ImageView)
    }
    
    func playSound() {
        let path1 = Bundle.main.path(forResource: "faLyra2", ofType: "wav")
        let soundFile = URL(fileURLWithPath: path1!)
        
        let path2 = Bundle.main.path(forResource: "solLyra2", ofType: "wav")
        let soundFile2 = URL(fileURLWithPath: path2!)
        
        let path3 = Bundle.main.path(forResource: "laLyra2", ofType: "wav")
        let soundFile3 = URL(fileURLWithPath: path3!)
        
        let path4 = Bundle.main.path(forResource: "siLyra2", ofType: "wav")
        let soundFile4 = URL(fileURLWithPath: path4!)
        do {
            try faPlayer = AVAudioPlayer(contentsOf: soundFile)
            try solPlayer = AVAudioPlayer(contentsOf: soundFile2)
            try laPlayer = AVAudioPlayer(contentsOf: soundFile3)
            try siPlayer = AVAudioPlayer(contentsOf: soundFile4)
        } catch {
            print(error)
        }
        faPlayer.delegate = self
        solPlayer.delegate = self
        laPlayer.delegate = self
        siPlayer.delegate = self
        
        faPlayer.numberOfLoops = 0
        solPlayer.numberOfLoops = 0
        laPlayer.numberOfLoops = 0
        siPlayer.numberOfLoops = 0
        
        
    }
}
