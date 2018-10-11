
import UIKit

class LeaderboardViewController: UIViewController {
    
    @IBOutlet weak var firstPlaceName: UILabel!
    @IBOutlet weak var secondPlaceName: UILabel!
    @IBOutlet weak var thirdPlaceName: UILabel!
    @IBOutlet weak var fourthPlaceName: UILabel!
    @IBOutlet weak var fifthPlaceName: UILabel!
    
    @IBOutlet weak var firstPlaceScore: UILabel!
    @IBOutlet weak var secondPlaceScore: UILabel!
    @IBOutlet weak var thirdPlaceScore: UILabel!
    @IBOutlet weak var fourthPlaceScore: UILabel!
    @IBOutlet weak var fifthPlaceScore: UILabel!
    
    
    var incomingScore: Int = -1000
    var incomingPlayerName = ""
    var leaderboardTest: [Int] = [-999,-999,-999,-999,-999]
    var leaderboardNames: [String] = ["----", "----", "----", "----", "----"]
    
    func updateScores() {
        if incomingScore >= leaderboardTest[4] {
            leaderboardTest.insert(incomingScore, at: 5)
            leaderboardTest.remove(at: 0)
            leaderboardNames.insert(incomingPlayerName, at: 5)
            leaderboardNames.remove(at: 0)
            firstPlaceName.text = incomingPlayerName
            firstPlaceScore.text = String(incomingScore)
        } else if incomingScore < leaderboardTest[4] && incomingScore >= leaderboardTest[3] {
            leaderboardTest.insert(incomingScore, at: 4)
            leaderboardTest.remove(at: 0)
            leaderboardNames.insert(incomingPlayerName, at: 4)
            leaderboardNames.remove(at: 0)
            secondPlaceName.text = incomingPlayerName
            secondPlaceScore.text = String(incomingScore)
        } else if incomingScore < leaderboardTest[3] && incomingScore >= leaderboardTest[2] {
            leaderboardTest.insert(incomingScore, at: 3)
            leaderboardTest.remove(at: 0)
            leaderboardNames.insert(incomingPlayerName, at: 3)
            leaderboardNames.remove(at: 0)
            thirdPlaceName.text = incomingPlayerName
            thirdPlaceScore.text = String(incomingScore)
        } else if incomingScore < leaderboardTest[2] && incomingScore >= leaderboardTest[1] {
            leaderboardTest.insert(incomingScore, at: 2)
            leaderboardTest.remove(at: 0)
            leaderboardNames.insert(incomingPlayerName, at: 2)
            leaderboardNames.remove(at: 0)
            fourthPlaceName.text = incomingPlayerName
            fourthPlaceScore.text = String(incomingScore)
        } else if incomingScore < leaderboardTest[1] && incomingScore >= leaderboardTest[0] {
            leaderboardTest.insert(incomingScore, at: 1)
            leaderboardTest.remove(at: 0)
            leaderboardNames.insert(incomingPlayerName, at: 1)
            leaderboardNames.remove(at: 0)
            fifthPlaceName.text = incomingPlayerName
            fifthPlaceScore.text = String(incomingScore)
        } else {
            print("Bad code")
        }
        firstPlaceName.text  = leaderboardNames[4]
        secondPlaceName.text = leaderboardNames[3]
        thirdPlaceName.text = leaderboardNames[2]
        fourthPlaceName.text = leaderboardNames[1]
        fifthPlaceName.text = leaderboardNames[0]
        
        firstPlaceScore.text = String(leaderboardTest[4])
        secondPlaceScore.text = String(leaderboardTest[3])
        thirdPlaceScore.text = String(leaderboardTest[2])
        fourthPlaceScore.text = String(leaderboardTest[1])
        fifthPlaceScore.text = String(leaderboardTest[0])
    }
    
    @IBOutlet weak var updateScoresOutlet: UIButton!
    @IBAction func updateScoresAction(_ sender: Any) {
        updateScores()
        saveData()
        updateScoresOutlet.isUserInteractionEnabled = false
    }
    
    var allStoredData = UserDefaults.standard
    
    func saveData() {
        allStoredData.set(leaderboardTest, forKey: "saveLeaderboardTest")
        allStoredData.set(leaderboardNames, forKey: "saveLeaderboardNames")
    }
    
    func loadData() {
        if let loadLeaderboardTest: [Int] = UserDefaults.standard.value(forKey: "saveLeaderboardTest") as? [Int] {
            leaderboardTest = loadLeaderboardTest
        }
        if let loadLeaderboardNames: [String] = UserDefaults.standard.value(forKey: "saveLeaderboardNames") as? [String] {
            leaderboardNames = loadLeaderboardNames
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        firstPlaceName.text  = leaderboardNames[4]
        secondPlaceName.text = leaderboardNames[3]
        thirdPlaceName.text = leaderboardNames[2]
        fourthPlaceName.text = leaderboardNames[1]
        fifthPlaceName.text = leaderboardNames[0]
        
        firstPlaceScore.text = String(leaderboardTest[4])
        secondPlaceScore.text = String(leaderboardTest[3])
        thirdPlaceScore.text = String(leaderboardTest[2])
        fourthPlaceScore.text = String(leaderboardTest[1])
        fifthPlaceScore.text = String(leaderboardTest[0])
    
        // Do any additional setup after loading the view.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
