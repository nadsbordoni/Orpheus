import Foundation
import UIKit
import PlaygroundSupport
import AVFoundation

var images: [String] = ["lovers_book.png", "babyOrpheus_book.png", "orpheus_book.png", "eurydice_book.png", "snake_book.png"]
var text: [String] = ["Our story begins with a romance and with a romance it ends. One blessed by the Fates, the other doomed to failure. \nOnce upon a time Calliope, the eldest of the nine muses - known for her beautiful voice and talent for epic poetry, science and oratory - caught the attention of her patron, Apollo, the god of the Sun, music, arts and healing.","Out of this love, Orpheus was born. \nFrom an early age, He proved to be very talented for the arts and, for this reason, He received a Lyre from his father. \nOrpheus learned to play it with extreme skill, to the point of enchanting even the most insensitive beings with its chords and melodies.", "Orpheus was able to enchant stones, soothe wild animals, make trees start to dance and interrupt the course of rivers. With his lyre, he managed to silence even the mermaids who tried to sink the Argo ship, thus saving the entire crew. \nBut his greatest achievement was to enchant Eurydice; not with the magic of his lyre and his music, but with his way of being.", "So begins our second novel, the tragic romance.\nHe became engaged to Eurydice, a forest nymph. \nAnd, I swear by Olympus and all the gods, they would have been happily ever after... If it weren't for the fact that Aristaeus, also in love with Eurydice, wanted to prevent her from getting married.", "On the day of her wedding with Orpheus, Eurydice was pursued by Aristaeus.\nTrying to escape, she was poisoned after stepping on a snake and, unfortunately, died.\nHopeless, Orpheus decided that He would do anything to bring Eurydice back to the world of the living.\nAnd that is how our adventure begins, down to the underworld."]
//imagens
let prologueBackground = UIImage(named: "bookBackground.png")
let rightArrowImage1 = UIImage(named: "rightButton.png")
let leftArrowImage1 = UIImage(named: "leftButton.png")

//inits
let rightArrow1 = UIButton()
let leftArrow1 = UIButton()
let prologueLabel = UILabel()
let prologueImagesView = UIImageView()
var backgroundMusic: AVAudioPlayer!

public class PrologueViewController: UIViewController {
    var counter: Int = 0
    
    let prologueBackgroundImageView = UIImageView(image: prologueBackground)
    
    public override func viewDidLoad() {
        playbackGroundMusic()
        view.backgroundColor = .white
        view.frame = CGRect(x: 0, y: 0, width: 1024, height: 768)
        prologueBackgroundImageView.frame = CGRect(x: 0, y: 0, width: 1024, height: 768)
        prologueImagesView.image = UIImage(named: images[0])
        prologueImagesView.frame = CGRect(x: 529, y: 107, width: 409.839, height: 549.9486)
        
        //label
        prologueLabel.frame = CGRect (x: 88, y: 117, width: 409.639, height: 549.9486)
        prologueLabel.text = text[0]
        prologueLabel.textAlignment = .justified
        prologueLabel.textColor = UIColor(.darkBlue)
        prologueLabel.font = UIFont(name: "BebasNeue-Regular", size: 37)
        prologueLabel.numberOfLines = 0
        prologueLabel.lineBreakMode = .byWordWrapping
        prologueLabel.sizeToFit()
        
        //buttons
        rightArrow1.frame = CGRect(x: 930, y: 369, width: 90, height: 85)
        rightArrow1.setImage(rightArrowImage1, for: .normal)
        rightArrow1.addTarget(self, action: #selector(self.rightButton), for: .touchUpInside)
        
        leftArrow1.frame = CGRect(x: 5, y: 369, width: 90, height: 85)
        leftArrow1.setImage(leftArrowImage1, for: .normal)
        leftArrow1.addTarget(self, action: #selector(self.leftButton), for: .touchUpInside)
        leftArrow1.isHidden = true
        
        addChilds()
        
    }
    @objc func rightButton(){
        if counter >= 0 && counter <= images.count{
            counter += 1
            if counter < images.count && counter >= 1 {
                leftArrow1.isHidden = false
                prologueLabel.text = text[counter]
                prologueImagesView.image = UIImage(named: images[counter])
                
            } else if counter == images.count {
                let firstFase = FirstFaseViewController()
                navigationController?.pushViewController(firstFase, animated: true)
                navigationController?.navigationBar.isHidden = true
                backgroundMusic.stop()
                
            }
        }
    }
    
    @objc func leftButton(){
        if counter >= 0 && counter <= images.count{
            counter -= 1
            if counter < images.count && counter >= 1 {
                
                prologueLabel.text = text[counter]
                prologueImagesView.image = UIImage(named: images[counter])
                leftArrow1.isHidden = false
                
            } else if counter == 0 {
                prologueLabel.text = text[counter]
                prologueImagesView.image = UIImage(named: images[counter])
                leftArrow1.isHidden = true
            }
        }
        
    }
    
    func addChilds(){
        view.addSubview(prologueBackgroundImageView)
        view.addSubview(prologueLabel)
        view.addSubview(prologueImagesView)
        view.addSubview(rightArrow1)
        view.addSubview(leftArrow1)
    }
    func playbackGroundMusic() {
        let url = Bundle.main.url(forResource: "backgroundOrpheus", withExtension: "wav")!
        
        do {
            backgroundMusic = try AVAudioPlayer(contentsOf: url)
            guard let backgroundMusic = backgroundMusic else { return }
            backgroundMusic.prepareToPlay()
            backgroundMusic.play()
        } catch let error {
            print(error)
        }
    }
}
