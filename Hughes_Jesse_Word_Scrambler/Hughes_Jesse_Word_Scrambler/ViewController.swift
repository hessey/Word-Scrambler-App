

import UIKit

class ViewController: UIViewController {
    


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    
    
    
    @IBOutlet weak var titleOutlet: UILabel!
    
    @IBOutlet weak var usernameOutlet: UITextField!
    
    @IBOutlet weak var playButton: UIButton!
    
    override func prepare(for segue: UIStoryboardSegue, sender:
        Any?) {
        var usernameController = segue.destination as! ViewController2
        usernameController.userName = usernameOutlet.text!
    }
    @IBAction func playAction(_ sender: Any) {
        if usernameOutlet.text !=  "" {
            performSegue(withIdentifier: "usernameSegue", sender: self)
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}

