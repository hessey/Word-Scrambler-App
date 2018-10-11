

import UIKit

class ViewController2: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        imageO.isHidden = true
        checkO.isUserInteractionEnabled = false
        
            }
    
   class Player {
        var name = ""
        var points = 0
        
        init (name: String) {
            self.name = name
        }
        
        func addPoints(score: Int) {
            points = score
        }
    }
    
    
    class Categories {
        let category: String
        
        init(category: String) {
            self.category = category
        }
    }
    
    
    class Animals: Categories {
        let animals: [[String]]
        
        init(category: String, animals: [[String]]) {
            self.animals = animals
            super.init(category: category)
        }
    }
    
    var animalCategory = Animals(category: "Animals", animals: [["t","a","p","i","r"], ["m","o","n","k","e","y"], ["l","e","m","u","r"], ["f","r","o","g"], ["b","a","t"], ["b","e","a","r"], ["d","e","e","r"], ["s","q","u","i","r","r","e","l"],  ["h","a","m","s","t","e","r"],  ["s","l","o","t","h"]])
    
    class FruitsAndVeggies: Categories {
        let fruitsAndVeggies: [[String]]
        
        init(category: String, fruitsAndVeggies: [[String]] {
            self.fruitsAndVeggies = fruitsAndVeggies
            super.init(category: category)
        }
    }
    
    var fruitsCategory = FruitsAndVeggies(category: "Fruits and Vegetables", fruitsAndVeggies: [["a","p","p","l","e"], ["l","e","t","t","u","c","e"], ["p","e","a","r"], ["p","e","a","s"], ["c","o","r","n"], ["m","e","l","o","n"], ["c","a","r","r","o","t"], ["a","p","r","i","c","o","t"], ["a","v","o","c","a","d","o"],["b","a","n","a","n","a"]])
    
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var leaderboardTakeName = segue.destination as! LeaderboardViewController
        leaderboardTakeName.incomingPlayerName = userName
        var leaderboardTakeScore = segue.destination as! LeaderboardViewController
        leaderboardTakeScore.incomingScore = wordScore
    }
    
    
    @IBAction func toLeaderboardAction(_ sender: Any) {
        if wordScore != 0 {
            performSegue(withIdentifier: "leaderboardSegueGame", sender: self)
        }
    }
    
    

    
    @IBOutlet weak var playO: UIButton!
    
    @IBOutlet weak var checkO: UIButton!
    
    
    @IBOutlet weak var b1: UIButton!
    
    
    @IBOutlet weak var b2: UIButton!
    
    
    @IBOutlet weak var b3: UIButton!
    
    
    @IBOutlet weak var b4: UIButton!
    
    
    @IBOutlet weak var b5: UIButton!
    
    
    @IBOutlet weak var b6: UIButton!
    
    
    @IBOutlet weak var b7: UIButton!
    
    
    @IBOutlet weak var b8: UIButton!
    
    @IBOutlet weak var category: UILabel!
    
    @IBOutlet weak var hintO: UIButton!
    
    @IBOutlet weak var answer: UILabel!
    
    @IBOutlet weak var checkAnswer: UILabel!
    
    @IBOutlet weak var imageO: UIImageView!
    
    
    
    lazy var buttons: [UIButton] = [b1, b2, b3, b4, b5, b6, b7, b8]
    var answer1: String = ""
    var buttonLetter: [String] = []
    var currentWord: [String] = []
    var checkAnswer1 = ""
    var array3: [String] = []
    var array4: [String] = []
    var array5: [String] = []
    var x = 0
    var wordScore = 0
    var userName = ""
    var tapir = false
    var word6: [String] = ["t", "a" , "p", "i", "r"]
    var presses = 0
    
    
    
    @IBAction func playA(_ sender: Any) {
     
        var word: [String] = ["a","p", "p", "l", "e"]
        var word2: [String] = ["l", "e", "t", "t", "u", "c", "e"]
        var word3: [String] = ["s", "q", "u", "a", "r", "e"]
        var word4: [String] = ["t", "r", "i", "a", "n", "g", "l", "e"]
        
      //  var word6: [String] = ["t", "a" , "p", "i", "r"]

        
        var Fruits: [[String]] = [word, word2]
        var Shapes: [[String]] = [word3, word4]
        var Animals: [[String]] = [word6]
        
        var categories: [[[String]]] = [Fruits, Shapes,Animals]

        
      //  var arrays: [Any] = [Fruits, Shapes, categories]
        var array2: [String] = []
        let aScalars = "a".unicodeScalars
        let aCode = aScalars[aScalars.startIndex].value
        
        let letters: [String] = (0..<26).map {
            i in String(UnicodeScalar(aCode + i)!)
        }
        
        func addCharacters (word:[String]) -> [String] {
            if tapir == true {
                tapir = false
                imageO.isHidden = true
                playO.backgroundColor = nil
            }
            array5.removeAll()
           array4.removeAll()
            array4.append(contentsOf: word)
         array3.removeAll()
            array2.removeAll()
            x = 8 - word.count
            var array1: [String]
            array1 = letters.shuffled()
 
            while x > 0 {
                array2.append(array1[0])
                array5.append(array1[0])
                array1.remove(at: 0)
                x -= 1
            }
            array2.append(contentsOf: word)
            array2.shuffle()
            return array2
        }
        //shuffling
        var categoryNumber = arc4random_uniform(3)
        func makeCategory(number:Int) {
            switch number {
            case 0:
                category.text = "Fruits and Vegetables"
            case 1:
                category.text = "Shapes"
            default:
                category.text = "Shapes"
            }
        }
        makeCategory(number: Int(categoryNumber))
        categories[Int(categoryNumber)].shuffle()
        
       
       
        
       var number = arc4random_uniform(3)
        answer.text = ""
        answer1 = ""
        buttonLetter.removeAll()
      //  addCharacters(word: categories[Int(categoryNumber)][0])
        addCharacters(word: Animals[Int(number)])
      //  currentWord = categories[0][0]
        for index in buttons {
            index.setTitle(array2[0], for: .normal)
            buttonLetter.append(array2[0])
            array2.remove(at: 0)
            index.setTitleColor(UIColor.black, for: .normal)
            index.backgroundColor = UIColor.green
            index.isUserInteractionEnabled = true
            index.isEnabled = true
        }
      /*  for index in array4 {
            checkAnswer1 += "\(index)"
        }*/
     
    }
    
    
    @IBAction func checkA(_ sender: Any) {
        checkO.isUserInteractionEnabled = false
        if array4 == array3 && array4 != [""] {
            if array4 == word6 {
                imageO.isHidden = false
                func flipAnimation (Card: UIImageView) {
                    UIView.transition(with: Card, duration: 0.75, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                }
                func unflipAnimation (Card: UIImageView) {
                    UIView.transition(with: Card, duration: 0.75, options: .transitionFlipFromRight, animations: nil, completion: nil)
                }
                flipAnimation(Card: imageO)
                playO.backgroundColor = UIColor.lightGray
                tapir = true
                //unflipAnimation(Card: imageO)
            }
            checkAnswer.text = "Correct"
            wordScore += 20
            var player1 = Player(name: userName)
            player1.addPoints(score: wordScore)
           answer.text = String(player1.points)
            category.text = player1.name
            
        } else if array4 != array3 {
            checkAnswer.text = "Incorrect"
         wordScore -= 2
            var player1 = Player(name: userName)
            player1.addPoints(score: wordScore)
            answer.text = String(player1.points)
            category.text = player1.name
        }
    }
    
    @IBAction func hintA(_ sender: Any) {
        while array5.count < buttonLetter.count {
            for index in buttonLetter {
                if array5.contains(buttonLetter[0]) != true {
                    b1.isUserInteractionEnabled = false
                    b1.isEnabled = false
                    b1.backgroundColor = UIColor.darkGray
                } else if array5.contains(buttonLetter[1]) != true {
                    b2.isUserInteractionEnabled = false
                    b2.isEnabled = false
                    b2.backgroundColor = UIColor.darkGray
                } else if array5.contains(buttonLetter[2]) != true {
                    b3.isUserInteractionEnabled = false
                    b3.isEnabled = false
                    b3.backgroundColor = UIColor.darkGray
                } else if array5.contains(buttonLetter[3]) != true {
                    b4.isUserInteractionEnabled = false
                    b4.isEnabled = false
                    b4.backgroundColor = UIColor.darkGray
                } else if array5.contains(buttonLetter[4]) != true {
                    b5.isUserInteractionEnabled = false
                    b5.isEnabled = false
                    b5.backgroundColor = UIColor.darkGray
                } else if array5.contains(buttonLetter[5]) != true {
                    b6.isUserInteractionEnabled = false
                    b6.isEnabled = false
                    b6.backgroundColor = UIColor.darkGray
                } else if array5.contains(buttonLetter[6]) != true {
                    b7.isUserInteractionEnabled = false
                    b7.isEnabled = false
                    b7.backgroundColor = UIColor.darkGray
                } else if array5.contains(buttonLetter[7]) != true {
                    b8.isUserInteractionEnabled = false
                    b8.isEnabled = false
                    b8.backgroundColor = UIColor.darkGray
                }
            }
        }
       

    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    @IBAction func b1(_ sender: Any) {
          presses += 1
        if presses > 0 {
            checkO.isUserInteractionEnabled = true
        }
        answer1 +=  "\(buttonLetter[0])"
        array3.append(buttonLetter[0])
        
        answer.text = answer1
        b1.isUserInteractionEnabled = false
        b1.isEnabled = false
        b1.backgroundColor = UIColor.lightGray
    }
    
    @IBAction func b2(_ sender: Any) {
          presses += 1
        if presses > 0 {
            checkO.isUserInteractionEnabled = true
        }
        answer1 +=  "\(buttonLetter[1])"
        array3.append(buttonLetter[1])
        answer.text = answer1
        b2.isUserInteractionEnabled = false
        b2.isEnabled = false
        b2.backgroundColor = UIColor.lightGray
    }
    
    @IBAction func b3(_ sender: Any) {
          presses += 1
        if presses > 0 {
            checkO.isUserInteractionEnabled = true
        }
        answer1 +=  "\(buttonLetter[2])"
        array3.append(buttonLetter[2])
        answer.text = answer1
        b3.isUserInteractionEnabled = false
        b3.isEnabled = false
        b3.backgroundColor = UIColor.lightGray
    }
    
    
    @IBAction func b4(_ sender: Any) {
          presses += 1
        if presses > 0 {
            checkO.isUserInteractionEnabled = true
        }
        answer1 +=  "\(buttonLetter[3])"
        array3.append(buttonLetter[3])
        answer.text = answer1
        b4.isUserInteractionEnabled = false
        b4.isEnabled = false
        b4.backgroundColor = UIColor.lightGray
    }
    
    @IBAction func b5(_ sender: Any) {
          presses += 1
        if presses > 0 {
            checkO.isUserInteractionEnabled = true
        }
        answer1 +=  "\(buttonLetter[4])"
        array3.append(buttonLetter[4])
        answer.text = answer1
         b5.isUserInteractionEnabled = false
        b5.isEnabled = false
        b5.backgroundColor = UIColor.lightGray
        
    }
    
    @IBAction func b6(_ sender: Any) {
          presses += 1
        if presses > 0 {
            checkO.isUserInteractionEnabled = true
        }
        answer1 +=  "\(buttonLetter[5])"
        array3.append(buttonLetter[5])
        answer.text = answer1
         b6.isUserInteractionEnabled = false
        b6.isEnabled = false
        b6.backgroundColor = UIColor.lightGray
    }
    
    @IBAction func b7(_ sender: Any) {
          presses += 1
        if presses > 0 {
            checkO.isUserInteractionEnabled = true
        }
        answer1 +=  "\(buttonLetter[6])"
        array3.append(buttonLetter[6])
        answer.text = answer1
         b7.isUserInteractionEnabled = false
        b7.isEnabled = false
        b7.backgroundColor = UIColor.lightGray
    }
    
    @IBAction func b8(_ sender: Any) {
        presses += 1
        if presses > 0 {
            checkO.isUserInteractionEnabled = true
        }
        answer1 +=  "\(buttonLetter[7])"
        array3.append(buttonLetter[7])
        answer.text = answer1
         b8.isUserInteractionEnabled = false
        b8.isEnabled = false
        b8.backgroundColor = UIColor.lightGray
    }
    
    
    
    
    

}
