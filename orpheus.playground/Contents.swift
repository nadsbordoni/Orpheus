/*:
 
 # Orpheus
 
 ### Where did the idea came from?
 As a challenge, in my first year at the Apple Developer Academy, we had to do a project on the playgrounds. I had decided, still in design, that I would use music alongside challenges.
 
 At the same moment, the myth of Orpheus came to mind.
 The hero goes through several challenges and solves them all with his lyre.
 However, due to lack of programming knowledge, I was unable to finish the project.
 
 Now, in 2021, some friends encouraged me to finish this idea and apply for the WDDC.
 
 ### How it works?
 The game Orpheus aims to show the unfolding of the myth of our hero, while proposing challenges for the user to solve.
 
 The challenge lies in memorizing sounds and colors and the idea is that at each stage the number of instruments increases; since with each challenge overcome Orpheus receives a new instrument.
 
 For now, there is only one phase.

 **Always remember to pay attention to the sequence that will appear in the challenges, because, immediately after, you must repeat it in the correct order.**
 
 
 ### Quem sou eu
 
My name is Nádia, hi!
 
I am a law student at UFPE, and I also participate in the Apple Developer Academy.
 
But, calm down, let's go back a little bit.
Two years ago, I discovered that my vocation is the area of ​​technology. The only problem is that I was already halfway through law school and changing courses seemed crazy.
 
So I started little by little.
 
I learned a little by myself, I took a course or another from the computer science course ...
Until one day, a friend said to me:
*"Did you see that applications for the Apple Developer Academy are open? I think the project suits you completely."*
 
It turned out that, yes, it was really for me.
 
At the Apple developer academy, I learned more than I could ever imagine!
Practically all the assets of this game were made by hand, for example, with the knowledge that I acquired in a year and a half participating in this program. And, of course, the entire code was what I was able to acquire in that short period of time.
If I imagined making a game from scratch about a year ago? The answer is a simple no.
 
And yet, here I am sending my project to you at WWDC.
There is nothing more rewarding than that.
 
 
### Credits
 The game design was entirely done by me, as well as the musical notes used on the harp.
 However, the background music used in the prologue, the fonts used throughout the game, as well as the file that makes the live view scalable, were not made by me.
 
 Background Music:
 
 *Orpheus Odissey - Legends on Strings*
 Provided on Youtube by Meditation Musics with license CC BY (https://www.youtube.com/watch?v=_bYldqEjOUA)
 
 Fonts:
 
 *Bookeyed Nelson*
 Available free from Adobe for subscribers
 
 *Bebas Neue Regular*
 Provided by daFont
 (https://www.dafont.com/pt/bebas-neue.font)
 
 Swift file:
 
 *Scalable UiViewController*
 Provided by Alessandra Pereira with MIT license
 (https://github.com/alnp/Scalable-UIViewController-for-Playground)
 
*/

import UIKit
import PlaygroundSupport
import Foundation

let font = Bundle.main.url(forResource: "BebasNeue-Regular", withExtension: "ttf")! as CFURL
CTFontManagerRegisterFontsForURL(font, CTFontManagerScope.process, nil)


let start = MenuViewController(screenType: .ipad , isPortrait: false)
let navigation = UINavigationController()
navigation.pushViewController(start, animated: false)
navigation.navigationBar.isHidden = true
PlaygroundPage.current.liveView = navigation.scaleToFit()
